import 'package:flutter/material.dart';
import 'package:notes/screens/notes_screen.dart';
import 'package:notes/screens/notes_screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: NotesScreen(),
    );
  }
}
