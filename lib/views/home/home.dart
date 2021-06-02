import 'package:flutter/material.dart';
import 'package:uts/utils/colors_utils.dart';
import 'package:uts/utils/string_utils.dart';
import 'package:uts/views/home/widgets/home_appbar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:uts/views/home/widgets/home_shopbycategory.dart';
import 'package:uts/views/home/widgets/home_showrecentorders.dart';
import 'package:uts/dias/main.dart';
import 'package:uts/dias/Screens/about.dart';

class Home extends StatefulWidget {
    final VoidCallback logout;
  Home(this.logout);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
    logout(){
    setState(() {
      widget.logout();
    });
  }

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: ColorsUtils.HomeBgColor,
        appBar:AppBar(
      backgroundColor: Colors.white,
      leading: Icon( Icons.home, color: Colors.black, ),
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
    ),

    

     IconButton(
      icon: Icon(
        Icons.lock,
        color: Colors.orange,
      ),
      onPressed: () {
              logout();
            },
    )
  ],
    ),
        
        body: showBody());
  }

  Widget image_carousel = new Container(
    height: 200.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('assets/offers/Offer1.jpg'),
        AssetImage('assets/offers/Offer2.jpg'),
        AssetImage('assets/offers/Offer3.jpg'),
        AssetImage('assets/offers/Offer4.jpg'),
        AssetImage('assets/offers/Offer5.jpg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastLinearToSlowEaseIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
    ),
  );

  Widget showBody() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView(
        children: <Widget>[
          image_carousel,
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              StringUtils.ShopByCategory,
              style: TextStyle(
                  color: ColorsUtils.Black,
                  fontSize: 20.0,
                  fontFamily: StringUtils.Montserrat,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 20.0),
          HomeShopByCategory(),
          SizedBox(height: 5.0),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  StringUtils.Your_Orders,
                  style: TextStyle(
                      color: ColorsUtils.Black,
                      fontSize: 20.0,
                      fontFamily: StringUtils.Montserrat,
                      fontWeight: FontWeight.w700),
                ),
                FlatButton(
                    onPressed: _showAllBtnTapped,
                    child: Text(
                      StringUtils.Show_All,
                      style: TextStyle(
                          color: ColorsUtils.PrimaryColor,
                          fontSize: 18.0,
                          fontFamily: StringUtils.Montserrat,
                          fontWeight: FontWeight.w400),
                    )
                )
              ],
            ),
          ),
          HomeShowRecentOrders(),
        ],
      ),
    );
  }

  Widget _showAllBtnTapped() {
  }
}