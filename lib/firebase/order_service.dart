import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fiver_ecom_admin_app/models/OrderModel.dart';

class OrderService {
  OrderService();

  final CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('orders');

  ///get order list
  List<OrderModel> _orderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var  result = OrderModel.fromMap(doc.data());
      return result;
    }).toList();
  }

  Stream<List<OrderModel> > getOrderList() {
    return orderCollection.snapshots().map(_orderListFromSnapshot);
  }
}
