import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:praktikum_bloc/bloc/contact/contact_bloc.dart';
import 'package:praktikum_bloc/bloc/contact/contact_event.dart';
import 'package:praktikum_bloc/bloc/contact/contact_state.dart';
import 'package:praktikum_bloc/main.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  // Kunci form yang digunakan untuk validasi
  var formKey = GlobalKey<FormState>();

  // Controller untuk bidang input nama, nomor telepon, tanggal, warna, dan file
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController fileController = TextEditingController();

  // Daftar kontak yang telah dibuat
  List<Contact> contacts = [];

  // Fungsi untuk validasi nama
  String? validateName(String? value) {
    // Validasi jika bidang nama kosong
    if (value == null || value.isEmpty) {
      return 'Nama harus diisi.';
    }

    // Memeriksa apakah nama terdiri dari minimal 2 kata dan huruf kapital
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

  // Fungsi untuk validasi nomor telepon
  String? validatePhoneNumber(String? value) {
    // Validasi jika bidang nomor telepon kosong
    if (value == null || value.isEmpty) {
      return 'Nomor telepon harus diisi.';
    }

    // Memeriksa validitas nomor telepon dengan pola tertentu
    if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(value)) {
      return 'Nomor telepon tidak valid. Panjang harus 8-15 digit\ndan dimulai dengan 0.';
    }

    return null;
  }

  blocListenerSubmit({required Widget child}) {
    return BlocListener(
        bloc: context.read<ContactBloc>(),
        child: child,
        listener: (context, state) {
          if (state is LoadingContactState) {
            print('Lagi Loading');
          }
          if (state is SuccessContactState) {
            setState(() {
              contacts.add(state.data);
            });
          }
          if (state is EditContactState) {
            setState(() {
              contacts[state.index] = state.data;
            });
          }
          if (state is DeleteContactState) {
            setState(() {
              contacts.removeAt(state.index);
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return blocListenerSubmit(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Contacts',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xff816EB3),
          ),
          drawer: const MyDrawer(),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Icon(
                    Icons.phonelink_setup_outlined,
                    color: Color(0xff7f8c8d),
                    size: 30,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Create New Contacts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'A dialog is a type of modal window that appears in\nfront of app content to provide critical information, or\nprompt for a decision to be made',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
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
                          // Form input untuk Nama
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Nama',
                              hintText: 'Insert your name',
                              filled: true,
                              fillColor: Color(0xffE7E0EC),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            validator: validateName,
                          ),
                          const SizedBox(height: 15),
                          // Form input untuk Nomor Telepon
                          TextFormField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Nomor',
                              hintText: '+62 ...',
                              filled: true,
                              fillColor: Color(0xffE7E0EC),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            validator: validatePhoneNumber,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 15),
                          // Form input untuk Tanggal
                          TextFormField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              labelText: 'Date',
                              hintText: 'Pilih tanggal',
                              filled: true,
                              fillColor: Color(0xffE7E0EC),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onTap: () {
                              // Menampilkan dialog pemilih tanggal
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2030),
                              ).then((pickedDate) {
                                if (pickedDate != null) {
                                  final formattedDate = DateFormat('yyyy-MM-dd')
                                      .format(pickedDate);
                                  dateController.text = formattedDate;
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          // Bidang input untuk Warna
                          TextFormField(
                            controller: colorController,
                            decoration: const InputDecoration(
                              labelText: 'Color',
                              hintText: 'Pilih warna',
                              filled: true,
                              fillColor: Color(0xffE7E0EC),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onTap: () {
                              // Menampilkan dialog pemilih warna
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
                                          // Menyimpan warna yang dipilih ke bidang input
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
                          // Form input untuk Berkas
                          TextFormField(
                            controller: fileController,
                            decoration: const InputDecoration(
                              labelText: 'File',
                              hintText: 'Pilih file',
                              filled: true,
                              fillColor: Color(0xffE7E0EC),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onTap: () async {
                              // Menampilkan pemilih berkas
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
                                backgroundColor: const Color(0xff816EB3),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // Menyimpan data kontak yang baru dibuat
                                  String name = nameController.text;
                                  String phoneNumber = phoneController.text;
                                  String date = dateController.text;
                                  String color = colorController.text;
                                  String file = fileController.text;

                                  // setState(() {
                                  //   contacts.add(Contact(
                                  //     name: name,
                                  //     phoneNumber: phoneNumber,
                                  //     date: date,
                                  //     color: color,
                                  //     file: file,
                                  //   ));
                                  // });

                                  context.read<ContactBloc>().add(
                                        SubmitContactEvent(
                                          data: Contact(
                                            name: name,
                                            phoneNumber: phoneNumber,
                                            date: date,
                                            color: color,
                                            file: file,
                                          ),
                                        ),
                                      );

                                  // Mengosongkan bidang input
                                  nameController.clear();
                                  phoneController.clear();
                                  dateController.clear();
                                  colorController.clear();
                                  fileController.clear();

                                  // Menampilkan data kontak di konsol
                                  print('Name: $name');
                                  print('Phone Number: $phoneNumber');
                                  print('Date: $date');
                                  print('Color: $color');
                                  print('File: $file');
                                }
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Daftar kontak yang telah dibuat
                  ContactsList(
                    contacts: contacts,
                    onDelete: (index) {
                      context.read<ContactBloc>().add(
                            DeleteContactEvent(
                              index: index,
                            ),
                          );
                    },
                    onUpdate: (index, newContact) {
                      context.read<ContactBloc>().add(
                            EditContactEvent(
                              index: index,
                              data: newContact,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Kelas Contact untuk merepresentasikan data kontak
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

// Widget ContactsList untuk menampilkan daftar kontak
class ContactsList extends StatelessWidget {
  final List<Contact> contacts;
  final Function(int) onDelete;
  final Function(int, Contact) onUpdate;

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
        const Text('List Contacts',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
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
                  backgroundColor: const Color(0xffE7E0EC),
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

  // Fungsi untuk menampilkan dialog pengeditan kontak
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
                contact.name = newName;
                contact.phoneNumber = newPhoneNumber;
                onUpdate(index, contact);
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
