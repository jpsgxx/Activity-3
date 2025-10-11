import 'package:flutter/material.dart';
import '../widgets/service_tab_view.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ServiceTabView(),
    ProfileScreen(),
    SettingsScreen()
  ];

  void _navigateWithAnimation(Widget page) {
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 400),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve =
                CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            return FadeTransition(opacity: curve, child: child);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DressCraft Home'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Services'),
              Tab(text: 'Schedules'),
              Tab(text: 'Reviews'),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                child: Text('Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              _drawerItem(Icons.home, 'Home', () {
                Navigator.pop(context);
              }),
              _drawerItem(Icons.person, 'Profile', () {
                Navigator.pop(context);
                _navigateWithAnimation(ProfileScreen());
              }),
              _drawerItem(Icons.info, 'About', () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              }),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
                child: Text('Dressmaking, Alterations, Custom Designs',
                    style: TextStyle(color: Colors.black))),
            Center(
                child: Text('Your Appointments will appear here',
                    style: TextStyle(color: Colors.black))),
            Center(
                child: Text('Customer Reviews Section',
                    style: TextStyle(color: Colors.black))),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() => _currentIndex = index);
            if (index == 1)
              _navigateWithAnimation(ProfileScreen());
            else if (index == 2) _navigateWithAnimation(SettingsScreen());
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(color: Colors.black)),
      onTap: onTap,
    );
  }
}
