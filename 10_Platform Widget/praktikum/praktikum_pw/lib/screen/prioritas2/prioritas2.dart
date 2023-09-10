import 'package:flutter/cupertino.dart';
import 'package:praktikum_pw/screen/home_screen.dart';

class PrioritasDua extends StatelessWidget {
  const PrioritasDua({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        middle: const Text(
          'CupertinoApp',
          style: TextStyle(color: CupertinoColors.white),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => const HomeScreen(),
            ));
          },
          child: const Icon(CupertinoIcons.clear),
        ),
      ),
      child: const Center(
        child: Text(
          'This is CupertinoApp',
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
