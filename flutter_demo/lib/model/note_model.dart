import 'package:flutter_demo/helpers/constant.dart';
import 'package:hive/hive.dart';
part 'note_model.g.dart';


@HiveType(typeId: HiveTypeIds.note)
class NoteModel {
  @HiveField(HiveFieldIds.noteTitle)
  final String noteTitle;
  @HiveField(HiveFieldIds.noteContent)
  final String noteContent;

  NoteModel({required this.noteTitle, required this.noteContent});

NoteModel copyWith({String? title, String? content}) {
    return NoteModel(
      noteTitle: title ?? noteTitle,
      noteContent: content ?? noteContent,
    );
  }
}