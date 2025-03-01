part of 'display_notes_cubit.dart';

@immutable
sealed class DisplayNotesState {}

final class DisplayNotesInitial extends DisplayNotesState {}

final class DisplayNotesLoading extends DisplayNotesState {}

final class DisplayNotesSuccess extends DisplayNotesState {
  final List<NoteModel> notesList;

  DisplayNotesSuccess({required this.notesList});
}

final class DisplayNotesFaild extends DisplayNotesState {
  final String errorMessage;

  DisplayNotesFaild({required this.errorMessage});
}
