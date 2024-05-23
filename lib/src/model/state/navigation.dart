import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    @Default(RootPage.login) RootPage root,
    @Default(MenuPage.books) MenuPage menu,
    StackList<MobileScreen>? screens,
    @Default({}) Map<String, dynamic> argument,
    @Default("") String id,
  }) = _NavigationState;
}

class StackList<T> {
  final _stack = Queue<T>();

  int get length => _stack.length;

  bool canPop() => _stack.isNotEmpty;

  List<T> get list => _stack.toList();

  void clearStack() {
    _stack.clear();
  }

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  T? peak() => _stack.isEmpty ? null : _stack.last;
}

enum RootPage { loading, login, menu }

enum MobileScreen { bookDetails, authorsDetails, none }

enum MenuPage { books, authors, settings }
