import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contact/contact_bloc.dart';
import 'bloc/dicebear/dicebear_bloc.dart';
import 'bloc/text/text_bloc.dart';
import 'screens/contact_screen.dart';
import 'screens/dicebar_generator.dart';
import 'screens/dicebar_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Menyediakan berbagai bloc (state management) yang akan digunakan dalam seluruh aplikasi.
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactBloc(),
        ),
        BlocProvider(
          create: (context) => TextBloc(),
        ),
        BlocProvider(
          create: (context) => DicebearBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
          ),
          initialRoute: '/contact',
          routes: {
            '/contact': (context) => const ContactScreen(),
            '/generator': (context) => const GeneratorScreen(),
            '/search': (context) => const SearchScreen(),
          }),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Prioritas 1'),
            onTap: () {
              Navigator.of(context).pushNamed('/contact');
            },
          ),
          ListTile(
            title: const Text('Prioritas 2'),
            onTap: () {
              Navigator.of(context).pushNamed('/generator');
            },
          ),
          ListTile(
            title: const Text('Eksplorasi'),
            onTap: () {
              Navigator.of(context).pushNamed('/search');
            },
          ),
        ],
      ),
    );
  }
}
