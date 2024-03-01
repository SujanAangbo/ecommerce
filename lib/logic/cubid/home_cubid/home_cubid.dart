import 'package:ecommerce/data/model/product/product_model.dart';
import 'package:ecommerce/data/repository/product_repository.dart';
import 'package:ecommerce/logic/cubid/category_cubid/category_state.dart';
import 'package:ecommerce/logic/cubid/home_cubid/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubid extends Cubit<HomeState> {
  HomeCubid() : super(HomeInitialState()) {
    fetchAllProducts();
  }

  ProductRepository productRepository = ProductRepository();

  void fetchAllProducts() async {
    emit(HomeLoadingState(state.products));
    try {
      List<ProductModel> products = await productRepository.fetchAllProducts();
      emit(HomeLoadedState(products));
    } catch (e) {
      emit(HomeErrorState(e.toString(), state.products));
    }
  }
}
