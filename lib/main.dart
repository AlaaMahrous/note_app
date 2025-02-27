import 'package:flutter/material.dart';
import 'package:note_app/core/constants/hive_boxes.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/views/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(HiveBoxes.notesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        NotesView.id: (context) => NotesView(),
        EditNoteView.id: (context) => EditNoteView(),
      },
      initialRoute: NotesView.id,
    );
  }
}
