import 'package:Login/pages/admin/admin_landing_page.dart';
import 'package:Login/pages/admin_page.dart';
import 'package:flutter/material.dart';
import 'package:Login/api/user/admin_login.dart';
import 'package:Login/pages/auth/signup.dart';
import 'package:Login/pages/auth/admin_login.dart';

//Basically the Login Page Contains a form That is not the best form since main focus was on Logic

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
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
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(40),
                    ),
                    const Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                                const InputDecoration(labelText: 'Username'),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Username is required';
                              }
                            },
                            onChanged: (value) {
                              _username = value;
                            },
                          ),
                          TextFormField(
                            obscureText: true,
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
                                          const MaterialApp(
                                        home: Signup(),
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xfffd5800),
                                ),
                                child: const Text(
                                  'Register Admin',
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
                                  adminLogin('$_username', '$_password').then(
                                    ((value) {
                                      if (value) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const MaterialApp(
                                                home: Dashboard(),
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
