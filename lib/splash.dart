import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infogetapi/main.dart';
import 'package:http/http.dart' as http;

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  bool status1 = false;
   String main="https://rickandmortyapi.com/api/character";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyapi();
  }

  Future<void> getmyapi() async {
    print("tttttttttttttt");

   Future.delayed(Duration(seconds: 5)).then((value) {

     if (status1) {


     } else {
       print("ssssssssssssss");
       Navigator.pushReplacement(context, MaterialPageRoute(
         builder: (context) {
           return first(main);
         },
       ));
     }

   });

  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbatheight = MediaQuery.of(context).padding.top;
    double navibartheight = MediaQuery.of(context).padding.bottom;
    double tappbar = kToolbarHeight;

    double bodyheight = theight - navibartheight - statusbatheight - tappbar;

    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Container(
        height: bodyheight,
        width: double.infinity,
        decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/search.gif"),
        )),
      ),
          )),
    );
  }
}

