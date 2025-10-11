import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us'), backgroundColor: Colors.pink),
      body: Center(child: Text('Email us at support@dresscraft.com')),
    );
  }
}
