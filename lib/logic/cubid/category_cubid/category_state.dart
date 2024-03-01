import '../../../data/model/category/category_model.dart';

abstract class CategoryState {
  List<CategoryModel> categories;

  CategoryState(this.categories);
}

class InitialState extends CategoryState {
  InitialState() : super([]);
}

class CategoryLoadingState extends CategoryState {
  CategoryLoadingState(super.categories);
}

class CategoryLoadedState extends CategoryState {
  CategoryLoadedState(super.categories);
}

class CategoryErrorState extends CategoryState {
  String message;

  CategoryErrorState(this.message, super.categories);
}
