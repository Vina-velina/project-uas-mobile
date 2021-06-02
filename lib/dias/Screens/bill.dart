import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uts/dias/Models/billmodel.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:uts/main.dart';

class CheckBoxListTileDemo extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {

  // CheckBoxListTileDemoState(
  //   {@required this._harga});
  
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text(
          'METODE PEMBAYARAN',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: new ListView.builder(
        
          itemCount: checkBoxListTileModel.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    new CheckboxListTile(
                        activeColor: Colors.pink[300],
                        dense: true,
                        //font change
                        title: new Text(
                          checkBoxListTileModel[index].title,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                        value: checkBoxListTileModel[index].isCheck,
                        secondary: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            checkBoxListTileModel[index].img,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onChanged: (bool val) {
                          itemChange(val, index);
                        })
                        
                  ],
                ),
              ),
              
            );
          }
          
          ),
        ),
        
    SizedBox(height: 40,),
    FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: () {
              showDialog(
              context: context,
              builder: (BuildContext context) {
               return RichAlertDialog(
                alertTitle: richTitle("SUKSES"),
                alertSubtitle: richSubtitle("Pembayaran Anda Berhasil"),
                alertType: RichAlertType.SUCCESS,
                actions: <Widget>[
                FlatButton(
                color: Colors.blue,
                child: Text("OK"),
                onPressed: (){ Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyApp()),
                          );},
                  ),
                  ],
                  );
                  });
            },
      child: Text(
        "Bayar",
        style: TextStyle(fontSize: 20.0),
      ),
    )
          ],)
              
        );
      }

      void itemChange(bool val, int index) {
        setState(() {
          checkBoxListTileModel[index].isCheck = val;
        });
      }
    }