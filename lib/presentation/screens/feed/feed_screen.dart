import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/styles.dart';
import 'package:ecommerce/data/model/product/product_model.dart';
import 'package:ecommerce/logic/cubid/home_cubid/home_cubid.dart';
import 'package:ecommerce/logic/cubid/home_cubid/home_state.dart';
import 'package:ecommerce/logic/services/formatters.dart';
import 'package:ecommerce/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:ecommerce/presentation/widgets/default_circular_widget.dart';
import 'package:ecommerce/presentation/widgets/default_error_widget.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubid, HomeState>(builder: (context, state) {
      if (state is HomeLoadedState && state.products.isEmpty) {
        return const DefaultCircularWidget();
      }

      if (state is HomeErrorState) {
        return DefaultErrorWidget(message: state.message);
      }

      return ProductListView(products: state.products);
    });
  }
}
