import 'package:Login/api/user/register.dart';
import 'package:Login/pages/admin_page.dart';
import 'package:Login/pages/auth/admin_login.dart';
import 'package:flutter/material.dart';

//Basically the Login Page Contains a form That is not the best form since main focus was on Logic
//Yes I copied the above comment from Login 😊

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //This is to store FormState don't know anything about it but its important🙂
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //These Variables Store Form Data
  String? _username, _email, _password, _confirmPassword, _usertype;
// Initial Selected Value
  String dropdownvalue = 'Choose User Type';

// List of items in our dropdown menu
  var items = [
    'Choose User Type',
    'Admin',
    'Student',
    'Personnel',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          //for the page to be scrolled
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(30),
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(),
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Email is required';
                            }
                          },
                          onChanged: (value) {
                            _email = value;
                          },
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 20),
                          decoration:
                              const InputDecoration(labelText: "Username"),
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
                          style: const TextStyle(fontSize: 20),
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
                        TextFormField(
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                              labelText: "Confirm Password"),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Confirm Password is required';
                            }
                            if (value != _password) {
                              return 'Password not same';
                            }
                          },
                          onChanged: (value) {
                            _confirmPassword = value;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButton(
                              // Initial Value
                              value: dropdownvalue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? _usertype) {
                                setState(() {
                                  dropdownvalue = _usertype!;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
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
                                      home: AdminLoginPage(),
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xffffdead),
                              ),
                              child: const Text(
                                'Login page',
                                style: TextStyle(
                                    color: Colors.black,
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
                                print(_username);
                                RegisterUser('${_username}', '${_email}',
                                        '${_password}', '${_usertype}')
                                    .then(
                                  ((value) {
                                    if (value) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const MaterialApp(
                                              home: AdminPage(),
                                            ),
                                          ),
                                          (route) => false);
                                    }
                                  }),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xffffdead),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.black,
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
    );
  }
}
