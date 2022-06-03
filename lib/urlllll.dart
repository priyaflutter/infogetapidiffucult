import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infogetapi/main.dart';
import 'package:infogetapi/splash.dart';

class urlll extends StatefulWidget {
  List<Results>? results;
  int index;

  urlll(this.results, this.index);

  @override
  State<urlll> createState() => _urlllState();
}

class _urlllState extends State<urlll> {
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmyurldata();
  }

  Future<void> getmyurldata() async {
    if (widget.results!.isNotEmpty) {
      print("bhareliii");
      for (int i = 0; i < widget.results!.length; i++) {
        print("==========${widget.results![i].status}");
        setState(() {
          status = true;
        });
      }
    } else {
      print("====blackkkk");
    }
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
      appBar: AppBar(title: Text("Url"), backgroundColor: Colors.black),
      body: WillPopScope(
          onWillPop: onback,
          child: widget.results!.isNotEmpty
              ? status
                  ? Container(
                      height: bodyheight,
                      width: double.infinity,
                      padding: EdgeInsets.all(bodyheight * 0.01),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: twidth*0.65,
                                // decoration: BoxDecoration(border: Border.all(width: 1)),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("id : ",
                                            style: TextStyle(
                                                fontSize: bodyheight * 0.02,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        Text(
                                          "${widget.results![widget.index].id}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Name : ",
                                            style: TextStyle(
                                                fontSize: bodyheight * 0.02,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        Text(
                                          "${widget.results![widget.index].name}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("status : ",
                                            style: TextStyle(
                                                fontSize: bodyheight * 0.02,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        Text(
                                          "${widget.results![widget.index].status}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("species : ",
                                            style: TextStyle(
                                                fontSize: bodyheight * 0.02,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        Text(
                                          "${widget.results![widget.index].species}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("type : ",
                                            style: TextStyle(
                                                fontSize: bodyheight * 0.02,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        Text(
                                          "${widget.results![widget.index].type}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("       gender : ",
                                            style: TextStyle(
                                                fontSize: bodyheight * 0.02,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green)),
                                        Text(
                                          "${widget.results![widget.index].gender}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text("origin :",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    Row(
                                      children: [
                                        Text("\t \t \t name :",
                                            style: TextStyle(
                                                fontSize: bodyheight * 0.02,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green)),
                                        Expanded(
                                          child: Text(
                                            "${widget.results![widget.index].origin!.name}",
                                            style: TextStyle(
                                                fontSize: bodyheight * 0.02,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  child: Container(
                                    height: bodyheight*0.15,
                                    width: twidth*0.35,
                                    margin: EdgeInsets.all(bodyheight*0.002),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${widget.results![widget.index].image}"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(" \t\t\t\t url : ",
                                  style: TextStyle(
                                      fontSize: bodyheight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Text(
                                "${widget.results![widget.index].origin!.url}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text("location :",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Row(
                            children: [
                              Text("\t\t\t\t\t name : ",
                                  style: TextStyle(
                                      fontSize: bodyheight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Text(
                                "${widget.results![widget.index].location!.name}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("\t\t\t\t\t\turl : ",
                                  style: TextStyle(
                                      fontSize: bodyheight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Text(
                                "${widget.results![widget.index].location!.url}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("url : ",
                                  style: TextStyle(
                                      fontSize: bodyheight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Text(
                                "${widget.results![widget.index].url}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("created : ",
                                  style: TextStyle(
                                      fontSize: bodyheight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Text(
                                "${widget.results![widget.index].created}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text("episode : ",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                itemCount: widget.results![widget.index].episode!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: bodyheight * 0.05,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(bodyheight * 0.01),
                                    decoration: BoxDecoration(border: Border.all(width: 1)),
                                    child: Center(
                                        child: Text(
                                          "${widget.results![widget.index].episode![index]}",
                                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                        )),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
              : Container(
                  height: bodyheight,
                  width: twidth,
                  child: Center(
                      child: Text(
                    "No more Data....",
                    style: TextStyle(
                        fontSize: bodyheight * 0.04, color: Colors.red),
                  )),
                )),
    );
  }

  Future<bool> onback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return splash();
      },
    ));

    return Future.value(true);
  }
}
