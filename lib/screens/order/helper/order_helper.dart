import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order/enum/orderStatus.dart';

class OrderStatusHelper{
  static String getStatus(OrderStatus status){
    switch(status){
      case OrderStatus.newOrder:
        return "new";
      case OrderStatus.processing : 
        return "processing";
      case OrderStatus.send : 
        return "send";
      case OrderStatus.delivered: 
        return "delivered";
      default :
        return "error";
    }
  }

   static OrderStatus getStatusFromString(String status){
    switch(status){
      case "new":
        return OrderStatus.newOrder;
      case "processing" : 
        return OrderStatus.processing;
      case "send" : 
        return OrderStatus.send;
      case "delivered": 
        return OrderStatus.delivered;
      default  :
        return OrderStatus.error;
    }
  }

  static Widget getStatusIcon(OrderStatus status){
    switch(status){
      case OrderStatus.newOrder:
        return const Icon(Icons.bookmark_border, color: Colors.blue,);
      case OrderStatus.processing : 
        return const Icon(Icons.autorenew, color: Colors.grey,);
      case OrderStatus.send : 
        return const Icon(Icons.local_shipping, color: Colors.yellow,);
      case OrderStatus.delivered: 
        return const Icon(Icons.check, color: Colors.green,);
      default :
        return const Icon(Icons.error, color: Colors.red,);
    }
  }

}
