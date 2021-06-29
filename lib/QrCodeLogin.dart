import 'dart:async';
import 'dart:convert';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uts/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/rendering.dart';
import 'package:uts/views/home/home.dart';
import 'package:http/http.dart' as http;

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

enum LoginStatus{
  notSignIn,
  signIn
}
class _ScanState extends State<ScanScreen> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String _scanBarcode = 'Unknown';

  checkLogin(String urlresult) async {
    print(urlresult);
    final response = await http
        .get(Uri.parse(urlresult));
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String emailAPI = data['email'];
    String namaAPI = data['nama'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        saved(value, emailAPI, namaAPI);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }
  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", 0);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }
  saved(int value, String email, String nama) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("email", email);
      preferences.commit();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
            appBar: AppBar(
              title: Text('LOGIN WITH QR CODE SCANNER'),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
              backgroundColor: Colors.blueAccent,
            ),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            onPressed: () => scanQR(),
                            child: Text("START SCAN QR")),
                        if (_scanBarcode != "Unknown" && _scanBarcode != "-1")
                          RaisedButton(
                              onPressed: () => checkLogin(_scanBarcode),
                              child: Text("Account Found, Login Now",
                                  style: TextStyle(fontSize: 20))),
                      ]));
            }));
        break;

      case LoginStatus.signIn:
        return Home(logout);
        break;
    }
  }
}
