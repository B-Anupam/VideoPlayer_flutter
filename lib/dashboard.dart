import 'package:flutter/material.dart';
import 'package:mediashare/video.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffe8e8e8),
      child: Column(children: <Widget>[
        //Welcome and Balance Info
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset.zero,
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => VideoListView(),
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Videos",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      )),
                  Text("Click here to view all videos.",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white70,
                      )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
