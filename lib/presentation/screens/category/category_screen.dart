import 'package:ecommerce/data/model/category/category_model.dart';
import 'package:ecommerce/logic/cubid/category_cubid/category_cubid.dart';
import 'package:ecommerce/logic/cubid/category_cubid/category_state.dart';
import 'package:ecommerce/presentation/screens/category/category_product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubid, CategoryState>(builder: (context, state) {
      if (state is CategoryLoadingState && state.categories == []) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is CategoryErrorState) {
        return Center(
          child: Text(state.message),
        );
      }

      return ListView.builder(
          itemCount: state.categories.length,
          itemBuilder: (context, index) {
            CategoryModel category = state.categories[index];

            return ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CategoryProductDetailScreen.routeName,
                  arguments: {
                    'category': category,
                    'title': category.title,
                  },
                );
              },
              leading: Icon(Icons.category),
              title: Text(category.title ?? "Others"),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          });
    });
  }
}
