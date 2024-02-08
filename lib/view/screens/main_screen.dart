import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:rainery/config/router/router.dart';

import '../../view-model/theme_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        Consumer<ThemeProvider>(
          builder: (context, themeNotifier, child) => IconButton(
            icon: themeNotifier.isDark
                ? const Icon(CupertinoIcons.sun_min_fill)
                : const Icon(CupertinoIcons.moon_stars_fill),
            onPressed: () => themeNotifier.switchTheme(),
          ),
        ),
      ]),
      body: AppRouter().screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: ''),

        ],
      ),
    );
  }
}
