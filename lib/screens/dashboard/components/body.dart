import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/dashboard/components/dashboard_items.dart';
import '../../../size_config.dart';
import 'all_product.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DashboardItems(),
            //Categories(),
            //SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
            AllProducts(),
          ],
        ),
      ),
    );
  }
}
