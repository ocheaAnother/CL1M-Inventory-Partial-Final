/* Dashboard sa admin */
import 'package:Login/pages/auth/admin_login.dart';
import 'package:Login/pages/borrow%20page/borrow.dart';
import 'package:Login/pages/borrow%20page/borrow_form.dart';
import 'package:Login/pages/borrowed_items.dart';
import 'package:Login/pages/landing_page.dart';
import 'package:Login/pages/return.dart';
import 'package:Login/storage/secureStorage.dart';
import 'package:flutter/material.dart';

//import 'dashboard.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AdminPage(),
  ));
}

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CL1M Inventory'),
      ),
      backgroundColor: Colors.deepOrangeAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, color: Colors.white, size: 60.0),
                  Image.asset("assets/inventory.png", width: 60.0)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Dashboard",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: InkWell(
                        onTap: () {
                          //BUTTON ACTION
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Return()));
                        },
                        child: Card(
                          color: const Color.fromARGB(225, 21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/about.png", width: 64.0),
                                  const SizedBox(height: 10.0),
                                  const Text("Items",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      )),
                                  // const SizedBox(height: 5.0),
                                  //  const Text(
                                  //    "Item/s",
                                  //    style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontWeight: FontWeight.w300,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: InkWell(
                        onTap: () {
                          //BUTTON ACTION
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Return()));
                        },
                        child: Card(
                          color: const Color.fromARGB(225, 21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/gear.png", width: 64.0),
                                  const SizedBox(height: 10.0),
                                  const Text("Borrowed Items",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      )),
                                  // const SizedBox(height: 5.0),
                                  //  const Text(
                                  //    "Item/s",
                                  //    style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontWeight: FontWeight.w300,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: stateManager.getBorrowedItems,
                      child: const Text('Borrowed Items'),
                    ),
                    ElevatedButton(
                      child: Text("LogOut"),
                      onPressed: () {
                        storageAuth store = storageAuth();
                        //Basically deleting the jwt and pushing the user to start page to revalidate
                        //PushAndRemoveUntil Removes all the pages from Navigator and pushes a page to it
                        store
                            .logOutUser()
                            .then((value) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const MaterialApp(
                                    home: HomePage(),
                                  ),
                                ),
                                (route) => false));
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
