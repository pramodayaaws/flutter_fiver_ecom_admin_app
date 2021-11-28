import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/models/AdminProduct.dart';

class ProductProvider with ChangeNotifier {
   AdminProduct _addProductObject = AdminProduct(
      id: 0,
      images: ["assets/images/ps4_console_white_1.png",],
      colors: [Color(0xFFF6625E)],
      title: '',
      price: 0.0,
      description: '',
      height: 0.0,
      weight: 0.0,
      width: 0.0,
      categoryId: 0,
      categoryName: '',
      oldPrice: 0.0,
      discount: 0.0,
      isOffer: false,
      heightType: '',
      weightType: '',
      widthType: '',
      priceType: '');

   AdminProduct getAddProductObject() => _addProductObject;

   updateAddProductObject(AdminProduct product){
      _addProductObject = product;
      notifyListeners();
   }

}
