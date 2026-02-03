import 'package:flutter/material.dart';
import 'package:scsi/features/case_management/presentation/pages/case_home_page.dart';

class ScsiApp extends StatelessWidget {
  const ScsiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart CSI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B2A41)),
        useMaterial3: true,
      ),
      home: const CaseHomePage(),
    );
  }
}
