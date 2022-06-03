import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infogetapi/splash.dart';

class location extends StatefulWidget {

  String? url;
  location(this.url);



  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {

  locationdata? location;
  bool status=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmylocation();
  }

  Future<void> getmylocation() async {


    if(widget.url!.isNotEmpty)
      {

        print("=======not empty");
        var url = Uri.parse(widget.url!);
        var response = await http.get(url);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        var vv=jsonDecode(response.body);
        location = locationdata.fromJson(vv);
        setState(() {
            status=true;
        });

      }
    else{

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
                          fontSize:bodyheight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${location!.id}",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize:bodyheight * 0.02,
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
                          fontSize:bodyheight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        "${location!.name}",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize:bodyheight * 0.02,
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
                          fontSize:bodyheight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${location!.type}",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize:bodyheight * 0.02,
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
                          fontSize:bodyheight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${location!.dimension}",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize:bodyheight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "url ➛ ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:bodyheight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${location!.url}",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize:bodyheight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "created ➛ ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:bodyheight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${location!.created}",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize:bodyheight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "residents ➛ ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:bodyheight * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: bodyheight * 0.50,
                    width: twidth,
                    // decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: ListView.builder(
                      itemCount: location!.residents!.length,
                      itemBuilder: (context, index1) {
                        return Text(
                          "${location!.residents![index1]}",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize:bodyheight * 0.03,
                              fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                ),
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

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

          return splash();
    },));

    return Future.value(true);
  }
}

class locationdata {
  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residents;
  String? url;
  String? created;

  locationdata(
      {this.id,
        this.name,
        this.type,
        this.dimension,
        this.residents,
        this.url,
        this.created});

  locationdata.fromJson(Map<String, dynamic> json) {
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

