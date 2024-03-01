import 'package:ecommerce/data/model/category/category_model.dart';
import 'package:ecommerce/data/repository/category_repository.dart';
import 'package:ecommerce/logic/cubid/category_cubid/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubid extends Cubit<CategoryState> {
  CategoryCubid() : super(InitialState()) {
    getAllCategory();
  }

  CategoryRepository categoryRepository = CategoryRepository();

  void getAllCategory() async {
    emit(CategoryLoadingState(state.categories));

    try {
      List<CategoryModel> categories =
          await categoryRepository.fetchAllCategory();
      emit(CategoryLoadedState(categories));
    } catch (e) {
      emit(CategoryErrorState(e.toString(), state.categories));
    }
  }
}
