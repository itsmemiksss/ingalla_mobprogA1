
import 'package:flutter/material.dart';
import 'package:ingalla_mobprog/constants.dart';
import 'package:ingalla_mobprog/screens/newsfeed_screen.dart';
import 'package:ingalla_mobprog/screens/notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  final List<String> _titles = [
    'Facebook',
    'Notifications',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,

      // Dynamic AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            color: fbPrimary,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Page Navigation
      body: PageView(
        controller: _pageController,
        children: const [
          NewsfeedScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: fbPrimary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 45),
          ),
          SizedBox(height: 15),
          Text(
            'My Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Welcome to MySocial!',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
