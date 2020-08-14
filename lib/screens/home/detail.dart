import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:async/async.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(""),
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
      ),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(5.00),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(
                  widget.list[widget.index]['image'],
                  // child: _image == null
                  //     ? new Text("No Image Selected!")
                  //     : new Image.file(_image),
                ),
                new Text(
                  widget.list[widget.index]['name'],
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'montserrat',
                  ),
                ),
                new Text(
                  "Email: ${widget.list[widget.index]['email']}",
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'montserrat',
                  ),
                ),
                new Text(
                  "Address: ${widget.list[widget.index]['address']}",
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'montserrat',
                  ),
                ),
                new Text(
                  "Occupation: ${widget.list[widget.index]['occupation']}",
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'montserrat',
                  ),
                ),
                new Text(
                  "Academic: ${widget.list[widget.index]['academic']}",
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'montserrat',
                  ),
                ),
                new Text(
                  "Teaching Subject: ${widget.list[widget.index]['subject']}",
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'montserrat',
                  ),
                ),
                new Text(
                  "Experience: ${widget.list[widget.index]['experience']} years",
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'montserrat',
                  ),
                ),
                new Padding(padding: const EdgeInsets.only(top: 30.0)),
                new FlatButton(
                  color: Colors.red,
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {},
                  child: Text(
                    "Booking",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'montserrat',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
