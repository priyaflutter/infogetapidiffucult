import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class nexttt extends StatefulWidget {
  const nexttt({Key? key}) : super(key: key);

  @override
  State<nexttt> createState() => _nextttState();
}

class _nextttState extends State<nexttt> {
   firstpage view = firstpage();

  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyvalue();
  }

  Future<void> getmyvalue() async {
    var url = Uri.parse('https://rickandmortyapi.com/api/character');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    var vv = jsonDecode(response.body);
    view=firstpage.fromJson(vv);
    setState(() {
      status=true;
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
      appBar: AppBar(title: Text("Second"), backgroundColor: Colors.black),
      body:status?ListView.builder(
        itemCount:view.results!.length,
        itemBuilder: (context, index) {
          return Container(
              height: bodyheight * 0.50,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "name : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${view.results![index].name}",
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
                                text: "${view.results![index].name}",
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
                                text: "${view.results![index].name}",
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
                                text: "${view.results![index].name}",
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
                                text: "${view.results![index].name}",
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
                                text: "${view.results![index].name}",
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
                                text: "${view.results![index].name}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45))
                          ])),


                  // Text(
                  //   "name : ${view!.results![index].name}",
                  //   style: TextStyle(fontSize: bodyheight * 0.03),
                  // )
                ],
              ));
        },
      ):Center(child: CircularProgressIndicator(color: Colors.black,)),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
            onPressed: () {},
            label: Text(
              "Prev",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: bodyheight * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
          ),
          FloatingActionButton.extended(
            onPressed: () async {},
            label: Text(
              "Next",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: bodyheight * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

class firstpage {
  Info? info;
  List<Results>? results;

  firstpage({this.info, this.results});

  firstpage.fromJson(Map<String, dynamic> json) {
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
  Null? prev;

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



