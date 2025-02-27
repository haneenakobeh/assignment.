class Library {
  final Map<String, Map<String, dynamic>> _books = {};

  void addBook({
    required String title,
    String author = 'Unknown',
    int year = 0,
    String genre = 'General',
  }) {
    _books[title] = {'author': author, 'year': year, 'genre': genre};
    print("Book added successfully.");
  }

  String getBookInfo({required String title}) {
    if (_books.containsKey(title)) {
      return "Author: ${_books[title]!['author']}, Year: ${_books[title]!['year']}, Genre: ${_books[title]!['genre']}";
    }
    return "Book not found.";
  }

  void listAllBooks({String? genre}) {
    if (_books.isEmpty) {
      print("No books available in the library.");
      return;
    }
    _books.forEach((title, book) {
      if (genre == null || book['genre'] == genre) {
        print(
          "Title: $title, Author: ${book['author']}, Year: ${book['year']}, Genre: ${book['genre']}",
        );
      }
    });
  }

  List<String> listBooksByGenre({required String genre}) {
    List<String> booksInGenre =
        _books.entries
            .where((entry) => entry.value['genre'] == genre)
            .map((entry) => entry.key)
            .toList();
    return booksInGenre.isNotEmpty
        ? booksInGenre
        : ["No books found for this genre."];
  }

  String removeBook({required String title}) {
    if (_books.remove(title) != null) {
      return "Book removed successfully.";
    }
    return "Book not found.";
  }
}

void main() {
  var library = Library();

  library.addBook(
    title: "Harry Potter and the Philosopher's Stone",
    author: "J. K. Rowling",
    year: 1997,
    genre: "Fantasy",
  );
  library.addBook(
    title: "All the Light We Cannot See",
    author: "Anthony Doerr",
    year: 2014,
    genre: "Historical fiction",
  );
  library.addBook(
    title: "The Catcher in the Rye",
    author: "J. D. Salinger",
    year: 1951,
    genre: "Realistic fiction",
  );
  library.addBook(
    title: "Alice’s Adventures in Wonderland ",
    author: "Lewis Carroll",
    year: 2021,
    genre: "Fantasy",
  );

  print(library.getBookInfo(title: "All the Light We Cannot See"));

  print("\nAll Books:");
  library.listAllBooks();

  print("\nFantasy Books:");
  library.listAllBooks(genre: "Fantasy");

  print("${library.listBooksByGenre(genre: 'Realistic fiction')} ");

  print(" ${library.removeBook(title: 'All the Light We Cannot See')} ");
  print(" ${library.removeBook(title: 'A Court of Thorns and Roses')} ");
}
