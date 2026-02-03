import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/security/root_detection.dart';
import 'case_creation_screen.dart';

/// Home screen - Main dashboard
class HomeScreen extends StatefulWidget {
  final RootDetectionResult rootDetectionResult;
  
  const HomeScreen({
    super.key,
    required this.rootDetectionResult,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    
    // Show root detection warning if device is rooted
    if (widget.rootDetectionResult.isRooted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showRootWarning();
      });
    }
  }
  
  void _showRootWarning() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            SizedBox(width: 8),
            Text('Security Warning'),
          ],
        ),
        content: Text(widget.rootDetectionResult.message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('I Understand'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Prevent screenshots on this screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SCSI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'SCSI',
                applicationVersion: '1.0.0',
                applicationLegalese: 'Smart Crime Scene Investigation App\n\n'
                    'Production-ready forensic evidence collection system\n'
                    'for law enforcement.\n\n'
                    '© 2026 All rights reserved.',
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header card
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.shield,
                        size: 64,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Smart Crime Scene Investigation',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Court-admissible evidence collection system',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Quick actions
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // New Investigation button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CaseCreationScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.add_circle_outline, size: 28),
                label: const Text(
                  'Start New Investigation',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // View cases button
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cases list - Coming soon'),
                    ),
                  );
                },
                icon: const Icon(Icons.folder_open, size: 28),
                label: const Text(
                  'View Cases',
                  style: TextStyle(fontSize: 18),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
              ),
              
              const Spacer(),
              
              // Security status
              Card(
                color: widget.rootDetectionResult.isRooted 
                    ? Colors.orange.shade50 
                    : Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        widget.rootDetectionResult.isRooted 
                            ? Icons.warning 
                            : Icons.check_circle,
                        color: widget.rootDetectionResult.isRooted 
                            ? Colors.orange 
                            : Colors.green,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.rootDetectionResult.isRooted
                              ? 'Root access detected'
                              : 'Device security: OK',
                          style: TextStyle(
                            color: widget.rootDetectionResult.isRooted 
                                ? Colors.orange.shade900 
                                : Colors.green.shade900,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
