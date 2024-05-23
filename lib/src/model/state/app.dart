import 'package:bookstore/src/model/author.dart';
import 'package:bookstore/src/model/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app.freezed.dart';

@freezed
class AppState with _$AppState {
  const AppState._();
  const factory AppState({
    @Default([]) List<BookModel> books,
    @Default([]) List<AuthorModel> authors,
  }) = _AppState;
}
