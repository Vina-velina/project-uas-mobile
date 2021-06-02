import 'package:flutter/material.dart';
import 'package:uts/dias/Screens/cart.dart';

class TodoApp extends StatelessWidget {

	@override
  Widget build(BuildContext context) {

    return MaterialApp(
	    title: 'Keranjang',
	    debugShowCheckedModeBanner: false,
	    theme: ThemeData(
		    primarySwatch: Colors.blue
	    ),
	    home: TodoList(),
    );
  }
}