import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/book_detail_screen.dart';
import '../view_models/book_view_models.dart';
import 'package:provider/provider.dart';

class BooksList extends StatefulWidget {

  
  const BooksList({super.key});

  @override
  State<BooksList> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BooksList> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<BookViewModel>().fetchBookList();
      }
    });
  }
  @override
  Widget build(BuildContext context){
    final bookViewModel = context.watch<BookViewModel>(); // why name it provider not viewmodel
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: bookListBody(bookViewModel)
      )
      )
      
    );

  }

  Widget bookListBody(BookViewModel bookViewModel) {
    if (bookViewModel.isLoading) return  const Center(child: CircularProgressIndicator());
    if (bookViewModel.error.isNotEmpty) return Center(child: Text(bookViewModel.error));
    if (bookViewModel.bookList.isEmpty) return const Center(child: Text('No books found'));
    return ListView.builder(
        itemCount: bookViewModel.bookList.length,
        itemBuilder: (context, index) {
          final book = bookViewModel.bookList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(book.title),
              subtitle: Text(book.firstAuthor ?? ' Author'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen(book: book)));
              }
            )
          );
        }
      );
    
  }
  
}

