import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import '../../core/constants/app_constants.dart';
import '../../core/error/exceptions.dart';
import '../../domain/entities/evidence.dart';

/// YOLO object detector using TensorFlow Lite
/// Performs on-device inference for evidence classification
class YoloDetector {
  static YoloDetector? _instance;
  Interpreter? _interpreter;
  bool _isInitialized = false;
  
  // COCO dataset class names (80 classes)
  static const List<String> _classNames = [
    'person', 'bicycle', 'car', 'motorcycle', 'airplane', 'bus', 'train', 'truck', 'boat',
    'traffic light', 'fire hydrant', 'stop sign', 'parking meter', 'bench', 'bird', 'cat',
    'dog', 'horse', 'sheep', 'cow', 'elephant', 'bear', 'zebra', 'giraffe', 'backpack',
    'umbrella', 'handbag', 'tie', 'suitcase', 'frisbee', 'skis', 'snowboard', 'sports ball',
    'kite', 'baseball bat', 'baseball glove', 'skateboard', 'surfboard', 'tennis racket',
    'bottle', 'wine glass', 'cup', 'fork', 'knife', 'spoon', 'bowl', 'banana', 'apple',
    'sandwich', 'orange', 'broccoli', 'carrot', 'hot dog', 'pizza', 'donut', 'cake', 'chair',
    'couch', 'potted plant', 'bed', 'dining table', 'toilet', 'tv', 'laptop', 'mouse',
    'remote', 'keyboard', 'cell phone', 'microwave', 'oven', 'toaster', 'sink', 'refrigerator',
    'book', 'clock', 'vase', 'scissors', 'teddy bear', 'hair drier', 'toothbrush'
  ];
  
  YoloDetector._();
  
  factory YoloDetector() {
    _instance ??= YoloDetector._();
    return _instance!;
  }
  
  /// Initialize the YOLO model
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      // Load TFLite model
      _interpreter = await Interpreter.fromAsset(
        AppConstants.yoloModelPath,
        options: InterpreterOptions()
          ..threads = 4 // Use 4 threads for faster inference
          ..useNnApiForAndroid = true, // Use Android Neural Networks API if available
      );
      
