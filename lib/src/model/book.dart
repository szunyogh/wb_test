import 'package:bookstore/src/model/author.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
class BookModel with _$BookModel {
  const BookModel._();
  const factory BookModel({
    @Default(0) int id,
    @Default("") String title,
    @Default(AuthorModel()) AuthorModel author,
    @Default(false) bool isPopular,
    @Default(false) bool isNew,
  }) = _BookModel;
}
