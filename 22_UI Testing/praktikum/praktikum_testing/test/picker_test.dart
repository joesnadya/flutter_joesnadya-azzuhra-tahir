import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:praktikum_testing/screen/picker.dart';

void main() {
  // Pengelompokkan pengujian widget Picker
  group('Picker Widget Tests', () {
    // Pengujian untuk DatePicker
    testWidgets('DatePicker Test', (WidgetTester tester) async {
      // Bangun aplikasi dan picu suatu frame.
      await tester.pumpWidget(
        const MaterialApp(
          home: Picker(),
        ),
      );

      // Verifikasi bahwa teks 'Pilih Tanggal' ditampilkan.
      expect(find.text('Pilih Tanggal'), findsOneWidget);

      // Ketuk tombol 'Pilih Tanggal'.
      await tester.tap(find.text('Pilih Tanggal'));
      await tester.pumpAndSettle();

      // Verifikasi bahwa date picker ditampilkan dengan benar.
      expect(
        find.text(DateFormat('yyyy-MM-dd').format(DateTime.now())),
        findsOneWidget,
      );
    });

    // Pengujian untuk ColorPicker
    testWidgets('ColorPicker Test', (WidgetTester tester) async {
      // Bangun aplikasi dan picu suatu frame.
      await tester.pumpWidget(
        const MaterialApp(
          home: Picker(),
        ),
      );

      // Verifikasi bahwa terdapat tiga widget dengan tipe Container.
      expect(find.byType(Container), findsNWidgets(3));

      // Ketuk tombol 'Pilih Warna'.
      await tester.tap(find.text('Pilih Warna'));
      await tester.pumpAndSettle();

      // Verifikasi bahwa color picker dialog ditampilkan.
      expect(find.byType(ColorPicker), findsOneWidget);
    });
  });
}
