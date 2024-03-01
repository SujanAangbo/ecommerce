import 'package:ecommerce/data/model/order/order_model.dart';

abstract class OrderState {
  List<OrderModel> orders;

  OrderState(this.orders);
}

class OrderInitialState extends OrderState {
  OrderInitialState() : super([]);
}

class OrderLoadingState extends OrderState {
  OrderLoadingState(super.orders);
}

class OrderLoadedState extends OrderState {
  List<OrderModel> userOrder;

  OrderLoadedState({required this.userOrder}) : super(userOrder);
}

class OrderErrorState extends OrderState {
  String message;

  OrderErrorState(super.orders, {required this.message});
}
