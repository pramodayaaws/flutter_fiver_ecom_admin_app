import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/components/custom_surfix_icon.dart';
import 'package:flutter_fiver_ecom_admin_app/components/default_button.dart';
import 'package:flutter_fiver_ecom_admin_app/components/form_error.dart';
import 'package:flutter_fiver_ecom_admin_app/models/UserModel.dart';
import 'package:flutter_fiver_ecom_admin_app/providers/user_provider.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/login_success/login_success_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/otp/otp_screen.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/sign_in/sign_in_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/src/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {


  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addrController = TextEditingController();

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void signUp(String email, String password) async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>{
      postDetailsToFirestore(),
    }).catchError((e){
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  postDetailsToFirestore() async{
    //calling our firestore
    //calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;
    userModel.phoneNumber = phoneController.text;
    userModel.address = addrController.text;

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Account created successfully, Let\'s login');
    Navigator.pushNamed(context, SignInScreen.routeName);
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                context.read<UserProvider>().setUser(firstNameController.text, lastNameController.text, phoneController.text, addrController.text);

                var email = context.read<UserProvider>().getEmail();
                var password = context.read<UserProvider>().getPassword();
                signUp(email, password);
                // Navigator.pushNamed(context, SignInScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    dispose(){
      firstNameController.dispose();
    }
    return TextFormField(
      controller: addrController,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    dispose(){
      phoneController.dispose();
    }
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    dispose(){
      lastNameController.dispose();
    }
    return TextFormField(
      controller: lastNameController,
      onSaved: (newValue) => lastName = newValue,
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    @override
    dispose(){
      firstNameController.dispose();
    }
    return TextFormField(
      controller: firstNameController,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  void _submit(){

  }



}
