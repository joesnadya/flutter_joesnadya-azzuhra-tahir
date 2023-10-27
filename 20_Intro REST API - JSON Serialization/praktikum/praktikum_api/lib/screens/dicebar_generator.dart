import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:randomstring_dart/randomstring_dart.dart';

import '../bloc/dicebear/dicebear_bloc.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({super.key});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  String artStyle = 'pixel-art';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prioritas 2',
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
              BlocBuilder<DicebearBloc, DicebearState>(
                builder: (context, state) {
                  if (state is DicebearInitial) {
                    // Tampilan saat bloc berada dalam keadaan awal.
                    return const Icon(
                      Icons.image,
                      size: 200,
                    );
                  } else if (state is DicebearDataLoading) {
                    // Tampilan saat sedang memuat data.
                    return const CircularProgressIndicator();
                  } else if (state is DicebearGetSuccess) {
                    // Tampilan saat data berhasil dimuat dan dirender sebagai gambar SVG.
                    return ClipRect(
                      child: SvgPicture.string(
                        state.imageData,
                        height: 100,
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
              // Tombol untuk memicu pembuatan gambar acak.
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
                    // Membangkitkan string acak menggunakan RandomString.
                    final rs = RandomString();
                    String randomString = rs.getRandomString();
                    // Memicu event untuk menghasilkan gambar berdasarkan string acak.
                    context.read<DicebearBloc>().add(
                          GenerateButtonPressedEvent(
                            artStyle: artStyle,
                            query: randomString,
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
        )),
      ),
    );
  }
}
