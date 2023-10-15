// Kelas ContactModel merepresentasikan model data kontak
import '../screens/contact_screen.dart';

class ContactModel {
  String name;
  String phoneNumber;
  String date;
  String color;
  String file;

  ContactModel({
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.color,
    required this.file,
  });

  ContactModel.fromContact(Contact contact)
      : name = contact.name,
        phoneNumber = contact.phoneNumber,
        date = contact.date,
        color = contact.color,
        file = contact.file;
}
