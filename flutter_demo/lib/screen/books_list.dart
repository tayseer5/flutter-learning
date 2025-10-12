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
      backgroundColor: Colors.grey[100],
      body: SafeArea(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: bookViewModel.isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
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
        )
      )
      )
      
    );

  }
  
}

// class _BooksListState extends State<BooksList> {
//   // Sample books data
//   final List<Map<String, String>> books = [
//     {'title': 'Flutter Complete Guide', 'author': 'John Doe'},
//     {'title': 'Dart Programming', 'author': 'Jane Smith'},
//     {'title': 'Mobile Development', 'author': 'Bob Johnson'},
//     {'title': 'UI/UX Design', 'author': 'Alice Brown'},
//     {'title': 'App Architecture', 'author': 'Charlie Wilson'},
//     {'title': 'State Management', 'author': 'Diana Lee'},
//     {'title': 'Testing Flutter Apps', 'author': 'Eve Davis'},
//     {'title': 'Performance Optimization', 'author': 'Frank Miller'},
//     {'title': 'Cross Platform', 'author': 'Grace Taylor'},
//     {'title': 'Advanced Flutter', 'author': 'Henry Clark'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SafeArea(
//         //margin: const EdgeInsets.all(20),
//         child: Container(
//           margin: const EdgeInsets.all(20),
//           child: ListView.builder(
//             itemCount: books.length,
//             itemBuilder: (context, index) {
//               final book = books[index];
//               return Card(
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 child: ListTile(
//                   title: Text(book['title']!)
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
