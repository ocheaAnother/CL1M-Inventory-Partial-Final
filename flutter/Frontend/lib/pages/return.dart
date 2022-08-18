import 'package:Login/pages/borrower_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opacity app',
      home: Return(),
    );
  }
}

class Return extends StatefulWidget {
  const Return({Key? key}) : super(key: key);

  @override
  State<Return> createState() => _ReturnState();
}

class _ReturnState extends State<Return> {
  List<String> data = [
    'borrowed item 2',
    'borrowed item 3',
    'borrowed item 4',
    'borrowed item 5',
    'borrowed item 6',
    'borrowed item 7',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffe9692c),
        title: Text('List of borrowed items'),
        //arrowback icon to return to the dashboard
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const BorrowerPage()));
        //     }),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return Card(
            color: const Color(0xffe9692c),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                title: Text(data[index]),
                trailing: Container(
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => SimpleDialog(
                                  children: [
                                    Center(
                                      child: Text('Return Item?'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 5, 15, 0),
                                      child: SizedBox(
                                        height: 25,
                                        width: 10,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              data.removeAt(index);
                                            });
                                            Navigator.pop(context);
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xffe9692c))),
                                          child: Text('return'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.assignment_returned_rounded)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
