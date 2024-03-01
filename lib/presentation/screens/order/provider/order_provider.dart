import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier {
  String? paymentMethod = "pay-now";

  void changePaymentMethod(String? value) {
    paymentMethod = value;
    notifyListeners();
  }
}
