import 'package:ecommerce/data/model/cart/cart_model.dart';
import 'package:ecommerce/data/model/product/product_model.dart';
import 'package:ecommerce/data/repository/cart_repository.dart';
import 'package:ecommerce/logic/cubid/cart_cubid/cart_state.dart';
import 'package:ecommerce/logic/cubid/user_cubid/user_cubid.dart';
import 'package:ecommerce/logic/cubid/user_cubid/user_state.dart';
import 'package:ecommerce/logic/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubid extends Cubit<CartState> {
  BuildContext context;

  CartCubid(this.context) : super(CartInitialState()) {
    _initialize();
  }

  CartRepository cartRepository = CartRepository();

  void emitCartLoadedState(List<CartModel> cartList) {
    cartList = Utils.sortCartProducts(cartList);
    emit(CartLoadedState(cartList));
  }

  void _initialize() async {
    emit(CartLoadingState(state.cartList));
    final userState = BlocProvider.of<UserCubit>(context).state;

    if (userState is UserLoggedInState) {
      List<CartModel> cartList =
          await cartRepository.getAllCartData(userState.user.sId!);
      emitCartLoadedState(cartList);
    } else {
      emit(CartErrorState('User is not Logged In', state.cartList));
    }
  }

  Future<void> addToCart(ProductModel product, int quantity) async {
    emit(CartLoadingState(state.cartList));
    final userState = BlocProvider.of<UserCubit>(context).state;

    if (userState is UserLoggedInState) {
      List<CartModel> cartList = await cartRepository.addToCart(
        userId: userState.user.sId!,
        productId: product.sId!,
        quantity: quantity,
      );

      emitCartLoadedState(cartList);
    } else {
      emit(CartErrorState('User is not Logged In', state.cartList));
    }
  }

  Future<void> removeFromCart(ProductModel product) async {
    emit(CartLoadingState(state.cartList));
    final userState = BlocProvider.of<UserCubit>(context).state;

    if (userState is UserLoggedInState) {
      List<CartModel> cartList = await cartRepository.deleteCart(
        userId: userState.user.sId!,
        productId: product.sId!,
      );

      emitCartLoadedState(cartList);
    } else {
      emit(CartErrorState('User is not Logged In', state.cartList));
    }
  }

  bool cartContains(ProductModel product) {
    for (int i = 0; i < state.cartList.length; i++) {
      if (product.sId! == state.cartList[i].product!.sId!) {
        print("I am true");
        return true;
      }
    }
    return false;
  }
}
