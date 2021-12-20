import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/constants.dart';
import 'package:flutter_fiver_ecom_admin_app/models/OrderModel.dart';
import 'package:flutter_fiver_ecom_admin_app/providers/order_provider.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order/helper/order_helper.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

///Save color to firebase------
///Color black = Colors.black; // example black color
///String _storeColorValue = black.value.toString() ;

///get from firebase------
///int value = int.parse(_storeColorValue);
///Color color = Color(value).withOpacity(1);

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key, OrderModel? orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, data, child) {
      var _order = context.read<OrderProvider>().getOrder();
      int _intOrderColor = int.parse(_order.productColor.toString());
      Color orderColor = Color(_intOrderColor);

      return Column(
        children: [
          getRowTextField(
            context,
            "Product name",
            _order.productName.toString(),
          ),
          getColorField(context, "Color", orderColor),
          getRowTextField(
            context,
            "Product Price",
            _order.productPrice.toString(),
          ),
          getRowTextField(
            context,
            "Count",
            _order.productCount.toString(),
          ),
          getRowTextField(
            context,
            "Email",
            _order.userEmail.toString(),
          ),
          getRowTextField(
            context,
            "First name",
            _order.userFirstName.toString(),
          ),
          getRowTextField(
            context,
            "Last name",
            _order.userLastName.toString(),
          ),
          getRowTextField(
            context,
            "Address",
            _order.userAddress.toString(),
          ),
          getRowTextField(
            context,
            "Phone number",
            _order.userPhoneNumber.toString(),
          ),
          getRowTextField(
            context,
            "Ordered date",
            _order.orderCreatedDate!.toDate().toString(),
          ),
        ],
      );
    });
  }
}

Widget getRowTextField(BuildContext context, String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 30, right: 5),
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 3,
        child: Text(
          "${title}",
          style: TextStyle(color: kTextHeadColor1, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          height: MediaQuery.of(context).size.height / 15,
          child: Text("${value}"),
        ),
      ),
    ],
  );
}

Widget getColorField(BuildContext context, String title, Color value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 30, right: 0),
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 3,
        child: Text(
          "${title}",
          style: TextStyle(color: kTextHeadColor1, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 0, right: 5),
              height: MediaQuery.of(context).size.height / 15,
              child: CustomColorDot(
                color: value,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class CustomColorDot extends StatelessWidget {
  final Color color;
  const CustomColorDot({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
