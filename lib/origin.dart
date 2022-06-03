import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infogetapi/main.dart';
import 'package:infogetapi/splash.dart';

class originnnn extends StatefulWidget {
  String? url;

  originnnn(this.url);

  @override
  State<originnnn> createState() => _originnnnState();
}

class _originnnnState extends State<originnnn> {
  bool status = false;
  oringindata? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmyorigin();
  }

  Future<void> getmyorigin() async {
    if (widget.url!.isNotEmpty) {
      print("datainnnnnnnnnnnnnnn");
      var url = Uri.parse(widget.url!);
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      var oo = jsonDecode(response.body);

      setState(() {
        data = oringindata.fromJson(oo);
        status = true;
      });
    } else {
      print("datanothinggggggggggg");
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

    return WillPopScope(
      onWillPop: onback,
      child: Scaffold(
          appBar: AppBar(title: Text("Origin"), backgroundColor: Colors.black),
          body: widget.url!.isNotEmpty
              ? status?Container(
                  height: bodyheight,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(bodyheight * 0.01,
                      bodyheight * 0.01, bodyheight * 0.01, 0),
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text(
                            "  id ➛ ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: bodyheight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${data!.id}",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: bodyheight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "name ➛ ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: bodyheight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "${data!.name}",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "type ➛ ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: bodyheight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${data!.type}",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: bodyheight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "dimension ➛ ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: bodyheight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "${data!.dimension}",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "created ➛ ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: bodyheight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "${data!.created}",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "residents ➛ ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: bodyheight * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Container(
                      //     height: bodyheight * 0.70,
                      //     width: twidth,
                      //     child: GridView.builder(
                      //       itemCount: data!.residents!.length,
                      //       scrollDirection: Axis.vertical,
                      //       gridDelegate:
                      //       SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount: 10),
                      //       itemBuilder:(context, index) {
                      //
                      //         return Text("data");
                      //       },
                      //     )),
                      Expanded(
                        child: Container(
                          height: bodyheight * 0.70,
                          width: twidth,
                          child: ListView.builder(
                            itemCount: data!.residents!.length,
                            itemBuilder: (context, index1) {
                              return Text(
                                "${data!.residents![index1]}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: bodyheight * 0.03,
                                    fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ):Center(child: CircularProgressIndicator())
              : Container(
                  height: bodyheight,
                  width: twidth,
                  child: Center(
                      child: Text(
                    "No more Data....",
                    style: TextStyle(
                        fontSize: bodyheight * 0.04, color: Colors.red),
                  )),
                )
          // :Center(child: CircularProgressIndicator(color: Colors.black,))
          ),
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

class oringindata {
  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residents;
  String? url;
  String? created;

  oringindata(
      {this.id,
      this.name,
      this.type,
      this.dimension,
      this.residents,
      this.url,
      this.created});

  oringindata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents = json['residents'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['dimension'] = this.dimension;
    data['residents'] = this.residents;
    data['url'] = this.url;
    data['created'] = this.created;
    return data;
  }
}
