import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/models/AdminProduct.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'components/speed_dial_button_column.dart';

class AddProductScreen extends StatelessWidget {
  static String routeName = "/add_product";






  @override
  Widget build(BuildContext context) {
    // final ProductDetailsArguments agrs =
    //     ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: initialAdminObject.rating),
      ),
      floatingActionButton: SpeedDialButtonColumn(),
      body: Body(product: initialAdminObject),
    );
  }
}

class ProductDetailsArguments {
  final AdminProduct adminProduct;

  ProductDetailsArguments({required this.adminProduct});
}