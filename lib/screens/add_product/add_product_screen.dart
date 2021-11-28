import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/models/AdminProduct.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class AddProductScreen extends StatelessWidget {
  static String routeName = "/add_product";


  void getImage(BuildContext context) async{
    var addProductProvider = Provider.of<ProductProvider>(context, listen: false);
    var productObj = addProductProvider.getAddProductObject();
    var imgArr = productObj.images;

    final ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery,).then((value) => {
      imgArr.add(value!.path),
      addProductProvider.updateAddProductObject(productObj)
    });

  }



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
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.check),
          backgroundColor: new Color(0xFFE57373),
          onPressed: (){
            getImage(context);
          }
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Body(product: initialAdminObject),
    );
  }
}

class ProductDetailsArguments {
  final AdminProduct adminProduct;

  ProductDetailsArguments({required this.adminProduct});
}


addItem(BuildContext context){
  var addProductProvider = Provider.of<ProductProvider>(context, listen: false);
  var productObj = addProductProvider.getAddProductObject();
  var imgArr = productObj.images;
  imgArr.add("assets/images/Image Popular Product 2.png");
  addProductProvider.updateAddProductObject(productObj);
}