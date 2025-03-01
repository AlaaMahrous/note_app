import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit_add_note/add_note_cubit.dart';
import 'package:note_app/cubits/cubit_display_notes/display_notes_cubit.dart';
import 'package:note_app/views/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  NotesListView({super.key});
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DisplayNotesCubit>(context).displayNotes();
    return BlocListener<AddNoteCubit, AddNoteState>(
      listener: (context, addState) {
        if (addState is AddNoteSuccess) {
          BlocProvider.of<DisplayNotesCubit>(context).displayNotes();
          addedNote();
        }
        if (addState is AddNoteFaild) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(addState.errorMessage)));
        }
      },
      child: BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
        builder: (context, displayState) {
          if (displayState is DisplayNotesLoading) {
            return const Center(
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else if (displayState is DisplayNotesFaild) {
            return Center(child: Text(displayState.errorMessage));
          } else if (displayState is DisplayNotesSuccess) {
            final notesList = displayState.notesList;
            return notesList.isEmpty
                ? const Center(child: Text('No notes available'))
                : Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: notesList.length,
                    itemBuilder: (context, index) {
                      return NoteCard(note: notesList[index]);
                    },
                  ),
                );
          }
          return const Center(child: Text('Starting...'));
        },
      ),
    );
  }

  addedNote() {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.ease,
    );
  }
}
