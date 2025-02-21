import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return NoteCard();
        },
      ),
    );
  }
}
