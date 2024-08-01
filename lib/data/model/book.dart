class Book {
  String title;
  String author;
  String description;
  String imageUrl;
  String downloadUrl;

  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.downloadUrl,
    required this.imageUrl,
  });

  // fromMap methodi
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
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
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
      'downloadUrl': downloadUrl,
    };
  }
}

