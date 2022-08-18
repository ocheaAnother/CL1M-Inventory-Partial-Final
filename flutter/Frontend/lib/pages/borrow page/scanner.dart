import 'package:Login/pages/borrower_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScanItem(),
    );
  }
}

class ScanItem extends StatefulWidget {
  const ScanItem({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScanItem> {
  String? _qrInfo = 'Scan a QR code';
  bool _camState = false;
  String date = "";
  DateTime selectedDate = DateTime.now();

  _qrCallback(String? code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Scanner'),
        backgroundColor: const Color(0xffffa500),
      ),
      body: _camState
          ? Center(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: QRBarScannerCamera(
                  onError: (context, error) => Text(
                    error.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    _qrCallback(code);
                  },
                ),
              ),
            )
          : AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              content: Text(_qrInfo!),
              actions: [
                Text(
                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: const Text("Choose Date"),
                ),
                //Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffa500),
                  ),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content:
                          const Text('You successfully borrowed the item!'),
                      action: SnackBarAction(
                        label: 'Okay',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BorrowerPage(),
                            ),
                          );
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text(
                    'ACCEPT',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
