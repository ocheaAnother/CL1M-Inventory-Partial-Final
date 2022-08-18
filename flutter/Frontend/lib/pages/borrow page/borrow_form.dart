import 'package:Login/api/user/data_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../api/http_helper.dart';

class BorrowForm extends StatefulWidget {
  const BorrowForm({Key? key}) : super(key: key);

  @override
  State<BorrowForm> createState() => _BorrowFormState();
}

TextEditingController propertyNumController =
    TextEditingController(text: borrow.propertyNum);
TextEditingController usernameController =
    TextEditingController(text: borrow.username);
TextEditingController descriptionController =
    TextEditingController(text: borrow.description);
TextEditingController dateController =
    TextEditingController(text: borrow.dateReturn);
TextEditingController dateReturnController =
    TextEditingController(text: borrow.dateReturn);

Borrow borrow = Borrow(
    username: '', propertyNum: '', description: '', date: '', dateReturn: '');

//  UserData user = new UserData(
//         username: usernameController.text,
//         );

final stateManager = HomePageManager();

Widget buildUsername() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Username',
        style: TextStyle(
            color: Color.fromARGB(225, 21, 21, 21),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        child: TextField(
          controller: usernameController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: -5, left: 10),
          ),
        ),
      ),
    ],
  );
}

Widget buildPropertyNo() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Property No.',
        style: TextStyle(
            color: Color.fromARGB(225, 21, 21, 21),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        child: TextField(
          controller: propertyNumController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: -5, left: 10),
          ),
        ),
      ),
    ],
  );
}

//password function
Widget buildDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Description',
        style: TextStyle(
            color: Color.fromARGB(225, 21, 21, 21),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        child: TextField(
          controller: descriptionController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: -5, left: 10),
          ),
        ),
      ),
    ],
  );
}

Widget buildDate() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Date',
        style: TextStyle(
            color: Color.fromARGB(225, 21, 21, 21),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        child: TextField(
          controller: dateController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: -5, left: 10),
          ),
        ),
      ),
    ],
  );
}

Widget buildReturnDate() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Return Date',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        child: TextField(
          controller: dateReturnController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: -5, left: 10),
          ),
        ),
      ),
    ],
  );
}

Widget buildBtn() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        stateManager.addBorrowedItem(
            usernameController.text,
            propertyNumController.text,
            descriptionController.text,
            dateController.text,
            dateReturnController.text);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffe9692c),
      ),
      child: const Text(
        'BORROW',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

void main() {
  runApp(const BorrowForm());
}

class _BorrowFormState extends State<BorrowForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(225, 21, 21, 21),
      ),
      backgroundColor: const Color(0xffffdead),
      //body
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                margin: EdgeInsets.only(left: 15, right: 15),
                child: SingleChildScrollView(
                  //for the page to be scrolled
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Borrow Form',
                        style: TextStyle(
                            color: Color.fromARGB(225, 21, 21, 21),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      buildUsername(),
                      buildPropertyNo(),
                      const SizedBox(height: 10),
                      buildDescription(),
                      const SizedBox(height: 10),
                      buildDate(),
                      const SizedBox(height: 10),
                      buildReturnDate(),
                      const SizedBox(height: 10),
                      buildBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
