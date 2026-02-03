import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/screens/home_screen.dart';
import 'core/security/root_detection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Perform root detection
  final rootResult = await RootDetection.checkRoot();
  
  runApp(
    ProviderScope(
      child: SCSIApp(rootDetectionResult: rootResult),
    ),
  );
}

class SCSIApp extends StatelessWidget {
  final RootDetectionResult rootDetectionResult;
  
  const SCSIApp({
    super.key,
    required this.rootDetectionResult,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCSI - Smart Crime Scene Investigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0), // Police blue
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: HomeScreen(rootDetectionResult: rootDetectionResult),
    );
  }
}
