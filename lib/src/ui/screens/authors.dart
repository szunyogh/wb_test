import 'package:bookstore/src/logic/app.dart';
import 'package:bookstore/src/ui/widgets/author_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorsScreen extends ConsumerWidget {
  final String title;

  const AuthorsScreen({
    this.title = 'Authors',
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authors = ref.watch(appLogic.select((value) => value.authors));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: AuthorList(
        authors: authors,
        onTap: (val) {},
      ),
    );
  }
}
