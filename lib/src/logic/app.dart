import 'package:bookstore/src/logic/base.dart';
import 'package:bookstore/src/model/author.dart';
import 'package:bookstore/src/model/book.dart';
import 'package:bookstore/src/model/state/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLogic = StateNotifierProvider<AppLogic, AppState>((ref) => AppLogic(ref.read));

class AppLogic extends BaseLogic<AppState> {
  AppLogic(Reader read) : super(read, const AppState());

  @override
  Future<void> initialize() async {
    addBook(title: 'Left Hand of Darkness', authorName: 'Ursula K. Le Guin', isPopular: true, isNew: true);
    addBook(title: 'Too Like the Lightning', authorName: 'Ada Palmer', isPopular: false, isNew: true);
    addBook(title: 'Kindred', authorName: 'Octavia E. Butler', isPopular: true, isNew: false);
    addBook(title: 'The Lathe of Heaven', authorName: 'Ursula K. Le Guin', isPopular: false, isNew: false);
  }

  void addBook({
    required String title,
    required String authorName,
    required bool isPopular,
    required bool isNew,
  }) {
    List<AuthorModel> allAuthors = List<AuthorModel>.from(state.authors);
    List<BookModel> allBooks = List<BookModel>.from(state.books);
    var author = allAuthors.firstWhere(
      (author) => author.name == authorName,
      orElse: () {
        final value = AuthorModel(id: allAuthors.length, name: authorName);
        allAuthors.add(value);
        return value;
      },
    );
    var book = BookModel(id: allBooks.length, title: title, isPopular: isPopular, isNew: isNew, author: author);

    author = author.copyWith(books: List<BookModel>.from(author.books)..add(book));

    final index = allAuthors.indexWhere((element) => element.id == author.id);

    if (index != -1) {
      allAuthors = allAuthors..replaceRange(index, index + 1, [author]);
    }

    allBooks.add(book);

    state = state.copyWith(authors: allAuthors, books: allBooks);
  }

  List<BookModel> getPopularBooks(List<BookModel> books) {
    return books.where((book) => book.isPopular).toList();
  }

  List<BookModel> getNewBooks(List<BookModel> books) {
    return books.where((book) => book.isNew).toList();
  }
}
