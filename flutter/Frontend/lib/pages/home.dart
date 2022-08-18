import 'package:flutter/material.dart';
import 'package:Login/main.dart';
import 'package:Login/storage/secureStorage.dart';

//This Page is for when a person is logged in

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Container(
          child: ElevatedButton(
            child: Text("LogOut"),
            onPressed: () {
              storageAuth store = storageAuth();
              //Basically deleting the jwt and pushing the user to start page to revalidate
              //PushAndRemoveUntil Removes all the pages from Navigator and pushes a page to it
              store.logOutUser().then((value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MaterialApp(home: MyApp())),
                  (route) => false));
            },
          ),
        ),
      ),
    );
  }
}
