class NoteModel {
  String category;
  String noteText;
  DateTime date;

  NoteModel({required this.category, required this.noteText})
    : date = DateTime.now();
}
