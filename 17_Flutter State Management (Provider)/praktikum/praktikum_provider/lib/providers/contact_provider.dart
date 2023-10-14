import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  final List<ContactModel> _contacts = [];

  // Getter untuk mendapatkan daftar kontak.
  List<ContactModel> get contacts => _contacts;

  // Menambahkan kontak baru ke daftar dan memberitahu listeners.
  void addContact(ContactModel contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  // Menghapus kontak pada indeks yang ditentukan dan memberitahu listeners.
  void deleteContact(int index) {
    if (index < _contacts.length) {
      _contacts.removeAt(index);
      notifyListeners();
    }
  }

  // Memperbarui nama dan nomor telepon kontak pada indeks tertentu dan memberitahu listeners.
  void updateContact(int index, String newName, String newPhoneNumber) {
    if (index < _contacts.length) {
      _contacts[index].name = newName;
      _contacts[index].phoneNumber = newPhoneNumber;
      notifyListeners();
    }
  }
}
