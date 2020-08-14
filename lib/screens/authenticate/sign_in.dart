import 'package:flutter/material.dart';
import 'package:hello_world/screens/home/home.dart';
import 'package:hello_world/screens/home/main_sidebar.dart';
import 'package:hello_world/shared/constants.dart';
import 'package:hello_world/shared/loading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(new SignIn());
String email = '';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      home: new SignInPage(),
      routes: <String, WidgetBuilder>{
        "/maindrawer": (BuildContext context) => new MainDrawer(
              email: email,
            ),
        "/home": (BuildContext context) => new Home(),
      },
    );
  }
}

class SignInPage extends StatefulWidget {
  final Function toggleView;
  SignInPage({this.toggleView});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String msg = '';
  bool loading = false;
  // text field state
  String email = '';
  String password = '';

  Future<List> _login() async {
    final response =
        await http.post("http://192.168.1.112/psm/insertdata.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    print(response.body);
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        loading = false;
        msg = 'COULD NOT SIGN IN WITH THOSE CREDENTIAL';
      });
    } else {
      Navigator.pushReplacementNamed(context, '/home');
      setState(() {
        email = datauser[0]['username'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80.0,
        child: Image.asset(
          'assets/images/logo1.png',
          height: 200,
          // width: 1000,
          fit: BoxFit.fill,
          ),
      ),
    );

    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              backgroundColor: Colors.blue[300],
              elevation: 0.0,
              title: Text(
                'SIGN IN TO E-TUTOR',
                style: TextStyle(
                  fontFamily: 'montserrat' ,    
                ),
                textAlign: TextAlign.center,
              ),
              // actions: <Widget>[
              //   FlatButton.icon(
              //       icon: Icon(Icons.person),
              //       label: Text('Register'),
              //       onPressed: () {
              //         widget.toggleView();
              //       })
              // ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    logo,
                    SizedBox(height: 20.0),
                    TextFormField(
                        controller: user,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        controller: pass,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        autocorrect: true,
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a passsword more than 6'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                          }
                          _login();
                        }),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text('Does not have account?'),
                            FlatButton(
                              textColor: Colors.red,
                              child: Text('Register!',
                              style: TextStyle(
                                fontSize:20,
                                fontFamily: 'montserrat',
                                ),
                                ),
                              onPressed: (){
                                 widget.toggleView();
                              },
                              
                              ),
                          ],
                        ),
                      ),
                    SizedBox(height: 12.0),
                    Text(
                      msg,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            resizeToAvoidBottomPadding: false,
          );
  }
}
