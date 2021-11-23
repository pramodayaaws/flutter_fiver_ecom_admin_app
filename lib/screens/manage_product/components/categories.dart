import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/home/home_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/manage_product/manage_product_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/profile/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../add_product/add_product_screen.dart';
import '../enum/ManageProductPage.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> subHeading = [
      {"icon": "assets/icons/add-product.svg", "text": "Product", "manageProductPage" : ManageProductPage.addProduct},
      {"icon": "assets/icons/add-category.svg", "text": "Category" , "manageProductPage" :  ManageProductPage.category},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(icon: subHeading[0]['icon'],text: subHeading[0]['text'],manageProductPage: subHeading[0]['manageProductPage'], press: () {  Navigator.pushNamed(context, AddProductScreen.routeName);},),
          CategoryCard(icon: subHeading[1]['icon'],text: subHeading[0]['text'],manageProductPage: subHeading[0]['manageProductPage'], press: () {  Navigator.pushNamed(context, ProfileScreen.routeName);},),
        ]
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
    required this.manageProductPage
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;
  final ManageProductPage manageProductPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: kIconBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!, color: kIconColor,),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }

  void navigateToNext(BuildContext context, ManageProductPage manageProductPage){
    switch(manageProductPage){
      case ManageProductPage.addProduct : {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
      break;
      case ManageProductPage.category : {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
      break;
    }
  }

}
