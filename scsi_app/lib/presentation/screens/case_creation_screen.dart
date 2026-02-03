import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/repository_providers.dart';
import '../../data/datasources/location_tracker.dart';
import '../../domain/entities/case.dart';
import 'active_investigation_screen.dart';

/// Case creation screen
class CaseCreationScreen extends ConsumerStatefulWidget {
  const CaseCreationScreen({super.key});

  @override
  ConsumerState<CaseCreationScreen> createState() => _CaseCreationScreenState();
}

class _CaseCreationScreenState extends ConsumerState<CaseCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _locationTracker = LocationTracker();
  
  // Form controllers
  final _officerIdController = TextEditingController();
  final _officerNameController = TextEditingController();
  final _badgeNumberController = TextEditingController();
  final _caseTypeController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  Position? _currentPosition;
  bool _isLoadingLocation = false;
  bool _isCreatingCase = false;
  
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
  
  @override
  void dispose() {
    _officerIdController.dispose();
    _officerNameController.dispose();
    _badgeNumberController.dispose();
    _caseTypeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  
  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });
    
    try {
      final position = await _locationTracker.getCurrentLocation();
      setState(() {
        _currentPosition = position;
        _isLoadingLocation = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingLocation = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to get location: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  
  Future<void> _createCase() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    if (_currentPosition == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Waiting for GPS location...'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    
    // Request all required permissions
    final permissions = await _requestPermissions();
    if (!permissions) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('All permissions are required to start investigation'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }
    
    setState(() {
      _isCreatingCase = true;
    });
    
    try {
      // Create case entity
      final now = DateTime.now().toUtc();
      final timezoneOffset = now.timeZoneOffset.toString();
      
      final newCase = Case(
        id: const Uuid().v4(),
        officerId: _officerIdController.text.trim(),
        officerName: _officerNameController.text.trim(),
        officerBadgeNumber: _badgeNumberController.text.trim(),
        caseType: _caseTypeController.text.trim(),
        description: _descriptionController.text.trim(),
        startTime: now,
        latitude: _currentPosition!.latitude,
        longitude: _currentPosition!.longitude,
        locationAddress: 'Lat: ${_currentPosition!.latitude.toStringAsFixed(6)}, '
                        'Lon: ${_currentPosition!.longitude.toStringAsFixed(6)}',
        status: CaseStatus.active,
        timezoneOffset: timezoneOffset,
      );
      
      // Save case to database
      await ref.read(caseRepositoryProvider).createCase(newCase);
      
      // Navigate to active investigation screen
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ActiveInvestigationScreen(case_: newCase),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isCreatingCase = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create case: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  
  Future<bool> _requestPermissions() async {
    final camera = await Permission.camera.request();
    final microphone = await Permission.microphone.request();
    final location = await Permission.location.request();
    final notification = await Permission.notification.request();
    
    return camera.isGranted && 
           microphone.isGranted && 
           location.isGranted &&
           notification.isGranted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Investigation'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Officer Information Section
                Text(
                  'Officer Information',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _officerIdController,
                  decoration: const InputDecoration(
                    labelText: 'Officer ID',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.badge),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Officer ID is required';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _officerNameController,
                  decoration: const InputDecoration(
                    labelText: 'Officer Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Officer name is required';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _badgeNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Badge Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.shield),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Badge number is required';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Case Information Section
                Text(
                  'Case Information',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _caseTypeController,
                  decoration: const InputDecoration(
                    labelText: 'Case Type',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.category),
                    hintText: 'e.g., Theft, Assault, etc.',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Case type is required';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description),
                    hintText: 'Brief description of the investigation',
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Location Section
                Text(
                  'Location',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _isLoadingLocation
                        ? const Row(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(width: 16),
                              Text('Getting GPS location...'),
                            ],
                          )
                        : _currentPosition != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, color: Colors.green),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'GPS Location Acquired',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text('Latitude: ${_currentPosition!.latitude.toStringAsFixed(6)}'),
                                  Text('Longitude: ${_currentPosition!.longitude.toStringAsFixed(6)}'),
                                  Text('Accuracy: ${_currentPosition!.accuracy.toStringAsFixed(1)}m'),
                                ],
                              )
                            : Row(
                                children: [
                                  const Icon(Icons.location_off, color: Colors.red),
                                  const SizedBox(width: 8),
                                  const Expanded(
                                    child: Text('Location not available'),
                                  ),
                                  TextButton(
                                    onPressed: _getCurrentLocation,
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Start Investigation Button
                ElevatedButton.icon(
                  onPressed: _isCreatingCase ? null : _createCase,
                  icon: _isCreatingCase
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.play_arrow),
                  label: Text(
                    _isCreatingCase ? 'Starting...' : 'Start Investigation',
                    style: const TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
