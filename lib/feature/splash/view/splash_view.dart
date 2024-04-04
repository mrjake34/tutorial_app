import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/home/view/home_view.dart';
import 'package:tutorial_app/feature/photos/view/photos_view.dart';
import 'package:tutorial_app/feature/test_page/view/test_view.dart';

import '../../auth/auth_splash/view/auth_splash_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.image),
      label: 'Photos',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Tests',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  int _selectedIndex = 0;

  final _widgetOptions = <Widget>[
    const HomeView(),
    const PhotosView(),
    const TestView(),
    const AuthSplashView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black26,
        unselectedItemColor: Colors.black45,
        items: items,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
