import 'package:flutter/material.dart';
import 'package:hello_world/screens/home/ImageSplashScreen.dart';
import 'package:hello_world/screens/sidebar/contact_us.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

class TutorDrawer extends StatelessWidget {
  TutorDrawer({this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.green[300],
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: new ExactAssetImage(
                            'assets/images/logo1.png',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'Syahzrul ajwad',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'montserrat',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '$email',
                    style: TextStyle(
                      fontFamily: 'montserrat',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/user_profile");
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text(
              'List Tutor',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/tutor_list");
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text(
              'Send Feedback',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/feedback");
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text(
              'Contact us',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context)=>new Contact(),
                    ),
                );
              },
          ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text(
          //     'Settings',
          //     style: TextStyle(
          //       fontSize: 15,
          //     ),
          //   ),
          //   onTap: null,
          // ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/splash_screen', (Route<dynamic> route) => false);
              },
          ),

          ListTile(
            contentPadding: const EdgeInsets.all(50.0),
            leading: FlatButton.icon(
              color: Colors.green[100],
              icon: Icon(Icons.person_pin),
              label: Text(
                "Go To Student Page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'montserrat',
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context)=>new ImageSplashScreen(),
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

// class Detail extends StatefulWidget {
//   @override
//   _DetailState createState() => _DetailState();
// }

// class _DetailState extends State<Detail> {
//   File _image;
//   final _picker = ImagePicker();

//   Future getImageGallery() async {
//     var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       _image = imageFile;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
