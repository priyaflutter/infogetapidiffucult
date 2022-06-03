import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infogetapi/episodee.dart';
import 'package:infogetapi/location.dart';
import 'package:infogetapi/origin.dart';
import 'package:infogetapi/splash.dart';
import 'package:infogetapi/urlllll.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash(),
  ));
}

class first extends StatefulWidget {
  String main;

  first(this.main);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  viewdata? view;
  bool status = false;
  String second = "https://rickandmortyapi.com/api/character?page=2";
  bool button = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyvalue();
  }

  Future<void> getmyvalue() async {

    var url = Uri.parse(widget.main);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var vv = jsonDecode(response.body);
    setState(() {
      view = viewdata.fromJson(vv);
      status = true;
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

    return status
        ? Scaffold(
            appBar: AppBar(title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Rick and Morty ",)),
                Text("© ☞️",style: TextStyle(fontSize: bodyheight*0.04),),
                Text("${view!.info!.count}  "),
                Text("📜️ ☞",style: TextStyle(fontSize: bodyheight*0.03),),
                Text("${view!.info!.pages}"),

              ],
            ), backgroundColor: Colors.black),
            body: ListView.builder(
            itemCount: view!.results!.length,
            itemBuilder: (context, index) {
              return Container(
                  height: bodyheight * 0.57,
                  width: double.infinity,
                  margin: EdgeInsets.all(bodyheight * 0.01),
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: bodyheight*0.03,),
                              Card(
                                child: Container(
                                  height: bodyheight * 0.15,
                                  width: twidth * 0.30,
                                  // margin: EdgeInsets.all(bodyheight * 0.01),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${view!.results![index].image}"),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              SizedBox(height: bodyheight*0.25,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("url ⟹ ", style: TextStyle(
                                      fontSize: bodyheight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context, MaterialPageRoute(
                                          builder: (context) {
                                            return urlll(
                                                view!.results,index,
                                            );
                                          },
                                        ));
                                      },
                                      child:
                                      Icon(Icons.remove_red_eye_outlined,size: bodyheight*0.03,),
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black))),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: twidth * 0.04,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: "id ➔ ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text:
                                                "${view!.results![index].id}",
                                                style: TextStyle(
                                                    fontSize: bodyheight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45))
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: "name : ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text:
                                                "${view!.results![index].name}",
                                                style: TextStyle(
                                                    fontSize: bodyheight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45))
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: "status : ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text:
                                                "${view!.results![index].status}",
                                                style: TextStyle(
                                                    fontSize: bodyheight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45))
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: "species : ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text:
                                                "${view!.results![index].species}",
                                                style: TextStyle(
                                                    fontSize: bodyheight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45))
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: "type : ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text:
                                                "${view!.results![index].type}",
                                                style: TextStyle(
                                                    fontSize: bodyheight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45))
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: "gender : ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text:
                                                "${view!.results![index].gender}",
                                                style: TextStyle(
                                                    fontSize: bodyheight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45))
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: "origin : \n   name :",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text:
                                                "${view!.results![index].origin!.name}",
                                                style: TextStyle(
                                                    fontSize: bodyheight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45))
                                          ])),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("   url ⟹ ", style: TextStyle(
                                          fontSize: bodyheight * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context, MaterialPageRoute(
                                              builder: (context) {
                                                return originnnn(
                                                    view!.results![index].origin!.url);
                                              },
                                            ));
                                          },
                                          child:
                                          Icon(Icons.remove_red_eye_outlined,size: bodyheight*0.03,),
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black))),
                                    ],
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "location : \n   name :",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text:
                                                "${view!.results![index].location!.name}",
                                                style: TextStyle(
                                                    fontSize: bodyheight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45))
                                          ])),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("   url ⟹ ", style: TextStyle(
                                          fontSize: bodyheight * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context, MaterialPageRoute(
                                              builder: (context) {
                                                return location(
                                                    view!.results![index].location!.url);
                                              },
                                            ));
                                          },
                                          child:
                                          Icon(Icons.remove_red_eye_outlined,size: bodyheight*0.03,),
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black))),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("episode ⟹ ", style: TextStyle(
                                          fontSize: bodyheight * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context, MaterialPageRoute(
                                              builder: (context) {
                                                return episodeeee(
                                                    view!.results![index].episode);
                                              },
                                            ));
                                          },
                                          child:
                                          Icon(Icons.remove_red_eye_outlined,size: bodyheight*0.03,),
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black))),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("created ⟹ ", style: TextStyle(
                                          fontSize: bodyheight * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                      Expanded(
                                        child: Text("${view!.results![index].created}", style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45)),
                                      ),

                                    ],
                                  ),


                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ));
            },
              ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                print("netxtttttt");

                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return first(second);
                  },
                ));
              },
              label: Text(
                "Next",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: bodyheight * 0.03,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
            ))
        : Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ));
  }
}

class viewdata {
  Info? info;
  List<Results>? results;

  viewdata({this.info, this.results});

  viewdata.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int? count;
  int? pages;
  String? next;
  dynamic? prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['pages'] = this.pages;
    data['next'] = this.next;
    data['prev'] = this.prev;
    return data;
  }
}

class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin =
        json['origin'] != null ? new Origin.fromJson(json['origin']) : null;
    location =
        json['location'] != null ? new Origin.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['species'] = this.species;
    data['type'] = this.type;
    data['gender'] = this.gender;
    if (this.origin != null) {
      data['origin'] = this.origin!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['image'] = this.image;
    data['episode'] = this.episode;
    data['url'] = this.url;
    data['created'] = this.created;
    return data;
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
