import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../common/globals.dart';
import '../../../providers/product_provider.dart';

class AddProductMethods{
  BuildContext context;
  AddProductMethods({required this.context});

  Future addImages() async{
    var addProductProvider = Provider.of<ProductProvider>(context, listen: false);
    var productObj = addProductProvider.getAddProductObject();
    final ImagePicker _picker = ImagePicker();

    final image = await _picker.pickImage(source: ImageSource.gallery);
    if(image== null) return;
    final imageTempory = File(image.path);
    productObj.imageList.add(imageTempory);
    addProductProvider.updateAddProductObject(productObj);
    uploadImage(imageTempory);
  }

  Future deleteProductImage() async {
    var addProductProvider = Provider.of<ProductProvider>(context, listen: false);
    var productObj = addProductProvider.getAddProductObject();

    if(productObj.imageList.isNotEmpty){
      productObj.imageList.removeAt(addProductSelectedImageIndex);
      productObj.images.removeAt(addProductSelectedImageIndex);
      addProductProvider.updateAddProductObject(productObj);
      resetAddProductSelectedImageIndex();
    }
  }

  resetAddProductSelectedImageIndex(){
    if(addProductSelectedImageIndex==0) return;
    addProductSelectedImageIndex-=1;
  }

/// Uploading file to firestore and get the downloaded url
Future uploadImage(File file) async{
  var addProductProvider = Provider.of<ProductProvider>(context, listen: false);
  var productObj = addProductProvider.getAddProductObject();
  
  
    String? downloadUrl;
    Reference ref = FirebaseStorage.instance.ref().child("images");
    await ref.putFile(file);
    downloadUrl = await ref.getDownloadURL().then((value) {
      productObj.images.add(value.toString());
      addProductProvider.updateAddProductObject(productObj);
    });
    
    
}


}