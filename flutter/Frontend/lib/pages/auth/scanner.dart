import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class ScanId extends StatefulWidget {
  @override
  _ScanIdState createState() => _ScanIdState();
}

class _ScanIdState extends State<ScanId> {
  String? _qrInfo = 'Scan a QR Code';
  bool camState = false;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (camState == true) {
            setState(() {
              camState = false;
            });
          } else {
            setState(() {
              camState = true;
            });
          }
        },
        child: Icon(Icons.camera_alt),
      ),
      body: camState
          ? Center(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: QRBarScannerCamera(
                  onError: (context, error) => Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    qrCallback(code);
                  },
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _qrInfo!,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
