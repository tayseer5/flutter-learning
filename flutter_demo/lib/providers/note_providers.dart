import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/noteModel.dart';


final notesProvider = NotifierProvider<NotesNotifier, List<NoteModel>>(() => NotesNotifier());
class NotesNotifier extends Notifier<List<NoteModel>> {

  @override
  List<NoteModel> build() {
    return [
      NoteModel(noteTitle: 'Note 1', noteContent: 'This is note 1'),
      NoteModel(noteTitle: 'Note 2', noteContent: 'This is note 2'),
      NoteModel(noteTitle: 'Note 3', noteContent: 'This is note 3'),
      NoteModel(noteTitle: 'Note 4', noteContent: 'This is note 4'),
      NoteModel(noteTitle: 'Note 5', noteContent: 'This is note 5'),
      NoteModel(noteTitle: 'Note 6', noteContent: 'This is note 6'),
      NoteModel(noteTitle: 'Note 7', noteContent: 'This is note 7'),
      NoteModel(noteTitle: 'Note 8', noteContent: 'This is note 8'),
    ];
  }

  void addNote(String title, String content) {
    final newNote = NoteModel(
      noteTitle: title,
      noteContent: content,
    );
    state = [newNote, ...state];
  }

  void editNote(int index, String title, String content) {
    final updatedNote = NoteModel(
      noteTitle: title,
      noteContent: content,
    );
    state = [
      ...state.sublist(0, index),
      updatedNote,
      ...state.sublist(index + 1),
    ];
  }

  void deleteNote(int index) {
    state = [
      ...state.sublist(0, index),
      ...state.sublist(index + 1),
    ];
  }
}