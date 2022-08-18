import 'package:Login/pages/admin/home_main.dart';
import 'package:Login/pages/landing_page.dart';
import 'package:Login/pages/user/userlist.dart';
import 'package:Login/storage/secureStorage.dart';
import 'package:flutter/material.dart';
//import 'dashboard.dart';

void main() {
  runApp(const MaterialApp(
    home: Dashboard(),
  ));
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xffe9692c),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        onPressed: () {
          storageAuth store = storageAuth();
          //Basically deleting the jwt and pushing the user to start page to revalidate
          //PushAndRemoveUntil Removes all the pages from Navigator and pushes a page to it
          store.logOutUser().then((value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const MaterialApp(
                  home: HomePage(),
                ),
              ),
              (route) => false));
        },
        label: const Text('Log out'),
        icon: const Icon(Icons.logout),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("CL1M INVENTORY"),
        backgroundColor: const Color.fromARGB(225, 21, 21, 21),
      ),
      backgroundColor: const Color(0xffffdead),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.location_history,
                      color: Colors.white, size: 60.0),
                  Image.asset("assets/admin-top.png", width: 60.0)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Welcome Admin",
                style: TextStyle(
                    color: Color.fromARGB(225, 21, 21, 21),
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
                    //users
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: InkWell(
                        onTap: () {
                          //BUTTON ACTION
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(1, 0)));
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
                                  Image.asset("assets/items.png", width: 64.0),
                                  const SizedBox(height: 10.0),
                                  const Text("Inventory",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      )),
                                  const SizedBox(height: 5.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // HOME
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: InkWell(
                        onTap: () {
                          //BUTTON ACTION
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BorrowedItems()));
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
                                  Image.asset("assets/admin.png", width: 64.0),
                                  const SizedBox(height: 10.0),
                                  const Text('Borrowed Items',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      )),
                                  const SizedBox(height: 5.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
