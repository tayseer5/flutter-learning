import 'package:flutter/foundation.dart'; 
import '../services/api_service.dart';
import '../models/book_model.dart';

class BookViewModel extends ChangeNotifier {
  final ApiService _apiService;
  final List<BookModel> _bookList = [];
  List<BookModel> get bookList => List.unmodifiable(_bookList);
  bool isLoading = false;
  String error = '';

BookViewModel({ApiService? api}) : _apiService = api ?? ApiService();

  Future<void> fetchBookList() async {
    try{
      error = '';
      isLoading = true;
      notifyListeners();
      final fetchedBooks = await _apiService.fetchBookList();
      _bookList
        ..clear()
        ..addAll(fetchedBooks);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners(); // This was missing!
    }
  }
}