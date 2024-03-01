import 'package:ecommerce/data/model/order/order_model.dart';
import 'package:ecommerce/data/model/user/user_model.dart';
import 'package:ecommerce/data/repository/order_repository.dart';
import 'package:ecommerce/logic/cubid/order_cubid/order_state.dart';
import 'package:ecommerce/logic/cubid/user_cubid/user_cubid.dart';
import 'package:ecommerce/logic/cubid/user_cubid/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/cart/cart_model.dart';

class OrderCubid extends Cubit<OrderState> {
  BuildContext context;

  OrderCubid(this.context) : super(OrderInitialState()) {
    getOrder();
  }

  final OrderRepository _orderRepository = OrderRepository();

  Future<bool> postOrder(
      UserModel user, List<CartModel> cartItems, String status) async {
    emit(OrderLoadingState(state.orders));

    try {
      OrderModel order = await _orderRepository.bookOrder(
        user,
        cartItems,
        status == 'pay-now' ? 'payment-pending' : 'payment-complete',
      );
      state.orders = [order, ...state.orders];
      emit(OrderLoadedState(userOrder: state.orders));
      return true;
    } catch (e) {
      emit(OrderErrorState(state.orders, message: e.toString()));
      return false;
    }
  }

  Future<void> getOrder() async {
    emit(OrderLoadingState(state.orders));

    try {
      UserState userState = BlocProvider.of<UserCubit>(context).state;

      if (userState is UserLoggedInState) {
        List<OrderModel> orders =
            await _orderRepository.fetchAllOrders(userState.user.sId!);
        emit(OrderLoadedState(userOrder: orders));
        return;
      }

      emit(OrderErrorState(state.orders, message: "User not logged in"));
    } catch (e) {
      emit(OrderErrorState(state.orders, message: e.toString()));
    }
  }

// Future<bool> updateOrder(OrderModel order) async {
//   emit(OrderLoadingState(state.orders));
//
//   try {
//     OrderModel newOrder = await _orderRepository.updateOrder(order);
//
//     int index = state.orders.indexOf(newOrder);
//     state.orders[index] = newOrder;
//
//     emit(OrderLoadedState(userOrder: state.orders));
//     return true;
//   } catch (e) {
//     emit(OrderErrorState(state.orders, message: e.toString()));
//     return false;
//   }
// }
}
