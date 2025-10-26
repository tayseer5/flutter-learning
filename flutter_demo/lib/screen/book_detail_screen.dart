import 'package:flutter/material.dart';
import 'dart:ui';
import '../models/book_model.dart';


class BookDetailScreen extends StatelessWidget {
  final BookModel book;
  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //appBar: AppBar(title: Text(book.title)),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(book.title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(book.thumbnail ?? '', fit: BoxFit.cover),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BookDetailsContainer(book: book),
            )
          )
        ],
      )
    );
  }
}

class BookDetailsContainer extends StatelessWidget {
  const BookDetailsContainer({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        SelectableText(book.description ?? 'No description available.'),
      ],
    );
  }
}