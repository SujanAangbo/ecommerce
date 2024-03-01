import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/data/model/cart/cart_model.dart';
import 'package:ecommerce/logic/cubid/cart_cubid/cart_cubid.dart';
import 'package:ecommerce/logic/cubid/cart_cubid/cart_state.dart';
import 'package:ecommerce/logic/services/formatters.dart';
import 'package:ecommerce/logic/services/utils.dart';
import 'package:ecommerce/presentation/screens/order/order_screen.dart';
import 'package:ecommerce/presentation/widgets/cart_product_list_view.dart';
import 'package:ecommerce/presentation/widgets/default_button.dart';
import 'package:ecommerce/presentation/widgets/default_circular_widget.dart';
import 'package:ecommerce/presentation/widgets/default_error_widget.dart';
import 'package:ecommerce/presentation/widgets/form_title_text.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    CartCubid cartCubid = BlocProvider.of<CartCubid>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Products"),
      ),
      body: BlocBuilder<CartCubid, CartState>(builder: (context, state) {
        if (state is CartLoadingState && state.cartList.isEmpty) {
          return const DefaultCircularWidget();
        } else if (state.cartList.isEmpty) {
          return const DefaultErrorWidget(message: "No products in the cart");
        } else if (state is CartErrorState) {
          return DefaultErrorWidget(message: state.message);
        } else if (state is CartLoadedState || state is CartLoadingState) {
          return Column(
            children: [
              Expanded(
                child: CartProductListView(
                  cartList: state.cartList,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${state.cartList.length} items",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'Total: ${Formatters.formatNumber(
                            Utils.totalCartCost(state.cartList),
                          )}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      child: DefaultButton(
                        text: 'Place Order',
                        onPressed: () {
                          Navigator.pushNamed(context, OrderScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const GapWidget(),
            ],
          );
        }
        return const DefaultErrorWidget(
          message: "Something went wrong",
        );
      }),
    );
  }
}
