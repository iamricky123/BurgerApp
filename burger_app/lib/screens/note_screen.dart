import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: const Center(child: Text("NoteScreen")),
    );
  }
}