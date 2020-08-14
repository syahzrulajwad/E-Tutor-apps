import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Comment extends StatefulWidget {
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerComment = new TextEditingController();

  void addComment() {
    var url = "http://192.168.1.112/psm/add_comment.php";
    http.post(url, body: {
      "name": controllerName.text,
      "comment": controllerComment.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Feedback',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'pacifico',
          ),
        ),
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
      ),
      body: Builder(builder: (context) {
        return Container(
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      controller: controllerName,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Your Name",
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Comment',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      controller: controllerComment,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        hintText: "Enter Your Comment",
                                        contentPadding: EdgeInsets.all(20.0),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new RaisedButton(
                              child: new Text(
                                "SENT",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.blue[300],
                              onPressed: () {
                                addComment();                                
                                SnackBar mysnackBar = SnackBar(
                                  content: Text("Success Sent"),
                                );
                                Scaffold.of(context).showSnackBar(mysnackBar);
                                Navigator.of(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
    );
  }
}
