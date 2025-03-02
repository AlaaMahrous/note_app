import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit_display_notes/display_notes_cubit.dart';
import 'package:note_app/views/widgets/note_card.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  final ScrollController controller = ScrollController();
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      BlocProvider.of<DisplayNotesCubit>(context).displayNotes();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
      builder: (context, displayState) {
        if (displayState is DisplayNotesFaild) {
          return Center(child: Text(displayState.errorMessage));
        } else if (displayState is DisplayNotesSuccess) {
          final notesList = displayState.notesList.reversed.toList();
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
    );
  }

  addedNote() {
    controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.ease);
  }
}
