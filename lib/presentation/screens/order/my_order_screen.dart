import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/data/model/cart/cart_model.dart';
import 'package:ecommerce/data/model/order/order_model.dart';
import 'package:ecommerce/logic/cubid/order_cubid/order_cubid.dart';
import 'package:ecommerce/logic/services/formatters.dart';
import 'package:ecommerce/presentation/widgets/default_circular_widget.dart';
import 'package:ecommerce/presentation/widgets/default_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/cubid/order_cubid/order_state.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  static const String routeName = '/my_order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<OrderCubid, OrderState>(
          builder: (context, state) {
            if (state is OrderLoadingState) {
              return const DefaultCircularWidget();
            } else if (state is OrderErrorState) {
              return DefaultErrorWidget(message: state.message);
            }

            List<OrderModel> orders = state.orders;

            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                OrderModel order = orders[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product ID: ${order.sid!}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Total Cost: ${order.totalAmount.toString()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      Formatters.formatDate(order.createdOn!),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: order.items!.length,
                      itemBuilder: (context, index) {
                        CartModel cartProduct = order.items![index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CachedNetworkImage(
                            width: 60,
                            imageUrl: cartProduct.product!.images!.isEmpty
                                ? Constants.defaultImage
                                : cartProduct.product!.images![0],
                          ),
                          title: Text(
                            cartProduct.product!.title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          subtitle:
                              Text("Quantity: ${cartProduct.quantity ?? 1}"),
                          trailing: Text(
                            Formatters.formatNumber(
                                cartProduct.product!.price! *
                                    cartProduct.quantity!),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      height: 30,
                      color: Colors.grey,
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
