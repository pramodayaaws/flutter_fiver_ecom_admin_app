import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/models/UserModel.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/sign_in/sign_in_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var user = FirebaseAuth.instance.currentUser;

  //serModel loggedInUser = UserModel();

  // @override
  // void initState(){
  //   super.initState();
  //   FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value) => {
  //     loggedInUser = UserModel.fromMap(value.data()),
  //   });
  //
  // }

  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, SignInScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "loggedInUser.firstName!",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }
}
