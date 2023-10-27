import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/dicebear/dicebear_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Inisialisasi TextEditingController untuk mengelola input pengguna.
  TextEditingController queryController = TextEditingController();
  String artStyle = 'pixel-art';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Eksplorasi',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff5041FF),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // BlocBuilder untuk menggambarkan UI berdasarkan status DicebearBloc.
                BlocBuilder<DicebearBloc, DicebearState>(
                  builder: (context, state) {
                    if (state is DicebearInitial) {
                      // Tampilan saat bloc berada dalam keadaan awal.
                      return const Icon(
                        Icons.image,
                        size: 100,
                      );
                    } else if (state is DicebearDataLoading) {
                      // Tampilan saat sedang memuat data.
                      return const CircularProgressIndicator();
                    } else if (state is DicebearGetSuccess) {
                      // Tampilan saat data berhasil dimuat dan dirender sebagai gambar SVG.
                      return ClipRect(
                        child: SvgPicture.string(
                          state.imageData,
                          height: 200,
                        ),
                      );
                    } else if (state is DicebearDataFailed) {
                      // Tampilan saat gagal memuat data.
                      return Text(state.errorMessage);
                    } else {
                      // Tampilan default jika tidak ada perubahan status.
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 20),
                // Input teks untuk pengguna memasukkan kata kunci.
                TextField(
                  controller: queryController,
                  decoration: const InputDecoration(
                    hintText: 'Input Keyword',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    label: Text('Search'),
                    labelStyle: TextStyle(fontSize: 20),
                  ),
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
                       // Memicu event untuk menghasilkan gambar.
                      context.read<DicebearBloc>().add(
                            GenerateButtonPressedEvent(
                              artStyle: artStyle,
                              query: queryController.text,
                            ),
                          );
                    },
                    child: const Text(
                      'GENERATE',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
