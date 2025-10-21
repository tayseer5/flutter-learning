import 'package:flutter_demo/managers/hive_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/note_model.dart';


final notesProvider = NotifierProvider<NotesNotifier, List<NoteModel>>(() => NotesNotifier());

class NotesNotifier extends Notifier<List<NoteModel>> {

  @override
  List<NoteModel> build() {
    return HiveManager.notesBox.values.toList();
  }

  Future<void> addNote(String title, String content) async { // Future<void> add(Note note) async {
    final newNote = NoteModel(
      noteTitle: title,
      noteContent: content,
    );
   final box = HiveManager.notesBox;
   await box.add(newNote);
    state = box.values.toList();
  }

  Future<void> editNote(int index, String title, String content) async {
    final updatedNote = NoteModel(
      noteTitle: title,
      noteContent: content,
    );
    final box = HiveManager.notesBox;
     await box.putAt(index, updatedNote);
     state = box.values.toList();
  }

  Future<void>  deleteNote(int index) async{
   final box = HiveManager.notesBox;
    await box.deleteAt(index);
    state = box.values.toList();
  }

  Future<void> refresh() async {
    final box = HiveManager.notesBox;
    state = box.values.toList();
  }
}