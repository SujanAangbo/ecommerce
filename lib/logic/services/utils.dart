import '../../data/model/cart/cart_model.dart';

class Utils {
  static List<CartModel> sortCartProducts(List<CartModel> carts) {
    for (int i = 0; i < carts.length; i++) {
      for (int j = i + 1; j < carts.length; j++) {
        CartModel tempCart;
        String first = carts[i].product!.title!;
        String second = carts[j].product!.title!;

        if (first.compareTo(second) < 0) {
          tempCart = carts[i];
          carts[i] = carts[j];
          carts[j] = tempCart;
        }
      }
    }

    return carts;
  }

  static int totalCartCost(List<CartModel> cartList) {
    int sum = 0;
    for (int i = 0; i < cartList.length; i++) {
      sum += cartList[i].product!.price! * cartList[i].quantity!;
    }
    return sum;
  }
}
