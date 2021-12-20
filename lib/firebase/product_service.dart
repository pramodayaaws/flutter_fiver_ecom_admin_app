import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductServiceFirebase {
  ProductServiceFirebase();

  /// Uploading file to firestore and get the downloaded url
  Future uploadImage(File file, BuildContext context) async {
    var addProductProvider =
        Provider.of<ProductProvider>(context, listen: false);
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
