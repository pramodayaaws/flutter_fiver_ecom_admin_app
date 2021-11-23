import 'package:flutter/material.dart';

class AdminProduct {
  final int id, categoryId;
  final String title,
      description,
      categoryName,
      priceType,
      heightType,
      weightType,
      widthType;
  final List<String> images;
  final List<Color> colors;
  final double rating, price, height, width, weight, oldPrice, discount;
  final bool isFavourite, isPopular, isOffer;

  AdminProduct({
    required this.id,
    required this.images,
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
}

/**
 * sample admin product object
 */

AdminProduct initialAdminObject = AdminProduct(
    id: 0,
    images: [
      "assets/images/ps4_console_white_1.png",
    ],
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
