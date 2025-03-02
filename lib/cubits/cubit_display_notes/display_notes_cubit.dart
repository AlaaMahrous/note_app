import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/constants/hive_boxes.dart';
import 'package:note_app/models/note_model.dart';

part 'display_notes_state.dart';

class DisplayNotesCubit extends Cubit<DisplayNotesState> {
  late Box<NoteModel> noteBox;
  late List<NoteModel> notesList;
  DisplayNotesCubit() : super(DisplayNotesInitial());
  displayNotes() {
    try {
      noteBox = Hive.box<NoteModel>(HiveBoxes.notesBox);
      notesList = noteBox.values.toList();
      emit(DisplayNotesSuccess(notesList: notesList));
    } catch (e) {
      emit(DisplayNotesFaild(errorMessage: e.toString()));
    }
  }
}
