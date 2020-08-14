import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
         appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'pacifico',
            ),
          ),
          backgroundColor:  Colors.blue[300],
          elevation: 0.0,
        ),
       
        backgroundColor: Colors.lightBlue[50],
        body: ContactUs(
          cardColor: Colors.white,
          textColor: Colors.black,
          logo: AssetImage('assets/images/logo1.png'),
          email: 'syahzrulajwad@gmail.com',
          companyName: 'Syahzrul Ajwad',
          companyColor: Colors.blue,
          phoneNumber: '+0174839759',
          tagLine: 'Flutter Developer',
          taglineColor: Colors.blue,
          instagram: 'syahzrulajwad',
        ),
    );
  }
}