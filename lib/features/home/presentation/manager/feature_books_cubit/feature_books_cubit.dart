import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/domain/use_cases/get_feature_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.getFeatureBooksUseCase) : super(FeatureBooksInitial());
  final GetFeatureBooksUseCase getFeatureBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeatureBooksLoading());
    } else {
      emit(FeatureBooksPaginationLoading());
    }

    var result = await getFeatureBooksUseCase.call(pageNumber);
    result.fold(
      (failures) {
        if (pageNumber==0) {
          emit(FeatureBooksFailure(failures.errormessage));
        }else{
        emit(  FeatureBooksPaginationFailure(failures.errormessage));
        }
        
      },
      (books) {
        emit(FeatureBooksSuccess(books));
      },
    );
  }
}
