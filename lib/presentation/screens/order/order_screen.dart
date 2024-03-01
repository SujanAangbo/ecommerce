import 'package:ecommerce/core/styles.dart';
import 'package:ecommerce/data/model/cart/cart_model.dart';
import 'package:ecommerce/data/model/user/user_model.dart';
import 'package:ecommerce/logic/cubid/cart_cubid/cart_cubid.dart';
import 'package:ecommerce/logic/cubid/cart_cubid/cart_state.dart';
import 'package:ecommerce/logic/cubid/order_cubid/order_cubid.dart';
import 'package:ecommerce/logic/cubid/user_cubid/user_cubid.dart';
import 'package:ecommerce/logic/cubid/user_cubid/user_state.dart';
import 'package:ecommerce/presentation/screens/order/order_success_screen.dart';
import 'package:ecommerce/presentation/screens/order/provider/order_provider.dart';
import 'package:ecommerce/presentation/screens/profile/edit_profile_screen.dart';
import 'package:ecommerce/presentation/widgets/cart_product_list_view.dart';
import 'package:ecommerce/presentation/widgets/default_button.dart';
import 'package:ecommerce/presentation/widgets/default_circular_widget.dart';
import 'package:ecommerce/presentation/widgets/default_error_widget.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  static const String routeName = '/order';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isErrorVisible = false;

  @override
  Widget build(BuildContext context) {
    late UserModel userDetails;
    late List<CartModel> cartDetails;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // this is for user details
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserLoadingState) {
                    return const DefaultCircularWidget();
                  } else if (state is UserErrorState) {
                    return DefaultErrorWidget(message: state.message);
                  } else if (state is UserLoggedInState) {
                    userDetails = state.user;
                    UserModel user = userDetails;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User Data', style: TextStyles.heading3),
                        const GapWidget(),
                        Text('${user.fullName}', style: TextStyles.heading2),
                        Text('Email: ${user.email}', style: TextStyles.body3),
                        Text('Phone Number: ${user.phoneNumber}',
                            style: TextStyles.body3),
                        Text('Address: ${user.address}',
                            style: TextStyles.body3),
                        LinkButton(
                            text: 'Edit Profile',
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                EditProfileScreen.routeName,
                                arguments: user,
                              );
                            }),
                      ],
                    );
                  }

                  return const DefaultErrorWidget(
                      message: 'Something went wrong');
                },
              ),
              const GapWidget(),
              Text('Product Details', style: TextStyles.heading3),
              const GapWidget(),

              // this is for product details
              BlocBuilder<CartCubid, CartState>(
                builder: (context, state) {
                  if (state is CartLoadingState && state.cartList.isEmpty) {
                    return const DefaultCircularWidget();
                  } else if (state is CartErrorState) {
                    return DefaultErrorWidget(message: state.message);
                  } else if (state.cartList.isEmpty) {
                    return const DefaultErrorWidget(
                      message: "No items in the cart",
                    );
                  } else {
                    cartDetails = state.cartList;
                    List<CartModel> cartItems = cartDetails;
                    return CartProductListView(
                      cartList: cartItems,
                      isScrollable: false,
                    );
                  }
                },
              ),
              const GapWidget(),
              Text('Payment Details', style: TextStyles.heading3),
              Consumer<OrderProvider>(builder: (context, provider, ref) {
                return Column(
                  children: [
                    RadioListTile(
                      value: 'pay-on-delivery',
                      groupValue: provider.paymentMethod,
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Pay on Delivery'),
                      onChanged: provider.changePaymentMethod,
                    ),
                    RadioListTile(
                      value: 'pay-now',
                      groupValue: provider.paymentMethod,
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Pay Now'),
                      onChanged: provider.changePaymentMethod,
                    )
                  ],
                );
              }),

              const GapWidget(),
              Visibility(
                visible: isErrorVisible,
                child: const Text("Unable to order products"),
              ),
              const GapWidget(),
              DefaultButton(
                text: 'Place Order',
                onPressed: () async {
                  bool res = await BlocProvider.of<OrderCubid>(context)
                      .postOrder(
                          userDetails,
                          cartDetails,
                          Provider.of<OrderProvider>(context, listen: false)
                              .paymentMethod!);
                  if (res) {
                    isErrorVisible = false;
                    if (context.mounted) {
                      BlocProvider.of<CartCubid>(context)
                          .emitCartLoadedState([]);
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushNamed(
                          context, OrderSuccessScreen.routeName);
                    }
                  } else {
                    isErrorVisible = true;
                  }
                },
              ),
              // it gives error state so see it
              // BlocBuilder(builder: (context,))
            ],
          ),
        ),
      ),
    );
  }
}
