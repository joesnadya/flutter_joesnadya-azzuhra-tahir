import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

import '../theme.dart';

class FlutterAdvance extends StatefulWidget {
  const FlutterAdvance({super.key});

  @override
  State<FlutterAdvance> createState() => _FlutterAdvanceState();
}

class _FlutterAdvanceState extends State<FlutterAdvance> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController fileController = TextEditingController();

  List<Contact> contacts = [];

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama harus diisi.';
    }

    List<String> words = value.split(' ');
    if (words.length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata.';
    }

    for (String word in words) {
      if (word.isEmpty) {
        return 'Setiap kata harus dimulai dengan huruf kapital.';
      }

      if (word[0] != word[0].toUpperCase()) {
        return 'Setiap kata harus dimulai dengan huruf kapital.';
      }

      if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(word)) {
        return 'Nama tidak boleh mengandung angka atau karakter khusus.';
      }
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon harus diisi.';
    }

    if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(value)) {
      return 'Nomor telepon tidak valid. Panjang harus 8-15 digit\ndan dimulai dengan 0.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Icon(
                  Icons.phonelink_setup_outlined,
                  color: greyColor,
                  size: 30,
                ),
                const SizedBox(height: 20),
                Text(
                  'Create New Contacts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'A dialog is a type of modal window that appears in\nfront of app content to provide critical information, or\nprompt for a decision to be made',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  width: 350,
                  color: Colors.grey[350],
                ),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Nama',
                            hintText: 'Insert your name',
                            filled: true,
                            fillColor: lightPrimaryColor,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: validateName,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Nomor',
                            hintText: '+62 ...',
                            filled: true,
                            fillColor: lightPrimaryColor,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: validatePhoneNumber,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: dateController,
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            hintText: 'Pilih tanggal',
                            filled: true,
                            fillColor: lightPrimaryColor,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            ).then((pickedDate) {
                              if (pickedDate != null) {
                                final formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                dateController.text = formattedDate;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: colorController,
                          decoration: const InputDecoration(
                            labelText: 'Color',
                            hintText: 'Pilih warna',
                            filled: true,
                            fillColor: lightPrimaryColor,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                Color currentColor = Colors.white;
                                return AlertDialog(
                                  title: const Text('Pick a color'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: currentColor,
                                      onColorChanged: (Color newColor) {
                                        currentColor = newColor;
                                      },
                                      enableAlpha: false,
                                      // ignore: deprecated_member_use
                                      showLabel: true,
                                      pickerAreaHeightPercent: 0.8,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        colorController.text =
                                            '#${currentColor.value.toRadixString(16).substring(2)}';
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Select'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: fileController,
                          decoration: const InputDecoration(
                            labelText: 'File',
                            hintText: 'Pilih file',
                            filled: true,
                            fillColor: lightPrimaryColor,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: [
                                'pdf',
                                'doc',
                                'txt',
                                'jpg',
                                'png'
                              ],
                            );
                            if (result != null) {
                              PlatformFile file = result.files.single;
                              fileController.text = file.path!;
                            }
                          },
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String name = nameController.text;
                                String phoneNumber = phoneController.text;
                                String date = dateController.text;
                                String color = colorController.text;
                                String file = fileController.text;

                                setState(() {
                                  contacts.add(Contact(
                                    name: name,
                                    phoneNumber: phoneNumber,
                                    date: date,
                                    color: color,
                                    file: file,
                                  ));
                                });

                                nameController.clear();
                                phoneController.clear();
                                dateController.clear();
                                colorController.clear();
                                fileController.clear();

                                print('Name: $name');
                                print('Phone Number: $phoneNumber');
                                print('Date: $date');
                                print('Color: $color');
                                print('File: $file');
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ContactsList(
                  contacts: contacts,
                  onDelete: (index) {
                    setState(() {
                      contacts.removeAt(index);
                    });
                  },
                  onUpdate: (index, newName, newPhoneNumber) {
                    setState(() {
                      contacts[index].name = newName;
                      contacts[index].phoneNumber = newPhoneNumber;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Contact {
  String name;
  String phoneNumber;
  String date;
  String color;
  String file;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.color,
    required this.file,
  });
}

class ContactsList extends StatelessWidget {
  final List<Contact> contacts;
  final Function(int) onDelete;
  final Function(int, String, String) onUpdate;

  ContactsList({
    required this.contacts,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    print(contacts.length);
    return Column(
      children: [
        Text('List Contacts',
            style: TextStyle(
              fontSize: 20,
              fontWeight: bold,
            )),
        const SizedBox(height: 10),
        if (contacts.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              final initials = contact.name.isNotEmpty ? contact.name[0] : '';
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: lightPrimaryColor,
                  child: Text(
                    initials.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Text(contact.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone: ${contact.phoneNumber}'),
                    Text('Date: ${contact.date}'),
                    Row(
                      children: [
                        const Text('Color: '),
                        Container(
                          width: 20,
                          height: 20,
                          color: Color(
                            int.parse(
                              contact.color.replaceAll("#", "0xFF"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('File: ${contact.file}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _showEditContactDialog(context, index, contact);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        onDelete(index);
                      },
                    ),
                  ],
                ),
              );
            },
          )
        else
          const Text('Belum ada contacts'),
      ],
    );
  }

  void _showEditContactDialog(
      BuildContext context, int index, Contact contact) {
    String newName = contact.name;
    String newPhoneNumber = contact.phoneNumber;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: newName,
                onChanged: (value) {
                  newName = value;
                },
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                initialValue: newPhoneNumber,
                onChanged: (value) {
                  newPhoneNumber = value;
                },
                decoration: const InputDecoration(labelText: 'Nomor'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onUpdate(index, newName, newPhoneNumber);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}