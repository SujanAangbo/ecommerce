import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/styles.dart';
import '../../data/model/product/product_model.dart';
import '../../logic/services/formatters.dart';
import '../screens/product_detail/product_detail_screen.dart';
import 'gap_widget.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> products;

  const ProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          ProductModel product = products[index];

          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailScreen.routeName,
                  arguments: product);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 3,
                    imageUrl: product.images!.isEmpty
                        ? Constants.defaultImage
                        : product.images![0],
                  ),
                  const GapWidget(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.heading2,
                        ),
                        Text(
                          product.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.body3,
                        ),
                        Text(
                          Formatters.formatNumber(product.price!),
                          style: TextStyles.body2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
