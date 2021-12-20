import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/models/OrderModel.dart';
import 'package:flutter_fiver_ecom_admin_app/providers/order_provider.dart';
import 'package:flutter_fiver_ecom_admin_app/providers/product_provider.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order/helper/order_helper.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order_detail/order_detail_screen.dart';
import 'package:provider/provider.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .orderBy('orderCreatedDate', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: snapshot.data!.docs.map((documentData) {

              var orderProvider =
                  Provider.of<OrderProvider>(context, listen: false);
              OrderModel orderObj = OrderModel.fromMap(documentData);
              orderProvider.updateOrder(orderObj);

              return Card(
                borderOnForeground: true,
                elevation: 0.5,
                child: ListTile(
                  leading: OrderStatusHelper.getStatusIcon(
                      OrderStatusHelper.getStatusFromString(
                          documentData['orderStatus'])),
                  title: Text(documentData['productName'] +
                      documentData['orderCreatedDate'].toDate().toString()),
                  subtitle: Text(documentData['userFirstName'] +
                      " " +
                      documentData['userAddress']),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.pushNamed(context, OrderDetailScreen.routeName);
                  },
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
