import 'package:ecommerce/logic/cubid/cart_cubid/cart_cubid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../core/constants.dart';
import '../../data/model/cart/cart_model.dart';
import '../../logic/services/formatters.dart';

class CartProductListView extends StatelessWidget {
  final List<CartModel> cartList;
  final bool isScrollable;

  const CartProductListView(
      {super.key, required this.cartList, this.isScrollable = true});

  @override
  Widget build(BuildContext context) {
    final cartCubid = BlocProvider.of<CartCubid>(context);
    return ListView.builder(
      itemCount: cartList.length,
      shrinkWrap: true,
      physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        CartModel cart = cartList[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Are you sure! \nDo you want to delete?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        cartCubid.removeFromCart(cart.product!);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              );
            },
            leading: Image.network(
              cart.product!.images!.isEmpty
                  ? Constants.defaultImage
                  : cart.product!.images![0],
              width: MediaQuery.of(context).size.width / 8,
            ),
            title: Text(
              cart.product!.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${Formatters.formatNumber(cart.product!.price!)} x ${cart.quantity} = ${Formatters.formatNumber(cart.product!.price! * cart.quantity!)}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            trailing: InputQty.int(
              initVal: cart.quantity ?? 1,
              minVal: 1,
              onQtyChanged: (qty) {
                cartCubid.addToCart(cart.product!, qty as int);
              },
            ),
          ),
        );
      },
    );
  }
}
