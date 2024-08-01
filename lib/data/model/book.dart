class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final String downloadUrl;
  String savePath;
  double progress;
  bool isLoading;
  bool isDownloaded;

  Book({
    
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.downloadUrl,
    required this.imageUrl,
    this.savePath = "",
    this.progress = 0,
    this.isLoading = false,
    this.isDownloaded = false,

  });

  // fromMap methodi
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      downloadUrl: map['downloadUrl'],
    );
  }

  // toMap methodi
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
      'downloadUrl': downloadUrl,
    };
  }
}
