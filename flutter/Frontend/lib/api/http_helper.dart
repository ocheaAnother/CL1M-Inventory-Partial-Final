import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

/* Ang mga link kay mag depende sa ip address, so basin kani nga mga link dili mo work sa inyo */
/* Mo work lang sad pud ang link kung naka npm run develop ang strapi */

// Kung kailangan mo mag testing2 sa database pag create nalang lahi nga strapi app sulod sa folder aning flutter app.
// Tapos input data and all...
// ipconfig dayon tas copy paste ang ip address, maoy ichange sa mga link para mo work.

class HomePageManager {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());

/* Get student borrowers */
  Future<void> getStudentBorrowers() async {
    resultNotifier.value = RequestLoadInProgress();
    Response response = await http.get(
      Uri.parse('http://10.10.10.58:1337/api/student-borrowers'),
    );
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Student borrowers: ${response.body}');
    _handleResponse(response);
  }

/* Get personnel borrowers */
  Future<void> getPersonnelBorrowers() async {
    resultNotifier.value = RequestLoadInProgress();
    Response response = await http.get(
      Uri.parse('http://10.10.10.58:1337/api/personnel-borrowers'),
    );
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Personnel borrowers: ${response.body}');
    _handleResponse(response);
  }

/* Get items */
  Future<void> getItems() async {
    resultNotifier.value = RequestLoadInProgress();
    Response response = await http.get(
      Uri.parse('http://10.10.10.58:1337/api/items'),
    );
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Items: ${response.body}');
    _handleResponse(response);
  }

/* Get borrowed items */
  Future<void> getBorrowedItems() async {
    resultNotifier.value = RequestLoadInProgress();
    Response response = await http.get(
      Uri.parse('http://10.10.10.58:1337/api/borrowed-items'),
    );
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Items: ${response.body}');
    _handleResponse(response);
  }

/* Delete item */
  Future<void> deleteItem() async {
    resultNotifier.value = RequestLoadInProgress();
    Response response = await http.delete(
      Uri.parse('http://10.10.10.58:1337/api/items/'), //edit filter
    );
    print('Status code: ${response.statusCode}');
    print('Deleted item: ${response.body}');
    _handleResponse(response);
  }

/* Update item */
  Future updateItem(propertyNum, description, acquisitionDate, estimatedLife,
      officeDesignation, serialNum) async {
    resultNotifier.value = RequestLoadInProgress();
    const updateEndpoint = 'http://10.10.10.58:1337/api/items/'; //editonon pa
    var url = Uri.parse(updateEndpoint);

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var data = jsonEncode({
      'data': {
        'property_no': propertyNum,
        'description': description,
        'acquisition_date': acquisitionDate,
        'estimated_life': estimatedLife,
        'office_designation': officeDesignation,
        'brand_serial_no': serialNum,
      }
    });
    var response = await http.put(
      url,
      headers: headers,
      body: data,
    );
    print('Status code: ${response.statusCode}');
    print('Updated item: ${response.body}');
    _handleResponse(response);
  }

/* Add item to borrowed-items */
  Future addBorrowedItem(
      username, propertyNum, description, date, dateReturn) async {
    resultNotifier.value = RequestLoadInProgress();
    const endpoint = 'http://10.10.10.58:1337/api/borrowed-items';
    var url = Uri.parse(endpoint);

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var data = jsonEncode({
      'data': {
        'username': username,
        'property_no': propertyNum,
        'description': description,
        'date': date,
        'date_return': dateReturn,
      }
    });
    var response = await http.post(
      url,
      headers: headers,
      body: data,
    );
    print('Status code: ${response.statusCode}');
    print('Admin users: ${response.body}');
    _handleResponse(response);
  }

  void _handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
    }
  }
}

class RequestState {
  const RequestState();
}

class RequestInitial extends RequestState {}

class RequestLoadInProgress extends RequestState {}

class RequestLoadSuccess extends RequestState {
  const RequestLoadSuccess(this.body);
  final String body;
}

class RequestLoadFailure extends RequestState {}


// class MyList extends StatelessWidget {
//   late final Future<List<User>> users = getAll();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: users,
//         // ...
//       ),
//     );
//   }
// }
