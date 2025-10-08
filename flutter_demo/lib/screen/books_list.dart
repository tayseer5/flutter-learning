import 'package:flutter/material.dart';

class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  // Sample books data
  final List<Map<String, String>> books = [
    {'title': 'Flutter Complete Guide', 'author': 'John Doe'},
    {'title': 'Dart Programming', 'author': 'Jane Smith'},
    {'title': 'Mobile Development', 'author': 'Bob Johnson'},
    {'title': 'UI/UX Design', 'author': 'Alice Brown'},
    {'title': 'App Architecture', 'author': 'Charlie Wilson'},
    {'title': 'State Management', 'author': 'Diana Lee'},
    {'title': 'Testing Flutter Apps', 'author': 'Eve Davis'},
    {'title': 'Performance Optimization', 'author': 'Frank Miller'},
    {'title': 'Cross Platform', 'author': 'Grace Taylor'},
    {'title': 'Advanced Flutter', 'author': 'Henry Clark'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        //margin: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(book['title']!)
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
