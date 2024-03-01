import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/styles.dart';
import 'package:ecommerce/data/model/product/product_model.dart';
import 'package:ecommerce/logic/cubid/cart_cubid/cart_cubid.dart';
import 'package:ecommerce/logic/cubid/cart_cubid/cart_state.dart';
import 'package:ecommerce/logic/services/formatters.dart';
import 'package:ecommerce/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce/presentation/widgets/default_button.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  ProductDetailScreen({super.key, required this.product});

  static const String routeName = '/product_detail';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: product.images!.isNotEmpty
                  ? product.images
                      ?.map((e) => Image.network(e.toString()))
                      .toList()
                  : [Image.network(Constants.defaultImage)],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.width,
                autoPlay: true,
              ),
            ),
            Text(
              product.title ?? "",
              maxLines: 1,
              style: TextStyles.heading1,
            ),
            const GapWidget(),
            Text(
              "Description:",
              style: TextStyles.body2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const GapWidget(),
            Text(
              product.description ?? "",
              style: TextStyles.body2,
            ),
            const GapWidget(),
            Text(
              Formatters.formatNumber(product.price!),
              style: TextStyles.body2.copyWith(color: Colors.orange),
            ),
            const GapWidget(),
            BlocBuilder<CartCubid, CartState>(builder: (context, state) {
              final cartCubid = BlocProvider.of<CartCubid>(context);
              bool isProductAtCart = cartCubid.cartContains(product);

              return DefaultButton(
                text: isProductAtCart
                    ? "Product Already added to cart"
                    : "Add to Cart",
                onPressed: () async {
                  if (isProductAtCart) {
                    return;
                  }
                  showModalBottomSheet(
                    backgroundColor: Colors.red,
                    context: context,
                    builder: (context) => BottomSheet(
                      onClosing: () {},
                      builder: (context) {
                        return SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Select Quantity",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 20),
                              ),
                              const GapWidget(),
                              InputQty.int(
                                initVal: 1,
                                minVal: 1,
                                onQtyChanged: (qty) {
                                  quantity = qty as int;
                                },
                              ),
                              const GapWidget(),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: DefaultButton(
                                  text: "Add to Cart",
                                  onPressed: () async {
                                    await cartCubid.addToCart(
                                        product, quantity);
                                    log("Successfully added to cart");
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
