import 'package:first_app/widgets/note_card.dart';
import 'package:first_app/pages/note_form_page.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My notes'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return NoteCard(
            title: 'hello',
            content: 'test edit form',
            onEdit: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoteFormScreen()),
              );
            },
            onDelete: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NoteFormScreen()),
          );
        },
      ),
    );
  }
}
