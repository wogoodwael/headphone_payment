import 'package:flutter/material.dart';

Widget buildFeatureIcon(IconData icon, String label) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.blue[700]),
      ),
      SizedBox(height: 8),
    ],
  );
}
