import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum_testing/main.dart';

void main() {
  // Pengujian untuk widget MyApp
  testWidgets('MyApp Widget Test', (WidgetTester tester) async {
    // Bangun aplikasi kita dan picu suatu frame.
    await tester.pumpWidget(const MyApp());

    // Verifikasi bahwa judul ditampilkan.
    expect(find.text('Interactive Widget'), findsOneWidget);

    // Verifikasi bahwa teks "Date Picker" ditampilkan.
    expect(find.text('Date Picker'), findsOneWidget);

    // Verifikasi bahwa teks "Color Picker" ditampilkan.
    expect(find.text('Color Picker'), findsOneWidget);
  });

  // Pengujian untuk widget AdvanceForm
  testWidgets('AdvanceForm Widget Test', (WidgetTester tester) async {
    // Bangun aplikasi kita dan picu suatu frame.
    await tester.pumpWidget(const MaterialApp(
      home: AdvanceForm(),
    ));

    // Verifikasi bahwa teks "Create New Contacts" ditampilkan.
    expect(find.text('Create New Contacts'), findsOneWidget);

    // Verifikasi bahwa teks "List Contacts" ditampilkan.
    expect(find.text('List Contacts'), findsOneWidget);
  });
}
