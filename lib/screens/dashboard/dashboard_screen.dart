import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
