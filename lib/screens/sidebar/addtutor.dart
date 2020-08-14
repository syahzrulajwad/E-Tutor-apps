import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  File _image;
  final picker=ImagePicker();

  Future getImageGallery() async{
    var imageFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image=File(imageFile.path);
    });
  }

  Future getImageCamera() async{
    var imageFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image=File(imageFile.path);
    });
  }

  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerIc = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  TextEditingController controllerAddress = new TextEditingController();
  TextEditingController controllerAge = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerOccupation = new TextEditingController();
  TextEditingController controllerExperience = new TextEditingController();
  TextEditingController controllerAcademic = new TextEditingController();
  TextEditingController controllerSubject = new TextEditingController(); 

  Future upload(File imageFile) async{
    var stream = new http.ByteStream(Stream.castFrom(imageFile.openRead()));
    var length= await imageFile.length();
    var uri= Uri.parse("http://192.168.1.112/psm/add_tutor.php");
    var request= new http.MultipartRequest("POST", uri);

    var multipartFile= new http.MultipartFile('image', stream, length,filename: basename(imageFile.path));

    request.fields['name']=controllerName.text;
    request.fields['ic']=controllerIc.text;
    request.fields['phone']=controllerPhone.text;
    request.fields['address']=controllerAddress.text;
    request.fields['age']=controllerAge.text;
    request.fields['email']=controllerEmail.text;
    request.fields['occupation']=controllerOccupation.text;
    request.fields['experience']=controllerExperience.text;
    request.fields['academic']=controllerAcademic.text;
    request.fields['subject']=controllerSubject.text;
    request.files.add(multipartFile);    

    var response= await request.send();
    if(response.statusCode==200){
      print("Image Uploaded");
    }else{
      print("Upload Failed");
    }
  }




  // void addTutor() {
  //   var url = "http://192.168.1.112/psm/add_tutor.php";
  //   http.post(url, body: {
  //     "name": controllerName.text,
  //     "ic": controllerIc.text,
  //     "phone": controllerPhone.text,
  //     "address": controllerAddress.text,
  //     "age": controllerAge.text,
  //     "email": controllerEmail.text,
  //     "occupation": controllerOccupation.text,
  //     "experience": controllerExperience.text,
  //     "academic": controllerAcademic.text,
  //     "subject": controllerSubject.text,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        title: new Text(
          "Register Tutor",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'pacifico',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Text(
              "Please Upload Your Profile Picture!",
              style: TextStyle(
                fontSize:16,
                fontFamily:'montserrat',
              ),
            ),

            Center(
              child: _image==null
              ? new Text("No Image Selected!")
              : new Image.file(_image),
            ),

            Row(
              children: <Widget>[
                new RaisedButton(
                  child: Icon(Icons.image),
                  onPressed: getImageGallery, 
                  ),
                new RaisedButton(
                  child: Icon(Icons.camera),
                  onPressed: getImageCamera, 
                  ),
                  
              ],
            ),

            new TextField(
              controller: controllerName,
              decoration: new InputDecoration(
                hintText: "Name",
                labelText: "NAME",
              ),
            ),
            new TextField(
              controller: controllerIc,
              decoration: new InputDecoration(
                hintText: "123456789",
                labelText: "IC",
              ),
            ),
            new TextField(
              controller: controllerPhone,
              decoration: new InputDecoration(
                hintText: "012345678",
                labelText: "PHONE",
              ),
            ),
            new TextField(
              controller: controllerAddress,
              decoration: new InputDecoration(
                hintText: "Name",
                labelText: "ADDRESS",
              ),
            ),
            new TextField(
              controller: controllerAge,
              decoration: new InputDecoration(
                hintText: "AGE",
                labelText: "AGE",
              ),
            ),
            new TextField(
              controller: controllerEmail,
              decoration: new InputDecoration(
                hintText: "email@gmail.com",
                labelText: "EMAIL",
              ),
            ),
            new TextField(
              controller: controllerOccupation,
              decoration: new InputDecoration(
                hintText: "occupation",
                labelText: "OCCUPATION",
              ),
            ),
            new TextField(
              controller: controllerExperience,
              decoration: new InputDecoration(
                hintText: "5",
                labelText: "EXPERIENCE TEACHING(Years)",
              ),
            ),
            new TextField(
              controller: controllerAcademic,
              decoration: new InputDecoration(
                hintText: "spm",
                labelText: "QUALIFICATION ACADEMIC",
              ),
            ),
              new TextField(
              controller: controllerSubject,
              decoration: new InputDecoration(
                hintText: "Science",
                labelText: "TEACHING SUBJECT",
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text("ADD TUTOR"),
              color:  Colors.blue[300],
              onPressed: () {
                // addTutor();
                upload(_image);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
    );
  }
}
