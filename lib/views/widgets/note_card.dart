import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit_display_notes/display_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: BoxConstraints(minHeight: 175),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 32,
            top: 20,
            right: 20,
            left: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    note.noteTitle,
                    style: TextStyle(fontSize: 27, color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      note.delete();
                      BlocProvider.of<DisplayNotesCubit>(
                        context,
                      ).displayNotes();
                    },
                    child: Icon(Icons.delete, size: 28, color: Colors.black),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  note.noteText,
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(144, 0, 0, 0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  note.date,
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(172, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
