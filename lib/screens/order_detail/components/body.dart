import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/firebase/order_service.dart';
import 'package:flutter_fiver_ecom_admin_app/models/OrderModel.dart';
import 'package:flutter_fiver_ecom_admin_app/providers/order_provider.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order/components/all_orders.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order_detail/components/order_detail.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'home_header.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenWidth(30)),
                OrderDetail(),
              ],
            ),
          ),
        );
  }
}