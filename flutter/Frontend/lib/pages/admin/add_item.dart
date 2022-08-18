import 'dart:convert';

import 'package:Login/api/http_helper.dart';
import 'package:Login/api/user/data_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HomePageManager {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());

  Future addItem(
      propertyNum,
      description,
      acquisitionDate,
      estimatedLife, //ADD ITEM
      officeDesignation,
      serialNum) async {
    resultNotifier.value = RequestLoadInProgress();
    const endpoint = 'http://10.10.10.15:1337/api/items';
    var url = Uri.parse(endpoint);

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var data = jsonEncode({
      'data': {
        'propertyNum': propertyNum,
        'description': description,
        'acquisitionDate': acquisitionDate,
        'estimatedLife': estimatedLife,
        'officeDesignation': officeDesignation,
        'serialNum': serialNum,
      }
    });
    var response = await http.post(
      url,
      headers: headers,
      body: data,
    );

    print('Status code: ${response.statusCode}');
    print('Item List: ${response.body}');
    _handleResponse(response);

    //  Navigator.push(context, new MaterialPageRoute(builder: (context)=>Home(1,0)));
  }

  void _handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
    }
  }
}

class MyForm extends StatefulWidget {
  int id;
  MyForm(this.id);
  @override
  _MyFormState createState() => _MyFormState();
}

TextEditingController propertyNumberController =
    TextEditingController(text: item.propertyNum);
TextEditingController descriptionController =
    TextEditingController(text: item.description);
TextEditingController acquisitionDateController =
    TextEditingController(text: item.acquisitionDate);
TextEditingController estimatedLifeController =
    TextEditingController(text: item.estimatedLife);
TextEditingController officeDesignationController =
    TextEditingController(text: item.officeDesignation);
TextEditingController serialNumController =
    TextEditingController(text: item.serialNum);

Item item = Item(
    propertyNum: '',
    description: '',
    acquisitionDate: '',
    estimatedLife: '',
    officeDesignation: '',
    serialNum: '');

class _MyFormState extends State<MyForm> {
  final stateManager = HomePageManager();
  final TextEditingController _textController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              children: [
                Visibility(
                  visible: false,
                  child: TextField(
                      controller:
                          TextEditingController(text: item.id.toString())),
                ),
                //
                TextFormField(
                  controller: TextEditingController(text: item.propertyNum),
                  onChanged: (val) {
                    item.propertyNum = val;
                  },
                  decoration: const InputDecoration(
                      labelText: "Property Number",
                      icon: Icon(Icons.error_outline)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                //
                TextFormField(
                  controller: TextEditingController(text: item.description),
                  onChanged: (val) {
                    item.description = val;
                  },
                  decoration: const InputDecoration(
                      labelText: "Description",
                      icon: Icon(Icons.error_outline)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                //
                TextFormField(
                  controller: TextEditingController(text: item.acquisitionDate),
                  onChanged: (val) {
                    item.acquisitionDate = val;
                  },
                  decoration: const InputDecoration(
                      labelText: "Acquisition Date",
                      icon: Icon(Icons.error_outline)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                //
                TextFormField(
                  controller: TextEditingController(text: item.estimatedLife),
                  onChanged: (val) {
                    item.estimatedLife = val;
                  },
                  decoration: const InputDecoration(
                      labelText: "Estimated Life",
                      icon: Icon(Icons.error_outline)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                //
                TextFormField(
                  controller:
                      TextEditingController(text: item.officeDesignation),
                  onChanged: (val) {
                    item.officeDesignation = val;
                  },
                  decoration: const InputDecoration(
                      labelText: "Office Designation",
                      icon: Icon(Icons.error_outline)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                //
                TextFormField(
                  controller: TextEditingController(text: item.serialNum),
                  onSaved: (value) {
                    item.serialNum = value!;
                  },
                  decoration: const InputDecoration(
                      labelText: "Brand Serial Number",
                      icon: Icon(Icons.error_outline)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                //
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // _controller.clear();
                      if (_formKey.currentState!.validate()) {
                        stateManager.addItem(
                            propertyNumberController.text,
                            descriptionController.text,
                            acquisitionDateController.text,
                            estimatedLifeController.text,
                            officeDesignationController.text,
                            serialNumController.text);
                        setState(() {
                          _textController.clear(); //clearfield tarongonon pa
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Item Added Successfully')),
                        );
                      }
                    },

                    // style: ElevatedButton.styleFrom(
                    //   primary: const Color(0xfffd5800),
                    // ),
                    child: const Text("Add Item"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
