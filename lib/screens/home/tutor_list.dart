import 'dart:convert';
import 'package:hello_world/shared/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/home/detail.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new Index(),
  ));
}

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.1.112/psm/getdata.php");
    print(response.body);
    return json.decode(response.body);
  }
// search field
Widget searchField(){
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: TextField(
      decoration: InputDecoration(
        contentPadding:EdgeInsets.all(5.0),
        hintText: 'Filter by Name',
      ),
      onChanged: (string){
        //filter in textfield
      },
    ),
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'List Tutor',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'pacifico',
          ),
        ),
        backgroundColor:  Colors.blue[300],
        elevation: 0.0,
        
      ),
    
      body: Container(
        
        child: new FutureBuilder<List>(  
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
          
        ),
        
      ),
    
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
       
        return new Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Detail(
                        list: list,
                        index: i,
                      )),
            ),
            
            child: new Card(                                                                                                                                        
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 55.0,
                          height: 55.0,
                          child: CircleAvatar(),
                        ),
                        SizedBox(width: 5.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "${list[i]['name']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            new Text("Age ${list[i]['age']}"),
                            new Text("${list[i]['occupation']}"),
                            new Text("${list[i]['academic']}"),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      // alignment: Alignment.center,
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: 10.0, vertical: 10.0),
                      // child: FlatButton(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(30.0),
                      //   ),
                      //   child: Text(
                      //     "Follow",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      //   color: Colors.cyan,
                      //   onPressed: () {},
                      // ),
                      child: AnimatedButton(
                        animationDuration: const Duration(milliseconds: 2000),
                        initialText: "Follow",
                        finalText: "Unfollow",
                        iconData: Icons.check,
                        iconSize: 18.0,
                        buttonStyle: ButtonStyle(
                          primaryColor: Colors.cyan,
                          secondaryColor: Colors.white,
                          elevation: 10.0,
                          initialTextStyle: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                          finalTextStyle: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          borderRadius: 10.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
        );
        
      },
    );
    
  }
}
