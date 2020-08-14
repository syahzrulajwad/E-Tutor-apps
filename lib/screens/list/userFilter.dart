import 'package:flutter/material.dart';
import 'package:hello_world/screens/home/main_sidebar.dart';
import 'dart:async';
import 'user.dart';
import 'services.dart';
import 'package:hello_world/screens/home/detail.dart';

class UserFilter extends StatefulWidget {
  UserFilter() : super();

  final String title = "Tutor List";
  @override
  _UserFilterState createState() => _UserFilterState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _UserFilterState extends State<UserFilter> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<User> users = List();
  List<User> filteredUsers = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
       appBar: AppBar(
        centerTitle: true,
        title: Text(
          'List Tutor',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'pacifico',
          ),
        ),
        backgroundColor:  Colors.blue,
        elevation: 0.0,
        
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 27, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.5),
                  ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5.0),
                hintText: 'Filter by Name or Email',
                icon: Icon(Icons.search),              
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    filteredUsers = users
                        .where((u) => (u.name
                                .toLowerCase()
                                .contains(string.toLowerCase()) ||
                            u.email.toLowerCase().contains(string.toLowerCase())))
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: new GestureDetector(
                    // onTap: ()=> Navigator.of(context).push(
                    //   new MaterialPageRoute(
                    //     builder:(BuildContext context)=> new Detail(
                    //       list: users,
                    //       index: index,
                    //     ),
                    //   ),
                    // ),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              filteredUsers[index].name,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                             filteredUsers[index].email,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
