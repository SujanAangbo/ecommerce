import 'package:ecommerce/data/model/user/user_model.dart';
import 'package:equatable/equatable.dart';

import '../cart/cart_model.dart';

class OrderModel extends Equatable {
  String? sid;
  UserModel? user;
  List<CartModel>? items;
  String? status;
  int? totalAmount;
  DateTime? updatedOn;
  DateTime? createdOn;

  OrderModel({
    this.sid,
    this.user,
    this.items,
    this.status,
    this.updatedOn,
    this.createdOn,
    this.totalAmount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> map) {
    return OrderModel(
      sid: map['_id'],
      user: UserModel.fromJson(map['user']),
      items: (map['items'] as List<dynamic>)
          .map((e) => CartModel.fromJson(e))
          .toList(),
      status: map['status'],
      totalAmount: map['totalAmount'],
      updatedOn: DateTime.tryParse(map['updatedOn']),
      createdOn: DateTime.tryParse(map['createdOn']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": sid,
      "user": user!.toJson(),
      'items': items!.map((e) => e.toJson()).toList(),
      'status': status,
      'updatedOn': updatedOn?.toIso8601String(),
      'createdOn': createdOn?.toIso8601String(),
      'totalAmount': 100,
    };
  }

  @override
  List<Object?> get props => [sid];
}
