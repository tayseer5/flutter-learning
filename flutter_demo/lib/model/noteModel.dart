
class NoteModel {
  final String noteTitle;
  final String noteContent;

  NoteModel({required this.noteTitle, required this.noteContent});

NoteModel copyWith({String? title, String? content}) {
    return NoteModel(
      noteTitle: title ?? noteTitle,
      noteContent: content ?? noteContent,
    );
  }
}