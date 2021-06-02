import 'package:flutter/material.dart';
import 'package:uts/utils/colors_utils.dart';
import 'package:uts/utils/string_utils.dart';
import 'package:uts/dias/main.dart';
import 'package:uts/dias/Screens/about.dart';
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Colors.white,
      leading: Icon( Icons.home, color: Colors.black),
      title: Text(
        StringUtils.Home,
        style: TextStyle(
            color: ColorsUtils.Black,
            fontSize: 20.0,
            fontFamily: StringUtils.Montserrat,
            fontWeight: FontWeight.w700),
      ),
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.orange,
      ),
      onPressed: () {
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TodoApp()),
       );
      },
    ),

        IconButton(
      icon: Icon(
        Icons.info,
        color: Colors.orange,
      ),
      onPressed: () {
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => About()),
       );
      },
    )
  ],
    );
  }

  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}