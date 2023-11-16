import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum_testing/screen/implement_picker.dart';

void main() {
  // Pengujian untuk layar FlutterAdvance
  testWidgets('Test FlutterAdvance screen', (WidgetTester tester) async {
    // Bangun aplikasi kita dan picu suatu frame.
    await tester.pumpWidget(const MaterialApp(
      home: FlutterAdvance(),
    ));

    // Verifikasi bahwa teks "Create New Contacts" ditampilkan.
    expect(find.text('Create New Contacts'), findsOneWidget);

    // Masukkan teks ke dalam TextFormField untuk nama.
    await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');

    // Masukkan teks ke dalam TextFormField untuk nomor telepon.
    await tester.enterText(find.byType(TextFormField).at(1), '0123456789');

    // Masukkan teks ke dalam TextFormField untuk tanggal.
    await tester.enterText(find.byType(TextFormField).at(2), '2023-11-16');

    // Masukkan teks ke dalam TextFormField untuk warna.
    await tester.enterText(find.byType(TextFormField).at(3), '#FF0000');

    // Pastikan tombol "Submit" terlihat dan ketuk tombol tersebut.
    await tester.ensureVisible(find.text('Submit'));
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // Verifikasi bahwa teks "John Doe" ditampilkan.
    expect(find.text('John Doe'), findsOneWidget);

    // Verifikasi bahwa teks "Phone: 0123456789" ditampilkan.
    expect(find.text('Phone: 0123456789'), findsOneWidget);

    // Pastikan tombol hapus terlihat dan ketuk tombol tersebut.
    await tester.ensureVisible(find.byIcon(Icons.delete_outline));
    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pumpAndSettle();

    // Verifikasi bahwa teks "John Doe" tidak lagi ditampilkan setelah penghapusan.
    expect(find.text('John Doe'), findsNothing);
  });
}
