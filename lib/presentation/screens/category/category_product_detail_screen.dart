import 'package:ecommerce/logic/cubid/category_product_cubid/category_product_cubid.dart';
import 'package:ecommerce/logic/cubid/category_product_cubid/category_product_state.dart';
import 'package:ecommerce/presentation/widgets/default_circular_widget.dart';
import 'package:ecommerce/presentation/widgets/default_error_widget.dart';
import 'package:ecommerce/presentation/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductDetailScreen extends StatelessWidget {
  final String categoryTitle;

  const CategoryProductDetailScreen({super.key, required this.categoryTitle});

  static const String routeName = '/category_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("$categoryTitle Products"),
    ),
    body: BlocBuilder<CategoryProductCubid, CategoryProductState>(
        builder: (context, state) {
      if (state is CategoryProductLoadingState && state.products.isEmpty) {
        return const DefaultCircularWidget();
      } else if (state is CategoryProductErrorState) {
        return DefaultErrorWidget(message: state.message);
      } else if (state.products.isEmpty) {
        return const DefaultErrorWidget(
            message: "No Products available for this category");
      } else {
        final products = (state as CategoryProductLoadedState).products;
        return ProductListView(products: products);
      }
    }
    ),);
  }
}
