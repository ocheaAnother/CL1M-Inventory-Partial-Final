import 'package:Login/api/http_helper.dart';
import 'package:Login/api/user/data_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'home_main.dart';
import 'package:http/http.dart' as http;

class MyDetail extends StatefulWidget {
  Item item;
  MyDetail(this.item);
  @override
  _MyDetailState createState() => _MyDetailState(this.item);
}

class _MyDetailState extends State<MyDetail> {
  Item item;
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
  Future<void> deleteItem() async {
    //DELETE
    resultNotifier.value = RequestLoadInProgress();
    Response response = await http.delete(
      Uri.parse('http://10.10.10.58:1337/api/items/1'), //edit filter
    );
    print('Status code: ${response.statusCode}');
    print('Deleted item: ${response.body}');
    _handleResponse(response);
  }

  void _handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
    }
  }

  _MyDetailState(this.item);
  void edit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home(0, item.id)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text(item.propertyNum)),
          body: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Id: " + item.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Property Number: " + item.propertyNum,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Description: " + item.description,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Acquisition Date:" + item.acquisitionDate,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Estimated Life: " + item.estimatedLife,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Office Designation:" + item.officeDesignation,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Serial Number:" + item.serialNum,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: edit,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text("Edit"),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: deleteItem,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text("Delete"),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
