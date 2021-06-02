import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uts/dias/Models/dias.dart';
import 'package:uts/dias/Utils/database_helper.dart';
import 'package:intl/intl.dart';
import 'package:uts/main.dart';
import 'package:uts/dias/Animation/FadeAnimation.dart';
import 'package:uts/dias/Screens/bill.dart';


class TodoDetail extends StatefulWidget {

	final String appBarTitle;
	final Todo todo;

	TodoDetail(this.todo, this.appBarTitle);

	@override
  State<StatefulWidget> createState() {

    return TodoDetailState(this.todo, this.appBarTitle);
  }
}

class TodoDetailState extends State<TodoDetail> {

  

  int harga = 0;

	DatabaseHelper helper = DatabaseHelper();

	String appBarTitle;
	Todo todo;

	TextEditingController gamesController = TextEditingController();
	TextEditingController server1Controller = TextEditingController();
  TextEditingController diasController = TextEditingController();

	TodoDetailState(this.todo, this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;
		gamesController.text = todo.games;
		server1Controller.text = todo.server1;
    diasController.text = todo.dias;


    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400]
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("DIAMONDS!", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        FadeAnimation(1.4, Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(

                                  controller: gamesController,
                                  style: textStyle,
                                  onChanged: (value) {
                                    updategames();
                                  },
                                   keyboardType: TextInputType.number,
                                   maxLength: 6,
                                  decoration: InputDecoration(
                                    hintText: "ID Games",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                controller: server1Controller,
                                style: textStyle,
                                onChanged: (value) {
                                  updateserver();
                                },
                                   keyboardType: TextInputType.number,
                                   maxLength: 4,                                
                                  decoration: InputDecoration(
                                    hintText: "Server Games",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),

                                Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                controller: diasController,
                                style: textStyle,
                                onChanged: (txt) {
                                  updatedias();
                                },
                                  keyboardType: TextInputType.number,
                                   maxLength: 6,                               
                                  decoration: InputDecoration(
                                    hintText: "Jumlah diamond min.3",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                        )),

                        SizedBox(height: 40,),
                        FadeAnimation(1.6,
                        
                         Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child : new RaisedButton(
                          onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckBoxListTileDemo()),
                          );

                                    // showDialog(
                                    // context: context,
                                    // builder: (BuildContext context) {
                                    //   return RichAlertDialog(
                                    //     alertTitle: richTitle("SUKSES"),
                                    //     alertSubtitle: richSubtitle("Pembayaran Anda Berhasil"),
                                    //     alertType: RichAlertType.SUCCESS,
                                    //     actions: <Widget>[
                                    //       FlatButton(
                                    //         child: Text("OK"),
                                    //         onPressed: (){Navigator.pop(context);},
                                    //       ),
                                    //     ],
                                    //   );
                                    // });
                        },
                          
                             shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)
                            ),
                            elevation: 0.0,
                              padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.orangeAccent,Colors.orange]
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                
                                constraints: BoxConstraints(minWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text("Bayar",
                                style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w700),
                                ),
                              ),
                            )
                          ),)
                        ),



                        SizedBox(height: 50,),
                        FadeAnimation(1.7, Text("Pilihan Lainnya", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeAnimation(1.8,
                          Container(
                          height: 50,
                          child : new RaisedButton(onPressed:  () {
                            setState(() {
                              debugPrint("Save button clicked");
                              _save();
                            });
                          },
                             shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)
                            ),
                              padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.blueAccent,Colors.blue]
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                
                                constraints: BoxConstraints(minWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text("Keranjang",
                                style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w700),
                                ),
                              ),
                            )
                          ),)
                              ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: FadeAnimation(1.9, 
                          Container(
                          height: 50,
                          child : new RaisedButton(onPressed:  () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyApp()),
                                      );
                          },
                             shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)
                            ),
                              padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.black,Colors.black]
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                
                                constraints: BoxConstraints(minWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text("Batal",
                                style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w700),
                                ),
                              ),
                            )
                          ),)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );


    
  }

  
  void moveToLastScreen() {
		Navigator.pop(context, true);
  }

  void updategames(){
    todo.games = gamesController.text;
  }

	// Update the server of todo object
	void updateserver() {
		todo.server1 = server1Controller.text;
	}

  void updatedias() {
		todo.dias = diasController.text;
	}

	// Save data to database
	void _save() async {

		moveToLastScreen();

		todo.date = DateFormat.yMMMd().format(DateTime.now());
		int result;
		if (todo.id != null) {  // Case 1: Update operation
			result = await helper.updateTodo(todo);
		} else { // Case 2: Insert Operation
			result = await helper.insertTodo(todo);
		}

	}


	void _delete() async {

		moveToLastScreen();

		// Case 1: If user is trying to delete the NEW todo i.e. he has come to
		// the detail page by pressing the FAB of todoList page.
		if (todo.id == null) {
			return;
		}

		// Case 2: User is trying to delete the old todo that already has a valid ID.
		int result = await helper.deleteTodo(todo.id);
	}
}