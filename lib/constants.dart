import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/size_config.dart';
// const kPrimaryColor = Color(0xFFFF7643);
// const kPrimaryLightColor = Color(0xFFFFECDF);
// const kPrimaryGradientColor = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
// );
// const kSecondaryColor = Color(0xFF979797);
// const kTextColor = Color(0xFF757575);
//const kCatetoryIconBackgroundColor = Color(0xFFFFECDF);
//const 0xFF7B1FA2 = Color(0xFFFF7643);
// const kIsFavoriteColor = Color(0xFFFF4848);
// const kIsNotFavoriteColor = Color(0xFFDBDEE4);

const kPrimaryColor = Color(0xFF7B1FA2);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFCE93D8), Color(0xFF7B1FA2)],
);
const kSecondaryColor = Color(0xFF979797);
const kIconBackgroundColor = Color(0xFFE1BEE7);
const kIconColor = Color(0xFF7B1FA2);
const kIsFavoriteColor = Color(0xFF7B1FA2);
const kIsNotFavoriteColor = Color(0xFFDBDEE4);



const Color KOrdersCardColor = Color(0xff8f0000);
const Color KMessagesCardColor = Color(0xFF7B1FA2);
const Color KProductsCardColor = Color(0xFFB30000);
const Color KCategoryCardColor = Color(0xF4433600);
const Color KSpecialCardColor = Color(0xD81B6000);
const Color KPopularCardColor = Color(0x76FF0300);
const Color KSpecialOffersCardColor = Color(0x90A4AE00);

///Text colors
const kTextColor = Color(0xFF757575);
const Color kTextHeadColor1 = Color(0xFF000000);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

//Firebase Error
const String kFirebaseUserLoginError = "The password is invalid or the user does not have a password.";
const String kFirebaseUserLoginUnknownError = "Unknown Login Error";
const String kFirebaseEmailAlreadyInUse = "Email already in use";

///admin add product input fields
const String kEmptyInput = "Input field cannot be empty";
const String kEmptyPrice = "Price cannot be empty";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
