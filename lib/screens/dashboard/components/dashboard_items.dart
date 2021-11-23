import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/models/Product.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'dashboard_card_banner.dart';
import 'section_title.dart';

class DashboardItems extends StatefulWidget {

  @override
  State<DashboardItems> createState() => _DashboardItemsState();
}

class _DashboardItemsState extends State<DashboardItems> {
  List productList = [];

  void getProductList(List list, int chunkSize) {
    int len = list.length;
    for (var i = 0; i < len; i += chunkSize) {
      int size = i+chunkSize;
      productList.add(list.sublist(i, size > len ? len : size));
    }
  }

  int count = 0;

  int messages = 0;

  @override
  Widget build(BuildContext context) {


    String orderText = "New Orders    ${count + 1}";
    String msgText = "New Messages    ${messages + 1}";

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
              GestureDetector(child: DashboardCardBanner(title: 'Orders \n',
                subTitle: orderText,
                backgroundColor: KOrdersCardColor,), onTap: () {
                setState(() {
                  count = count + 1;
                });
              },),
              SizedBox(width: getProportionateScreenWidth(8)),
              GestureDetector(child: DashboardCardBanner(title: 'Messages \n',
                subTitle: msgText,
                backgroundColor: KMessagesCardColor,), onTap: () {},),
              SizedBox(width: getProportionateScreenWidth(8)),
              GestureDetector(child: const DashboardCardBanner(
                title: 'Popular products \n',
                subTitle: 'Manage Popular Products',
                backgroundColor: KPopularCardColor,), onTap: () {},),
              SizedBox(width: getProportionateScreenWidth(8)),
              GestureDetector(child: const DashboardCardBanner(
                title: 'Special Offers \n',
                subTitle: 'Manage Special Offers',
                backgroundColor: KSpecialOffersCardColor,), onTap: () {},),
              SizedBox(width: getProportionateScreenWidth(8,)),
              GestureDetector(child: const DashboardCardBanner(
                title: 'My product Categories \n',
                subTitle: 'Manage Categories',
                backgroundColor: KCategoryCardColor,), onTap: () {},),
              SizedBox(width: getProportionateScreenWidth(8)),
              GestureDetector(child: const DashboardCardBanner(
                title: 'My Product \n',
                subTitle: 'Manage Products',
                backgroundColor: KProductsCardColor,), onTap: () {

              },),
              SizedBox(width: getProportionateScreenWidth(8,)),
            ],
          ),
        )
      ],
    );
  }
}