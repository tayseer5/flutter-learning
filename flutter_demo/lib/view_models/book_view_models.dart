import 'package:flutter/material.dart'; 
import '../services/api_service.dart';
import '../models/book_model.dart';

class BookViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<BookModel> bookList = [];
  bool isLoading = false;
  String error = '';

  Future<void> fetchBookList() async {
    try{
      isLoading = true;
      notifyListeners();
      bookList = await _apiService.fetchBookList();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners(); // This was missing!
    }
  }
}