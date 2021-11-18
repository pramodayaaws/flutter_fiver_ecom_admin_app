import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/components/product_card.dart';
import 'package:flutter_fiver_ecom_admin_app/models/Product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class AllProducts extends StatelessWidget {

  List productList = [];
  void getProductList(List list, int chunkSize) {
    int len = list.length;
    for (var i = 0; i < len; i += chunkSize) {
      int size = i+chunkSize;
      productList.add(list.sublist(i, size > len ? len : size));
    }
  }



  @override
  Widget build(BuildContext context) {
    getProductList(demoProducts, 2);
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "All Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),

        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ...List.generate(
                productList.length,
                (index) {
                  return  Container(
                    padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(10), 0, getProportionateScreenHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(child: ProductCard(product: productList[index][0]),),
                        Container(child: ProductCard(product: productList[index][1])),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}