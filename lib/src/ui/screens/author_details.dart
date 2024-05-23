import 'package:bookstore/src/model/author.dart';
import 'package:bookstore/src/model/book.dart';
import 'package:flutter/material.dart';
import '../widgets/book_list.dart';

class AuthorDetailsScreen extends StatelessWidget {
  final AuthorModel author;
  final ValueChanged<BookModel> onBookTapped;

  const AuthorDetailsScreen({
    super.key,
    required this.author,
    required this.onBookTapped,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(author.name),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: BookList(
                  books: author.books,
                  onTap: (book) {
                    onBookTapped(book);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
