import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/note_model.dart';
import '../providers/note_providers.dart';

class NoteDialog extends ConsumerStatefulWidget {
  final NoteModel? note;

  const NoteDialog({
    super.key,
    this.note,
  });

  @override
  ConsumerState<NoteDialog> createState() => _NoteDialogState();
}

class _NoteDialogState extends ConsumerState<NoteDialog> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.noteTitle ?? '');
    _contentController = TextEditingController(text: widget.note?.noteContent ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.note != null;
    
    return AlertDialog(
      title: Text(isEditing ? 'Edit Note' : 'Add Note'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Note Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Note Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final title = _titleController.text.trim();
            final content = _contentController.text.trim();
            
            if (title.isNotEmpty && content.isNotEmpty) {
              if (isEditing && widget.note != null) {
                ref.read(notesProvider.notifier).editNote(
                  widget.note!.noteId,
                  title,
                  content,
                );
              } else {
                ref.read(notesProvider.notifier).addNote(title, content);
              }
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please fill in both title and content')),
              );
            }
          },
          child: Text(isEditing ? 'Update' : 'Add'),
        ),
      ],
    );
  }
}

// Helper functions to show the dialog
void showAddNoteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => NoteDialog(),
  );
}

void showEditNoteDialog(BuildContext context, NoteModel note) {
  showDialog(
    context: context,
    builder: (context) => NoteDialog(
      note: note,
    ),
  );
}
