import 'package:flutter_demo/managers/hive_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/note_model.dart';


final notesProvider = NotifierProvider<NotesNotifier, List<NoteModel>>(() => NotesNotifier());

class NotesNotifier extends Notifier<List<NoteModel>> {

  @override
  List<NoteModel> build() {
    return HiveManager.notesBox.values.toList();
  }
 
  Future<void> addNote(String title, String content) async {
    final newNote = NoteModel(
      noteTitle: title,
      noteContent: content,
    );
   final box = HiveManager.notesBox;
   await box.add(newNote);
    state = box.values.toList();
  }

  Future<void> editNote(String noteId, String title, String content) async {
    final box = HiveManager.notesBox;
    final noteKey = box.keys.firstWhere(
      (key) => box.get(key)?.noteId == noteId,
      orElse: () => null,
    );
    
    if (noteKey != null) {
      final updatedNote = NoteModel(
        noteTitle: title,
        noteContent: content,
        noteId: noteId,
      );
      await box.put(noteKey, updatedNote);
      state = box.values.toList();
    }
  }

  Future<void> deleteNote(String noteId) async {
    final box = HiveManager.notesBox;
    final noteKey = box.keys.firstWhere(
      (key) => box.get(key)?.noteId == noteId,
      orElse: () => null,
    );
    
    if (noteKey != null) {
      await box.delete(noteKey);
      state = box.values.toList();
    }
  }

  Future<void> refresh() async {
    final box = HiveManager.notesBox;
    state = box.values.toList();
  }
}