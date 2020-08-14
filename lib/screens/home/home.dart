import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hello_world/screens/home/main_sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class Home extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'E-Tutor',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'pacifico',
          ),
        ),
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.notification_important),
            label: Text(''),
            onPressed: () {
              Navigator.of(context).pushNamed("/notification");
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
   Future<List> getData() async {
    final response = await http.get("http://192.168.1.112/psm/getdata_Admin.php");
    print(response.body);
    return json.decode(response.body);
  }



  int _currentBarIndex = 1;
  List<Marker> allMarkers = [];
  GoogleMapController mapController;
  String searchAddr;
  // final List<AppFlow> tabs=[
  //   PlaceHolderWidget(child: Text('Profile')),
  //   PlaceHolderWidget(child: Text('Home')),
  //   PlaceHolderWigdet(child: ('List Tutor')),

  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(2.3081445, 102.3173985)));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var scaffold = Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Stack(children: <Widget>[
        Container(
          height: size.height * .35,
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Welcome User",
                  style: TextStyle(
                    height: 2,
                    fontSize: 30,
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      CategoryCard(
                        title: "Profile",
                        svgSrc: "assets/images/botak.jpeg",
                        press: (){
                           Navigator.of(context).pushNamed("/user_profile");
                        },
                      ),
                      CategoryCard(
                        title: "List Tutor",
                        svgSrc: "assets/images/list.jpeg",
                        press: (){
                           Navigator.of(context).pushNamed("/tutor_list");
                        },
                      ),
                      CategoryCard(
                        title: "Contact Us",
                        svgSrc: "assets/images/contactUs.jpeg",
                        press: (){
                           Navigator.of(context).pushNamed("/contact_us");
                        },
                      ),
                      CategoryCard(
                        title: "FeedBack",
                        svgSrc: "assets/images/feedback.jpeg",
                        press: (){
                          Navigator.of(context).pushNamed("/feedback");
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        //   GoogleMap(
        //     onMapCreated: onMapCreated,
        //     initialCameraPosition: CameraPosition(
        //       target: LatLng(2.3081445, 102.3173985),
        //       zoom: 12.0
        //     ),
        //     markers: Set.from(allMarkers),
        //   ),//googlemap

        //   Positioned(
        //     top: 30.0,
        //     right: 15.0,
        //     left: 15.0,
        //     child: Container(
        //       height: 50.0,
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        //       child: TextField(
        //         decoration: InputDecoration(
        //             hintText: 'Enter Address',
        //             border: InputBorder.none,
        //             contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
        //             suffixIcon: IconButton(
        //                 icon: Icon(Icons.search),
        //                 onPressed: searchandNavigate,
        //                 iconSize: 30.0)),
        //         onChanged: (val) {
        //           setState(() {
        //             searchAddr = val;
        //           });
        //         },
        //       ),//textfield
        //     ),//container
        // ),//position
      ]),
      // extendBody: tabs[_currentIndex],
      //   bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentBarIndex,
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.brown[400],
      //   unselectedFontSize: 10,
      //   selectedFontSize: 15,

      //   items:[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       title: Text('Profile'),
      //       backgroundColor: Colors.blue[300]
      //       ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //       backgroundColor: Colors.blue[300]
      //       ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       title: Text('List Tutor'),
      //       backgroundColor: Colors.green,

      //       ),
      //   ],
      //   onTap:(index){
      //     setState(() {
      //       _currentBarIndex=index;
      //     });
      //   },
      // ),
    );
    return scaffold;
  }

  searchandNavigate() {
    Geolocator().placemarkFromAddress(searchAddr).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
              LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 10.0)));
    });
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.svgSrc,
    this.title, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
        child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              // color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  new Image.asset(svgSrc),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
