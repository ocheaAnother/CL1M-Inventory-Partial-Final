import 'dart:convert';

import 'package:Login/api/borrowed_items.dart';
import 'package:Login/pages/borrow%20page/borrow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<Borrow> getBorrowedItems() async {
  // resultNotifier.value = RequestLoadInProgress();
  Response response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );
  if (response.statusCode == 200) {
    return Borrow.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
  // print('Status code: ${response.statusCode}');
  // print('Headers: ${response.headers}');
  // print('Items: ${response.body}');
  // _handleResponse(response);
}

class Borrow {
  final String username;
  final String propertyNum;
  final String description;
  final String date;
  final String dateReturn;

  const Borrow(
      {required this.username,
      required this.propertyNum,
      required this.description,
      required this.date,
      required this.dateReturn});

  factory Borrow.fromJson(Map<String, dynamic> json) {
    return Borrow(
      username: json['username'],
      propertyNum: json['property_no'],
      description: json['description'],
      date: json['date'],
      dateReturn: json['date_return'],
    );
  }
}

void main() => runApp(BorrowedItemsPage());

class BorrowedItemsPage extends StatefulWidget {
  @override
  State<BorrowedItemsPage> createState() => _BorrowedItemsPageState();
}

class _BorrowedItemsPageState extends State<BorrowedItemsPage> {
  late Future<Borrow> futureBorrow;

  @override
  void initState() {
    super.initState();
    futureBorrow = getBorrowedItems();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Borrow>(
            future: futureBorrow,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.propertyNum);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
