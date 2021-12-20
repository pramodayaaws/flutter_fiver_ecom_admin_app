import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/models/AdminProduct.dart';
import 'package:flutter_fiver_ecom_admin_app/models/OrderModel.dart';

class OrderProvider with ChangeNotifier {
  OrderModel _order = OrderModel(
    uid: "",
    userEmail: "",
    userFirstName: "",
    userLastName: "",
    userPhoneNumber: "",
    userAddress: "",
    productUid: "",
    productName: "",
    productColor: "",
    productPrice: "",
    productCount: "",
    orderStatus: "",
    orderCreatedDate: null,
  );

  OrderModel getOrder() => _order;

  updateOrder(OrderModel order) {
    _order = order;
    notifyListeners();
  }
}
