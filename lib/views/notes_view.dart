import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_floating_button.dart';
import 'package:note_app/views/widgets/note_body_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  static String id = 'NotesView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingButton(),
      body: NoteBodyView(),
    );
  }
}
