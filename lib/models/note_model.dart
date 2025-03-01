import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String noteTitle;
  @HiveField(1)
  String noteText;
  @HiveField(2)
  String date;

  NoteModel({
    required this.noteTitle,
    required this.noteText,
    required this.date,
  });
}
