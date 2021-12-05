import 'dart:io';

import 'package:flutter/material.dart';

class AdminProduct {
  final int id, categoryId;
  final String title,
      description,
      categoryName,
      priceType,
      heightType,
      weightType,
      widthType,
      uid;
  final List<String> images;
  final List<File> imageList;
  final List<Color> colors;
  final double rating, price, height, width, weight, oldPrice, discount;
  final bool isFavourite, isPopular, isOffer;

  AdminProduct({
    required this.uid,
    required this.id,
    required this.images,
    required this.imageList,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.height,
    required this.weight,
    required this.width,
    required this.categoryId,
    required this.categoryName,
    required this.oldPrice,
    required this.discount,
    required this.isOffer,
    required this.heightType,
    required this.weightType,
    required this.widthType,
    required this.priceType,
  });

  //receiving data from server
  factory AdminProduct.fromMap(map) {
    return AdminProduct(
        uid: map['uid'],
        id: map['id'],
        images: map['images'],
        imageList: map['imageList'],
        colors: map['colors'],
        title: map['title'],
        price: map['price'],
        description: map['description'],
        height: map['height'],
        weight: map['weight'],
        width: map['width'],
        categoryId: map['categoryId'],
        categoryName: map['categoryName'],
        oldPrice: map['oldPrice'],
        discount: map['discount'],
        isOffer: map['isOffer'],
        heightType: map['heightType'],
        weightType: map['weightType'],
        widthType: map['widthType'],
        priceType: map['priceType']);
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'id': id,
      'images': images,
      'imageList': imageList,
      'colors': colors,
      'title': title,
      'price': price,
      'description': description,
      'weight': weight,
      'height': height,
      'width': width,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'oldPrice': oldPrice,
      'discount': discount,
      'isOffer': isOffer,
      'heightType': heightType,
      'weightType': weightType,
      'widthType': widthType,
      'priceType': priceType,
    };
  }
}

/**
 * sample admin product object
 */

AdminProduct initialAdminObject = AdminProduct(
    uid: '',
    id: 0,
    images: [
      "assets/images/ps4_console_white_1.png",
    ],
    imageList: [],
    colors: [Color(0xFFF6625E)],
    title: "",
    price: 0.0,
    description: "",
    height: 0.0,
    weight: 0.0,
    width: 0.0,
    categoryId: 0,
    categoryName: "",
    oldPrice: 0.0,
    discount: 0.0,
    isOffer: false,
    heightType: "",
    priceType: "",
    weightType: "",
    widthType: "",
    isFavourite: false,
    isPopular: false,
    rating: 0.0);
