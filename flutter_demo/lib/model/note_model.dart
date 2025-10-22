import 'package:flutter_demo/helpers/constant.dart';
import 'package:hive/hive.dart';
part 'note_model.g.dart';


@HiveType(typeId: HiveTypeIds.note)
class NoteModel {
  @HiveField(HiveFieldIds.noteTitle)
  final String noteTitle;
  @HiveField(HiveFieldIds.noteContent)
  final String noteContent;
  @HiveField(HiveFieldIds.noteId)
  final String noteId;

  NoteModel({
    required this.noteTitle, 
    required this.noteContent,
    String? noteId,
  }) : noteId = noteId ?? DateTime.now().millisecondsSinceEpoch.toString();

  NoteModel copyWith({
    String? title, 
    String? content, 
    String? noteId,
  }) {
    return NoteModel(
      noteTitle: title ?? noteTitle,
      noteContent: content ?? noteContent,
      noteId: noteId ?? this.noteId,
    );
  }
}