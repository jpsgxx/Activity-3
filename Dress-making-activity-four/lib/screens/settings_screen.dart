import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white),
      body: Center(
          child:
              Text('App Settings Page', style: TextStyle(color: Colors.black))),
    );
  }
}
