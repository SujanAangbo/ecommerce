import '../../../data/model/product/product_model.dart';

abstract class HomeState {
  List<ProductModel> products;

  HomeState(this.products);
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super([]);
}

class HomeLoadingState extends HomeState {
  HomeLoadingState(super.products);
}

class HomeLoadedState extends HomeState {
  HomeLoadedState(super.products);
}

class HomeErrorState extends HomeState {
  String message;

  HomeErrorState(this.message, super.products);
}
