import 'package:Login/api/user/borrower_login.dart';
import 'package:Login/pages/auth/scanner.dart';
import 'package:Login/pages/borrower_page.dart';
import 'package:flutter/material.dart';
import 'package:Login/api/user/admin_login.dart';
import 'package:Login/main.dart';
import 'package:Login/pages/auth/signup.dart';
import 'package:Login/pages/auth/admin_login.dart';

//Basically the Login Page Contains a form That is not the best form since main focus was on Logic

class BorrowerLoginPage extends StatefulWidget {
  BorrowerLoginPage({Key? key}) : super(key: key);

  @override
  State<BorrowerLoginPage> createState() => _BorrowerLoginPageState();
}

class _BorrowerLoginPageState extends State<BorrowerLoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? _username, _password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("CL1M INVENTORY"),
          backgroundColor: const Color(0xfffd5800),
        ),
        body: Container(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: const AssetImage("assets/ccis.png"),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.10), BlendMode.dstIn),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(40),
                    ),
                    const Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            decoration:
                                const InputDecoration(labelText: 'ID Number'),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'ID Number is required';
                              }
                            },
                            onChanged: (value) {
                              _username = value;
                            },
                          ),
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            decoration:
                                const InputDecoration(labelText: "Password"),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Password is required';
                              }
                            },
                            onChanged: (value) {
                              _password = value;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MaterialApp(
                                        home: ScanId(),
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xfffd5800),
                                ),
                                child: const Text(
                                  'Scan',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (!_formkey.currentState!.validate()) {
                                    return;
                                  }
                                  (_username);
                                  borrowerLogin('$_username', '$_password')
                                      .then(
                                    ((value) {
                                      if (value) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const MaterialApp(
                                                home: BorrowerPage(),
                                              ),
                                            ),
                                            (route) => false);
                                      }
                                    }),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xfffd5800),
                                ),
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
