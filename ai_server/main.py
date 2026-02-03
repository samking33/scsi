from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from io import BytesIO
from PIL import Image
from ultralytics import YOLO

app = FastAPI(title="SCSI AI Server")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Extreme accuracy model (largest, slowest). Replace with a custom fine-tuned model if available.
model = YOLO("yolov8x.pt")

VEHICLE_CLASSES = {
    "bicycle",
    "car",
    "motorcycle",
    "bus",
    "truck",
}


def map_category(label: str) -> str:
    label = label.lower()
    if label == "person":
        return "person"
    if label in VEHICLE_CLASSES:
        return "vehicle"
    return "unknown"


@app.post("/detect")
async def detect(image: UploadFile = File(...)):
    payload = await image.read()
    img = Image.open(BytesIO(payload)).convert("RGB")
    width, height = img.size

    results = model(img, verbose=False)[0]
    detections = []

    for box, cls_idx, conf in zip(
        results.boxes.xyxy.tolist(),
        results.boxes.cls.tolist(),
        results.boxes.conf.tolist(),
    ):
        x1, y1, x2, y2 = box
        label = results.names[int(cls_idx)]
        detections.append(
            {
                "category": map_category(label),
                "label": label,
                "confidence": float(conf),
                "bbox": [
                    x1 / width,
                    y1 / height,
                    x2 / width,
                    y2 / height,
                ],
                "normalized": True,
            }
        )

    return {"detections": detections}