      _isInitialized = true;
    } catch (e) {
      throw InferenceException(
        'Failed to initialize YOLO model',
        originalError: e,
      );
    }
  }
  
  /// Detect objects in an image
  Future<List<Detection>> detectObjects(Uint8List imageBytes) async {
    if (!_isInitialized) {
      await initialize();
    }
    
    try {
      // Decode image
      final image = img.decodeImage(imageBytes);
      if (image == null) {
        throw InferenceException('Failed to decode image');
      }
      
      // Preprocess image
      final input = _preprocessImage(image);
      
      // Prepare output buffers
      // YOLOv8 output shape: [1, 84, 8400]
      // 84 = 4 (bbox) + 80 (classes)
      final output = List.generate(
        1,
        (_) => List.generate(
          84,
          (_) => List<double>.filled(8400, 0),
        ),
      );
      
      // Run inference
      final startTime = DateTime.now();
      _interpreter!.run(input, output);
      final inferenceTime = DateTime.now().difference(startTime);
      
      // Post-process outputs
      final detections = _postprocessOutput(
        output[0],
        image.width,
        image.height,
      );
      
      return detections;
    } catch (e) {
      if (e is InferenceException) rethrow;
      throw InferenceException(
        'Failed to detect objects',
        originalError: e,
      );
    }
  }
  
  /// Preprocess image for YOLO input
  /// Resize to 640x640 and normalize to [0, 1]
  List<List<List<List<double>>>> _preprocessImage(img.Image image) {
    // Resize image to model input size
    final resized = img.copyResize(
      image,
      width: AppConstants.yoloInputSize,
      height: AppConstants.yoloInputSize,
    );
    
    // Convert to normalized float array [1, 640, 640, 3]
    final input = List.generate(
      1,
      (_) => List.generate(
        AppConstants.yoloInputSize,
        (y) => List.generate(
          AppConstants.yoloInputSize,
          (x) {
            final pixel = resized.getPixel(x, y);
            return [
              pixel.r / 255.0,
              pixel.g / 255.0,
              pixel.b / 255.0,
            ];
          },
        ),
      ),
    );
    
    return input;
  }
  
  /// Post-process YOLO output
  /// Apply confidence threshold and NMS (Non-Maximum Suppression)
  List<Detection> _postprocessOutput(
    List<List<double>> output,
    int imageWidth,
    int imageHeight,
  ) {
    final detections = <Detection>[];
    
    // Iterate through all predictions
    for (int i = 0; i < 8400; i++) {
      // Get bounding box coordinates (first 4 values)
      final x = output[0][i];
      final y = output[1][i];
      final w = output[2][i];
      final h = output[3][i];
      
      // Get class scores (next 80 values)
      double maxScore = 0;
      int maxClass = 0;
      
      for (int c = 0; c < 80; c++) {
        final score = output[4 + c][i];
        if (score > maxScore) {
          maxScore = score;
          maxClass = c;
        }
      }
      
      // Filter by confidence threshold
      if (maxScore >= AppConstants.yoloConfidenceThreshold) {
        // Normalize coordinates to [0, 1]
        final normalizedX = x / AppConstants.yoloInputSize;
        final normalizedY = y / AppConstants.yoloInputSize;
        final normalizedW = w / AppConstants.yoloInputSize;
        final normalizedH = h / AppConstants.yoloInputSize;
        
        detections.add(Detection(
          className: _classNames[maxClass],
          confidence: maxScore,
          boundingBox: BoundingBox(
            x: normalizedX,
            y: normalizedY,
            width: normalizedW,
            height: normalizedH,
          ),
        ));
      }
    }
    
    // Apply Non-Maximum Suppression
    final nmsDetections = _applyNMS(detections);
    
    // Limit to max detections
    if (nmsDetections.length > AppConstants.yoloMaxDetections) {
      return nmsDetections.sublist(0, AppConstants.yoloMaxDetections);
    }
    
    return nmsDetections;
  }
  
  /// Apply Non-Maximum Suppression to remove overlapping boxes
  List<Detection> _applyNMS(List<Detection> detections) {
    // Sort by confidence (descending)
    detections.sort((a, b) => b.confidence.compareTo(a.confidence));
    
    final selected = <Detection>[];
    final suppressed = <bool>[];
    
    for (int i = 0; i < detections.length; i++) {
      suppressed.add(false);
    }
    
    for (int i = 0; i < detections.length; i++) {
      if (suppressed[i]) continue;
      
      selected.add(detections[i]);
      
      for (int j = i + 1; j < detections.length; j++) {
        if (suppressed[j]) continue;
        
        // Calculate IoU (Intersection over Union)
        final iou = _calculateIoU(
          detections[i].boundingBox,
          detections[j].boundingBox,
        );
        
        if (iou > AppConstants.yoloIouThreshold) {
          suppressed[j] = true;
        }
      }
    }
    
    return selected;
  }
  
  /// Calculate Intersection over Union between two bounding boxes
  double _calculateIoU(BoundingBox box1, BoundingBox box2) {
    // Convert center coordinates to corner coordinates
    final box1Left = box1.x - box1.width / 2;
    final box1Right = box1.x + box1.width / 2;
    final box1Top = box1.y - box1.height / 2;
    final box1Bottom = box1.y + box1.height / 2;
    
    final box2Left = box2.x - box2.width / 2;
    final box2Right = box2.x + box2.width / 2;
    final box2Top = box2.y - box2.height / 2;
    final box2Bottom = box2.y + box2.height / 2;
    
    // Calculate intersection area
    final intersectLeft = box1Left > box2Left ? box1Left : box2Left;
    final intersectRight = box1Right < box2Right ? box1Right : box2Right;
    final intersectTop = box1Top > box2Top ? box1Top : box2Top;
    final intersectBottom = box1Bottom < box2Bottom ? box1Bottom : box2Bottom;
    
    if (intersectRight < intersectLeft || intersectBottom < intersectTop) {
      return 0.0;
    }
    
    final intersectArea = (intersectRight - intersectLeft) * (intersectBottom - intersectTop);
    
    // Calculate union area
    final box1Area = box1.width * box1.height;
    final box2Area = box2.width * box2.height;
    final unionArea = box1Area + box2Area - intersectArea;
    
    return intersectArea / unionArea;
  }
  
  /// Dispose of resources
  void dispose() {
    _interpreter?.close();
    _interpreter = null;
    _isInitialized = false;
  }
}
