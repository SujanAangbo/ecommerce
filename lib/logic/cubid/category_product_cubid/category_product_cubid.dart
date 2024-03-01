import 'package:dio/dio.dart';
import 'package:ecommerce/data/model/product/product_model.dart';
import 'package:ecommerce/data/repository/product_repository.dart';
import 'package:ecommerce/logic/cubid/category_product_cubid/category_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/category/category_model.dart';

class CategoryProductCubid extends Cubit<CategoryProductState> {
  CategoryModel category;

  CategoryProductCubid(this.category) : super(CategoryProductInitialState()) {
    _initialize();
  }

  ProductRepository productRepository = ProductRepository();

  void _initialize() async {
    emit(CategoryProductLoadingState(state.products));

    try {
      List<ProductModel> products =
          await productRepository.fetchProductByCategory(category.sId!);
      emit(CategoryProductLoadedState(products));
    } catch (e) {
      emit(CategoryProductErrorState(e.toString(), state.products));
    }
  }
}
