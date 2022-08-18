import 'package:Login/pages/admin/add_item.dart';
import 'package:Login/pages/admin/item_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home(0, 0));
}

class Home extends StatefulWidget {
  int state;
  int id;
  Home(this.state, this.id, {Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState(state, id);
}

class _HomeState extends State<Home> {
  int state;
  int id;
  int _currentIndex = 1;
  Widget? _body;
  String? _title;
  _HomeState(this.state, this.id);
  @override
  void initState() {
    super.initState();
    changeView(state);
  }

  void _onTap(index) {
    changeView(index);
  }

  void changeView(index) {
    _currentIndex = index;
    setState(() {
      switch (index) {
        case 0:
          {
            _title = "Add Item";
            _body = MyForm(id);
            break;
          }
        case 1:
          {
            _title = "Items";
            _body = MyList();
            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(_title!),
        backgroundColor: const Color(0xfffd5800),
      ),
      body: _body,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.table_chart), label: 'View'),
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    ));
  }
}
