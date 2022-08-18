import 'package:Login/api/http_helper.dart';
import 'package:Login/api/user/data_class.dart';
import 'package:Login/pages/admin/home_main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserDetails extends StatefulWidget {
  User user;
  UserDetails(this.user);
  @override
  _UserDetailsState createState() => _UserDetailsState(this.user);
}

class _UserDetailsState extends State<UserDetails> {
  User user;
  _UserDetailsState(this.user);
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());

  get id => null;

  // Future getUsers() //not working
  Future<void> getUsers() async {
    resultNotifier.value = RequestLoadInProgress();
    Response response = await http.get(
      Uri.parse('http://10.10.10.58:1337/api/items'),
    );
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Items: ${response.body}');
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
      if (id != 0) {
        getUsers();
      }
    }
  }

  void edit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home(0, user.id)));
  }

  Future<void> deleteUser() async {
    //DELETE
    resultNotifier.value = RequestLoadInProgress();
    Response response = await http.delete(
      Uri.parse('http://10.10.10.15:1337/api/userlists'), //edit filter
    );
    print('Status code: ${response.statusCode}');
    print('Deleted item: ${response.body}');
    _handleResponse(response);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text(user.name)),
          body: Container(
              child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Id: " + user.id.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Name: " + user.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Email: " + user.email,
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
                      onPressed: deleteUser,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text("Delete"),
                    ),
                  ],
                )
              ],
            ),
          ))),
    );
  }
}
