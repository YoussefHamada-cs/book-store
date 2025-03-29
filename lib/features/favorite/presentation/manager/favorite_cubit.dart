import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_store/features/home/domain/entites/book.dart';

class FavoriteCubit extends Cubit<List<Book>> {
  FavoriteCubit() : super([]);

  // إضافة كتاب إلى المفضلة
  void addToFavorites(Book book) {
    if (!state.contains(book)) {
      emit([...state, book]);
    }
  }

  // إزالة كتاب من المفضلة
  void removeFromFavorites(Book book) {
    emit(state.where((b) => b != book).toList());
  }

  // التحقق مما إذا كان الكتاب موجودًا في المفضلة
  bool isFavorite(Book book) {
    return state.contains(book);
  }
}