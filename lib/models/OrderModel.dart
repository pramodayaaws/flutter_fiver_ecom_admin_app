import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? uid;
  String? userFirstName;
  String? userLastName;
  String? userEmail;
  String? userPhoneNumber;
  String? userAddress;
  String? productUid;
  String? productName;
  String? productColor;
  String? productPrice;
  String? productCount;
  String? orderStatus;
  Timestamp? orderCreatedDate;
  
  

  OrderModel(
      {this.uid,
      this.userFirstName,
      this.userLastName,
      this.userEmail,
      this.userPhoneNumber,
      this.userAddress,
      this.productUid,
      this.productName,
      this.productColor,
      this.productPrice,
      this.productCount,
      this.orderStatus, 
      this.orderCreatedDate,
      });

  // receiving data from server
  factory OrderModel.fromMap(map) {
    return OrderModel(
      uid: map['uid'],
      userLastName: map['userLastName'],
      userFirstName: map['userFirstName'],
      userEmail: map['userEmail'],
      userPhoneNumber: map['userPhoneNumber'],
      userAddress: map['userAddress'],
      productUid: map['productUid'],
      productName: map['productName'],
      productColor: map['productColor'],
      productCount: map['productCount'],
      productPrice: map['productPrice'],
      orderStatus: map['orderStatus'],
      orderCreatedDate: map['orderCreatedDate']
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': userEmail,
      'firstName': userFirstName,
      'lastName': userLastName,
      'phoneNumber': userPhoneNumber,
      'address': userAddress,
      'productUid':productUid,
      'productName':productName,
      'productColor':productColor,
      'productCount': productCount,
      'productPrice':productPrice,
      'orderStatus' : orderStatus,
      'orderCreatedDate': orderCreatedDate,
    };
  }
}
