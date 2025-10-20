import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/note_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_demo/providers/note_providers.dart';

class NoteList extends ConsumerWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Note List'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Card(
              margin: EdgeInsets.fromLTRB(12, 20, 12, 5),
              child: ListTile(
                title: Text(note.noteTitle),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(note.noteContent)),
                onTap: () {
                  print('Tapped on Note ${index + 1}');
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddNoteDialog(context);
          //ref.read(notesProvider.notifier).addNote('New Note', 'This is a new note');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

