import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/notes_list_view.dart';

class NoteBodyView extends StatelessWidget {
  const NoteBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Column(children: [const CustomAppBar(), NotesListView()]),
    );
  }
}
