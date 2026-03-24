import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Home", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    const Center(child: Text("Explore", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    const Center(child: Text("Favorites", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    const Center(child: Text("Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Needed for liquid glass navigation bar
      appBar: AppBar(
        title: const Text('BeeBus'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white.withValues(alpha: 0.6),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Theme.of(context).colorScheme.primary,
                unselectedItemColor: Colors.grey.shade500,
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.explore_rounded), label: 'Explore'),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: 'Favorites'),
                  BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
