import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit_display_notes/display_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/note_card.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DisplayNotesCubit>(context).displayNotes();
    List<NoteModel> notesList;
    return BlocConsumer<DisplayNotesCubit, DisplayNotesState>(
      listener: (context, state) {
        if (state is DisplayNotesFaild) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is DisplayNotesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DisplayNotesFaild) {
          return Center(child: Text(state.errorMessage));
        } else if (state is DisplayNotesSuccess) {
          notesList = state.notesList;
          return notesList.isEmpty
              ? const Center(child: Text('No notes available'))
              : Expanded(
                child: ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    return NoteCard(note: notesList[index]);
                  },
                ),
              );
        }
        return const Center(child: Text('Starting...'));
      },
    );
  }
}
