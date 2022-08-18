import 'package:Login/pages/admin/admin_landing_page.dart';
import 'package:Login/pages/auth/admin_login.dart';
import 'package:Login/pages/borrower_page.dart';
import 'package:Login/pages/landing_page.dart';
import "package:flutter/material.dart";
import 'package:Login/functions/user/authenticate.dart';
import 'package:Login/pages/auth/signup.dart';
import 'package:Login/pages/home.dart';

//This is where the app Starts

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //First Thing we are checking is if the user is logged in Ie; Do we have a Jwt Stored
    IsUserLoggedIn().then((response) {
      if (response) {
        //If the user is logged in we will route him the Home Page.
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    const MaterialApp(home: Dashboard())),
            (route) => false);
      } else {
        //Else If the user is not logged in we will route him to the Log-in Page.
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const MaterialApp(
                home: HomePage(),
              ),
            ),
            (route) => false);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Strapi"),
      ),
      body: Container(),
    );
  }
}
