import 'package:flutter/material.dart';
import 'package:hello_world/screens/authenticate/sign_in.dart';
import 'package:hello_world/screens/authenticate/sign_in_tutor.dart';
import 'package:hello_world/screens/home/ImageSplashScreen.dart';
import 'package:hello_world/screens/home/home.dart';
import 'package:hello_world/screens/home/homeTutor.dart';
import 'package:hello_world/screens/home/tutor_list.dart';
import 'package:hello_world/screens/home/notification.dart';
// import 'package:hello_world/screens/list/user.dart';
import 'package:hello_world/screens/list/userFilter.dart';
import 'package:hello_world/screens/sidebar/addtutor.dart';
import 'package:hello_world/screens/sidebar/contact_us.dart';
import 'package:hello_world/screens/sidebar/feedback.dart';
import 'package:hello_world/screens/sidebar/profile.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FluterSplashDemo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageSplashScreen(),
      routes: <String, WidgetBuilder>{
        "/tutor_list": (BuildContext context) => new Index(),
        "/notification": (BuildContext context) => new Notis(),
        "/signin": (BuildContext context) => new SignIn(),
        "/signin1": (BuildContext context) => new SignIn(),
        "/signintutor": (BuildContext context) => new SignInTutor(),
        "/home": (BuildContext context) => new Home(),
        "/homeTutor": (BuildContext context) => new HomeTutor(),
        "/add_data": (BuildContext context) => new AddData(),
        "/user_profile": (BuildContext context) => new UserProfil(),
        "/feedback": (BuildContext context) => new Comment(),
        "/contact_us": (BuildContext context) => new Contact(),
        "/splash_screen": (BuildContext context) => new ImageSplashScreen(),
        "/user_filter": (BuildContext context) => new UserFilter(),
        // "/splash_screen1": (BuildContext context1) => new ImageSplashScreen(),
      },
    );
  }

  Widget build1(BuildContext context1){
    return new MaterialApp(
      routes:<String,WidgetBuilder>{
        "/splash_screen1": (BuildContext context1) => new ImageSplashScreen(),
      },
    );
  }
}
