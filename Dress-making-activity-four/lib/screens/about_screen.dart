import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('About DressCraft'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'DressCraft is your trusted dressmaking service app for custom outfits, alterations, and fashion design. '
          'We combine creativity and craftsmanship to bring your dream attire to life.',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
