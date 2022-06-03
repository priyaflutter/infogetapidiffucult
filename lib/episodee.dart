import 'package:flutter/material.dart';
import 'package:infogetapi/splash.dart';

class episodeeee extends StatefulWidget {
  List<String>? episode;

  episodeeee(this.episode);

  @override
  State<episodeeee> createState() => _episodeeeeState();
}

class _episodeeeeState extends State<episodeeee> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyepisode();
  }

  void getmyepisode() {
    if (widget.episode!.isNotEmpty) {
      print("bhareliii");
      for (int i = 0; i < widget.episode!.length; i++) {
        print("==========${widget.episode![i].toString()}");
      }
    } else {
      print("khaliiiiiiii");
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
      appBar: AppBar(title: Text("Episode"), backgroundColor: Colors.black),
      body: WillPopScope(onWillPop: onback,
        child:widget.episode!.isNotEmpty?
        ListView.builder(
          itemCount: widget.episode!.length,
          itemBuilder: (context, index) {
            return Container(
              height: bodyheight * 0.05,
              width: double.infinity,
              padding: EdgeInsets.all(bodyheight * 0.01),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Center(
                  child: Text(
                    "${widget.episode![index]}",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  )),
            );
          },
        ):Container(
        height: bodyheight,
        width: twidth,
        child: Center(
            child: Text(
              "No more Data....",
              style: TextStyle(
                  fontSize: bodyheight * 0.04, color: Colors.red),
            )),
      )
      )
    );
  }

  Future<bool> onback() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

        return splash();
    },));

    return Future.value(true);
  }
}
