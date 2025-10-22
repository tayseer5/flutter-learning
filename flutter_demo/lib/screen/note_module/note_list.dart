import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/note_dialog.dart';
import 'package:flutter_demo/providers/note_providers.dart';
import 'package:flutter_demo/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class NoteList extends ConsumerWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Note List'),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              ref.read(themeProvider.notifier).toggleTheme(value);
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
       child: notes.isEmpty ? Center(child: Text('No notes found')) : SlidableAutoCloseBehavior (
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
             return Slidable(
               key: ValueKey(index),
               closeOnScroll: true,
               endActionPane: ActionPane(
                 motion: const ScrollMotion(),
                 children: [
                   SlidableAction(
                     onPressed: (_) => showEditNoteDialog(context, note),
                     backgroundColor: Colors.blue.shade600,
                     foregroundColor: Colors.white,
                     icon: Icons.edit_outlined,
                     label: 'Edit',
                     padding: EdgeInsets.all(20),
                   ),
                   SlidableAction(
                     onPressed: (_) {
                       showDialog(
                         context: context,
                         builder: (context) => AlertDialog(
                           title: Text('Delete Note'),
                           content: Text('Are you sure you want to delete this note?'),
                           actions: [
                             TextButton(
                               onPressed: () => Navigator.pop(context),
                               child: Text('Cancel'),
                             ),
                             TextButton(
                               onPressed: () {
                                 Navigator.pop(context); // Close the dialog first
                                 ref.read(notesProvider.notifier).deleteNote(index);
                               },
                               child: Text('Delete', style: TextStyle(color: Colors.red)),
                             ),
                           ],
                         ),
                       );
                     },
                     backgroundColor: Colors.red.shade600,
                     foregroundColor: Colors.white,
                     icon: Icons.delete_outline,
                     label: 'Delete',
                     padding: EdgeInsets.all(20),
                   ),
                 ],
               ),
            child: Card(
              margin: EdgeInsets.fromLTRB(12, 20, 12, 5),
              child: ListTile(
                title: Text(
                  note.noteTitle),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(note.noteContent),
                ),
              ),
            ),
            );

          },
        ),
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

