
import 'package:flutter_demo/helpers/constant.dart';
import 'package:flutter_demo/model/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
   static const notesBoxName =   HiveBoxesName.noteBox;
   static init() async { //Future<void> 
    await Hive.initFlutter();
    _registerAdapters();
    await _openBoxes();
   }

   static void _registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveTypeIds.note)) {
      Hive.registerAdapter(NoteModelAdapter());
    }
   }

   static Future<void> _openBoxes() async {
    await Hive.openBox<NoteModel>(notesBoxName);
  }

  static Box<NoteModel> get notesBox => Hive.box<NoteModel>(notesBoxName);

}