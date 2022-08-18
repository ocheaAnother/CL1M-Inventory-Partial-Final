import 'package:Login/api/http_helper.dart';
import 'package:Login/pages/user/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';

class BorrowedList extends StatefulWidget {
  BorrowedList({Key? key}) : super(key: key);

  @override
  _BorrowedListState createState() => _BorrowedListState();
}

class _BorrowedListState extends State<BorrowedList> {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());

  get eq => null;

  // Future getBorrowedItems() //not working
  Future<void> getBorrowedItems() async {
    resultNotifier.value = RequestLoadInProgress();
    Response response = await http.get(
      Uri.parse(
          "http://10.10.10.58:1337/api/borrowed-items?filters[username][$eq]=191-00620"),
    );
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Borrowed Items: ${response.body}');
    _handleResponse(response);
  }

  void _handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      if (eq != 0) {
        getBorrowedItems();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getBorrowedItems(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text("Data null"),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    // title: Text(snapshot.data[index].propertyNum),
                    // subtitle: Text(snapshot.data[index].description),
                    ///////////////////////////////////////////////////////////////////
                    isThreeLine: true,
                    title: Text(snapshot.data[index].propertyNum),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data[index].description),
                        ]),

                    /////////////////////////////////////////////////////////////////////////////
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserDetails(snapshot.data[index])));
                    },
                  );
                });
          }
        });
  }
}
