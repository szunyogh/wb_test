import 'package:bookstore/src/model/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';

@freezed
class AuthorModel with _$AuthorModel {
  const AuthorModel._();
  const factory AuthorModel({
    @Default(0) int id,
    @Default("") String name,
    @Default([]) List<BookModel> books,
  }) = _AuthorModel;
}
