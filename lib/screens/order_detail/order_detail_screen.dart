import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order_detail/components/custom_app_bar.dart';
import '../../enums.dart';
import 'components/body.dart';

class OrderDetailScreen extends StatelessWidget {
  static String routeName = "/orderDetail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(),
      ),
      body: Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
