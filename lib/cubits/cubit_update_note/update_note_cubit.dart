import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/constants/hive_boxes.dart';
import 'package:note_app/models/note_model.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit() : super(UpdateNoteInitial());
  updateNote(int key, NoteModel note) async {
    emit(UpdateNoteLoading());
    try {
      Box<NoteModel> noteBox = Hive.box<NoteModel>(HiveBoxes.notesBox);
      await noteBox.put(0, note);
      emit(UpdateNoteSuccess());
    } catch (e) {
      emit(UpdateNoteFaild(errorMessage: e.toString()));
    }
  }
}
