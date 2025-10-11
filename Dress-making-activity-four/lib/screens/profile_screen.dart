import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[900],
                child: Icon(Icons.person, size: 50, color: Colors.white)),
            SizedBox(height: 20),
            Text('Jane Doe',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Text('jane.doe@example.com',
                style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(Icons.logout, color: Colors.white),
              label: Text('Logout', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
