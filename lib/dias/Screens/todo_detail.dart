import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uts/dias/Models/dias.dart';
import 'package:uts/dias/Utils/database_helper.dart';
import 'package:intl/intl.dart';

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

    return WillPopScope(

	    onWillPop: (){ moveToLastScreen();
	    },

	    child: Scaffold(
	    body: Padding(
		    padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
		    child: ListView(
			    children: <Widget>[
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: gamesController,
						    style: textStyle,
						    onChanged: (value) {
						    	debugPrint('Something changed in games Text Field');
						    	updategames();
						    },
						    decoration: InputDecoration(
							    labelText: 'ID Games',
							    labelStyle: textStyle,
							    border: OutlineInputBorder(
								    borderRadius: BorderRadius.circular(5.0)
							    )
						    ),
					    ),
				    ),

				    // Third Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: server1Controller,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in server Text Field');
							    updateserver();
						    },
						    decoration: InputDecoration(
								    labelText: 'Server Game',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),

             Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: diasController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in server Text Field');
							    updatedias();
						    },
						    decoration: InputDecoration(
								    labelText: 'Jumlah Diamond',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),

				    // Fourth Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Row(
						    children: <Widget>[
						    	Expanded(
								    child: RaisedButton(
									    color: Colors.blue,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Simpan',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
									    	setState(() {
									    	  debugPrint("Save button clicked");
									    	  _save();
									    	});
									    },
								    ),
							    ),

							    Container(width: 5.0,),

							    Expanded(
								    child: RaisedButton(
									    color: Colors.red,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Delete',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
										    setState(() {
											    debugPrint("Delete button clicked");
											    _delete();
										    });
									    },
								    ),
							    ),

						    ],
					    ),
				    ),


			    ],
		    ),
	    ),

    ));
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

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Berhasil disimpan');
		} else {  // Failure
			_showAlertDialog('Status', 'Error');
		}

	}


	void _delete() async {

		moveToLastScreen();

		// Case 1: If user is trying to delete the NEW todo i.e. he has come to
		// the detail page by pressing the FAB of todoList page.
		if (todo.id == null) {
			_showAlertDialog('Status', 'Error');
			return;
		}

		// Case 2: User is trying to delete the old todo that already has a valid ID.
		int result = await helper.deleteTodo(todo.id);
		if (result != 0) {
			_showAlertDialog('Status', 'Berhasil Dihapus');
		} else {
			_showAlertDialog('Status', 'Error');
		}
	}

	void _showAlertDialog(String games, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(games),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}

}










