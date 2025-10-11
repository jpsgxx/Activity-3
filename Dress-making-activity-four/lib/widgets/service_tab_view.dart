import 'package:flutter/material.dart';

class ServiceTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Available Services:\n• Dressmaking\n• Alterations\n• Custom Design\n• Embroidery',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
