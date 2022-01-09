import 'package:flutter/material.dart';

ElevatedButton buttonA(String text, VoidCallback onCall) {
  return ElevatedButton(onPressed: onCall, child: Text(text));
}

IconButton buttonB(IconData icon, VoidCallback onCall) {
  return IconButton(onPressed: onCall, icon: Icon(icon));
}
