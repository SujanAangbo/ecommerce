import '../../../data/model/cart/cart_model.dart';

abstract class CartState {
  List<CartModel> cartList;

  CartState(this.cartList);
}

class CartInitialState extends CartState {
  CartInitialState() : super([]);
}

class CartLoadingState extends CartState {
  CartLoadingState(super.cartList);
}

class CartLoadedState extends CartState {
  CartLoadedState(super.cartList);
}

class CartErrorState extends CartState {
  String message;

  CartErrorState(this.message, super.cartList);
}
