import 'package:bookstore/src/model/book.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  final List<BookModel> books;
  final ValueChanged<BookModel>? onTap;

  const BookList({
    required this.books,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            books[index].title,
          ),
          subtitle: Text(
            books[index].author.name,
          ),
          onTap: onTap != null ? () => onTap!(books[index]) : null,
        ),
      );
}
