import 'package:flutter/widgets.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/add_product/add_product_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/cart/cart_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/details/details_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/home/home_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/login_success/login_success_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/manage_product/manage_product_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order/order_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order_detail/components/order_detail.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/order_detail/order_detail_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/otp/otp_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/profile/profile_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),  //SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),  // SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  DashboardScreen.routeName: (context) => DashboardScreen(),
  ManageProductScreen.routeName: (context) => ManageProductScreen(),
  AddProductScreen.routeName: (context) => AddProductScreen(),
  OrderScreen.routeName: (context) => OrderScreen(),
  OrderDetailScreen.routeName: (context) => OrderDetailScreen()
};
