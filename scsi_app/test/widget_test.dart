// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';
import 'package:scsi_app/core/security/root_detection.dart';
import 'package:scsi_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const rootResult = RootDetectionResult(
      isRooted: false,
      indicators: [],
    );
    
    await tester.pumpWidget(SCSIApp(rootDetectionResult: rootResult));

    // Verify that the home screen is shown
    expect(find.text('SCSI'), findsOneWidget);
  });
}
