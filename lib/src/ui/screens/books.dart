// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:bookstore/src/logic/app.dart';
import 'package:bookstore/src/ui/widgets/book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooksScreen extends ConsumerWidget {
  const BooksScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(appLogic.select((value) => value.books));
    final logic = ref.read(appLogic.notifier);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Books'),
          bottom: TabBar(
            tabs: const [
              Tab(
                text: 'Popular',
                icon: Icon(Icons.people),
              ),
              Tab(
                text: 'New',
                icon: Icon(Icons.new_releases),
              ),
              Tab(
                text: 'All',
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BookList(books: logic.getPopularBooks(books), onTap: (val) {}),
            BookList(books: logic.getNewBooks(books), onTap: (val) {}),
            BookList(books: books, onTap: (val) {}),
          ],
        ),
      ),
    );
  }
}
