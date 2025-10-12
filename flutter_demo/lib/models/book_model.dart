class BookModel {
  final String id;
  final String title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final List<String>? categories;
  final String? language;
  final String? thumbnail;
  final String? smallThumbnail;
  final String? previewLink;
  final String? infoLink;

  BookModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.categories,
    this.language,
    this.thumbnail,
    this.smallThumbnail,
    this.previewLink,
    this.infoLink,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final imageLinks = volumeInfo['imageLinks'] ?? {};
    
    return BookModel(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? 'Unknown Title',
      subtitle: volumeInfo['subtitle'],
      authors: volumeInfo['authors'] != null 
          ? List<String>.from(volumeInfo['authors'])
          : null,
      publisher: volumeInfo['publisher'],
      publishedDate: volumeInfo['publishedDate'],
      description: volumeInfo['description'],
      pageCount: volumeInfo['pageCount'],
      categories: volumeInfo['categories'] != null 
          ? List<String>.from(volumeInfo['categories'])
          : null,
      language: volumeInfo['language'],
      thumbnail: imageLinks['thumbnail'],
      smallThumbnail: imageLinks['smallThumbnail'],
      previewLink: volumeInfo['previewLink'],
      infoLink: volumeInfo['infoLink'],
    );
  }

  // Helper getter for first author
  String? get firstAuthor => authors?.isNotEmpty == true ? authors![0] : null;
  
  // Helper getter for safe thumbnail URL
  String? get safeThumbnail {
    if (thumbnail != null && thumbnail!.isNotEmpty) {
      // Check if it's a valid HTTP/HTTPS URL
      if (thumbnail!.startsWith('http://') || thumbnail!.startsWith('https://')) {
        return thumbnail;
      }
    }
    // Fallback to smallThumbnail if available
    if (smallThumbnail != null && smallThumbnail!.isNotEmpty) {
      if (smallThumbnail!.startsWith('http://') || smallThumbnail!.startsWith('https://')) {
        return smallThumbnail;
      }
    }
    return null;
  }
}