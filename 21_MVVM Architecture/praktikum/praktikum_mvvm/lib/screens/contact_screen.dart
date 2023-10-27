import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact/contact_bloc.dart';
import '../bloc/text/text_bloc.dart';
import '../main.dart';
import '../models/contact_model.dart';
import '../models/text_model.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi dua objek TextEditingController untuk mengelola input pengguna.
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prioritas 1",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff5041FF),
      ),
      drawer: const MyDrawer(), // Menambahkan drawer menu ke layar.
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "GET dan POST data Contact",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Input untuk nama kontak.
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Input Nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    label: Text('Nama'),
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                // Input untuk nomor telepon kontak.
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input No Telp',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    label: Text('No Telp'),
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                // Tombol untuk mengirim data kontak ke server.
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      // fixedSize: fixedSize,
                      backgroundColor: const Color(0xff5041FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Memicu event untuk mengirim data kontak.
                      context.read<ContactBloc>().add(
                            PostContactEvent(
                              contactItem: ContactModel(
                                id: 4,
                                name: nameController.text,
                                phone: phoneController.text,
                              ),
                            ),
                          );
                      nameController.clear();
                      phoneController.clear();
                    },
                    child: const Text(
                      'POST',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Tombol untuk mengambil data kontak dari server.
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      // fixedSize: fixedSize,
                      backgroundColor: const Color(0xff5041FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Memicu event untuk mengambil data kontak.
                      context.read<ContactBloc>().add(const GetContactEvent());
                    },
                    child: const Text(
                      'GET',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // BlokBuilder untuk menggambarkan UI berdasarkan status ContactBloc.
                BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) {
                    if (state is ContactDataLoading) {
                      // Tampilan saat data kontak sedang dimuat.
                      return const CircularProgressIndicator();
                    } else if (state is ContactPostSuccess) {
                      // Tampilan saat data kontak berhasil dikirim (POST).
                      return Text(
                        "id : ${state.contactData.id}\nname : ${state.contactData.name}\nphone: ${state.contactData.phone}",
                        style: const TextStyle(fontSize: 16),
                      );
                    } else if (state is ContactGetSuccess) {
                      // Tampilan saat data kontak berhasil diambil (GET).
                      List<Widget> textWidgets = [];
                      for (int i = 0; i < state.contactData.length; i++) {
                        textWidgets.add(Text(
                          "id :${state.contactData[i].id}\nname : ${state.contactData[i].name}\nphone: ${state.contactData[i].phone}\n\n",
                          style: const TextStyle(fontSize: 16),
                        ));
                      }
                      return Column(
                        children: textWidgets,
                      );
                    } else if (state is ContactDataFailed) {
                      // Tampilan saat gagal mengambil atau mengirim data kontak.
                      return Text(state.errorMessage);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 20),
                // Tombol untuk mengirim data teks ke server (PUT).
                const Text(
                  "PUT data Text",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      // fixedSize: fixedSize,
                      backgroundColor: const Color(0xff5041FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Memicu event untuk mengirim data teks.
                      context.read<TextBloc>().add(
                            PutTextEvent(
                              textItem: TextModel(
                                id: 1,
                                title: 'title',
                                body: 'body',
                                userId: 1,
                              ),
                            ),
                          );
                    },
                    child: const Text(
                      'PUT',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // BlokBuilder untuk menggambarkan UI berdasarkan status TextBloc.
                BlocBuilder<TextBloc, TextState>(
                  builder: (context, state) {
                    if (state is TextDataLoading) {
                      // Tampilan saat data teks sedang dimuat.
                      return const CircularProgressIndicator();
                    } else if (state is TextPutSuccess) {
                      // Tampilan saat data teks berhasil dikirim (PUT).
                      return Text(
                        "id : ${state.textData.id}\ntitle : ${state.textData.title}\nbody: ${state.textData.body}\nUserId : ${state.textData.userId}",
                        style: const TextStyle(fontSize: 16),
                      );
                    } else if (state is TextDataFailed) {
                      // Tampilan saat gagal mengirim data teks.
                      return Text(state.errorMessage);
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
