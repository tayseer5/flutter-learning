import 'package:flutter/material.dart';
import '../models/book_model.dart';


class BookDetailScreen extends StatelessWidget {
  final BookModel book;
  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(book.title)),
      body: SafeArea(child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
             if (book.safeThumbnail != null)
               Image.network(
                 book.safeThumbnail!,
                 height: 150,
                 width: double.infinity,
                 fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) {
                   return Container(
                     height: 200,
                     width: double.infinity,
                     color: Colors.grey[300],
                     child: const Icon(Icons.book, size: 50, color: Colors.grey),
                   );
                 },
                 loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return Container(
                     height: 200,
                     width: double.infinity,
                     color: Colors.grey[200],
                     child: const Center(child: CircularProgressIndicator()),
                   );
                 },
               ),
              const SizedBox(height: 20),
              Text(book.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(book.description ?? 'No description available.'),
              ),
            ),

          ],
        )
      ))
    );
  }
}