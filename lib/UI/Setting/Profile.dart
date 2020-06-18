import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:privacee/SizeConfig.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  File _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
// upload function
// Future uploadPic(BuildContext context) async{
//       String fileName = basename(_image.path);
//        StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
//        StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
//        StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
//        setState(() {
//           print("Profile Picture uploaded");
//           Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
//        });
//     }

    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft,
                  size: SizeConfig.imageSizeMultiplier * 6),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Builder(
          builder: (context) => Container(
            alignment: Alignment.topCenter,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                firstRow(),
                profile(),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.widthMultiplier * 7.5),
                  child: buildText2('Phone'),
                ),
                phone(),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.widthMultiplier * 7.5),
                  child: buildText2('T-DNS'),
                ),
                dns(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: SizeConfig.heightMultiplier * 7,
            child: MaterialButton(
              color: Colors.greenAccent[400],
              onPressed: () {},
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: SizeConfig.widthMultiplier * 5,
                ),
              ),
            ),
          ),
          color: Colors.greenAccent[400],
        ),
      ),
    );
  }

  buildText(String aaaa) {
    return Container(
      height: SizeConfig.heightMultiplier * 8.5,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(SizeConfig.widthMultiplier * 6.25),
          hintStyle: TextStyle(fontSize: SizeConfig.widthMultiplier * 4.5),
          hintText: aaaa,
          suffixIcon: Icon(
            FontAwesomeIcons.pen,
            size: SizeConfig.imageSizeMultiplier * 5,
          ),
        ),
      ),
    );
  }

  buildText2(String aaa) {
    return Text(
      aaa,
      style: TextStyle(
        fontSize: SizeConfig.widthMultiplier * 5.5,
        letterSpacing: 0.5,
        color: Colors.lightBlueAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  buildAdd(String text1) {
    return ListTile(
      leading: Icon(
        Icons.add_circle,
        color: Colors.greenAccent[400],
        size: SizeConfig.imageSizeMultiplier * 6
      ),
      title: Text(
        text1,
        style: TextStyle(
          fontSize: SizeConfig.widthMultiplier * 4.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  buildAdding(String text1, String text2) {
    return TextField(
      decoration: InputDecoration(
        labelStyle: TextStyle(
          fontSize: SizeConfig.widthMultiplier * 4.5,
        ),
        labelText: text1,
        hasFloatingPlaceholder: false,
        prefixIcon: IconButton(
          icon: Icon(Icons.remove_circle, size: SizeConfig.imageSizeMultiplier * 6),
          onPressed: () {},
          color: Colors.red,
          
        ),
        prefixStyle: TextStyle(
          fontSize: SizeConfig.widthMultiplier * 4.5,
        ),
        prefixText: text1,
        hintStyle: TextStyle(
          fontSize: SizeConfig.widthMultiplier * 4.5,
        ),
        hintText: text2,
      ),
    );
  }

  Widget firstRow() {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
        Navigator.of(context).pop();
      });
    }

    Future takeImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);

      setState(() {
        _image = image;
        print('Image Path $_image');
        Navigator.of(context).pop();
      });
    }

    Future<void> _showDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Pick an Image:"),
              content: SingleChildScrollView(
                  child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Select From Gallery"),
                    onTap: () {
                      getImage();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.5,
                  ),
                  GestureDetector(
                    child: Text("Open Camera"),
                    onTap: () {
                      takeImage();
                    },
                  ),
                ],
              )),
            );
          });
    }

    return Container(
      height: SizeConfig.heightMultiplier * 22,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 1.3,
            horizontal: SizeConfig.widthMultiplier * 3.75),
        color: Theme.of(context).cardColor,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: SizeConfig.widthMultiplier * 137.5,
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: SizeConfig.widthMultiplier * 11.25,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: SizedBox(
                            width: SizeConfig.widthMultiplier * 22,
                            height: SizeConfig.heightMultiplier * 14,
                            child: (_image != null)
                                ? Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(
                                    "assets/Human.png",
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                        size: SizeConfig.imageSizeMultiplier * 5,
                      ),
                      onPressed: () {
                        _showDialog(context);
                      },
                    ),
                    Flexible(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Full Name',
                                style: TextStyle(
                                  fontSize: SizeConfig.widthMultiplier * 5,
                                  letterSpacing: SizeConfig.widthMultiplier * 0.125,
                                  color: Colors.lightBlueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintStyle: new TextStyle(
                                  fontSize: SizeConfig.widthMultiplier * 5,
                                ),
                                hintText: 'Full Name',
                                suffixIcon: Icon(
                                  FontAwesomeIcons.pen,
                                  size: SizeConfig.imageSizeMultiplier * 5,
                                ),
                              ),
                              validator: (String value) {
                                if (value.trim().isEmpty) {
                                  return 'Full Name is required';
                                }
                                return '';
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profile() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 1.3,
            horizontal: SizeConfig.widthMultiplier * 3.75),
        color: Theme.of(context).cardColor,
        child: Form(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  child: buildText2('Profile'),
                  padding: EdgeInsets.only(
                      top: SizeConfig.heightMultiplier * 2.5,
                      left: SizeConfig.widthMultiplier * 3.75),
                ),
              ),
              buildText('Address'),
              buildText('Phone number'),
              buildText('Email'),
              SizedBox(height: SizeConfig.heightMultiplier * 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget phone() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 1.3,
            horizontal: SizeConfig.widthMultiplier * 3.75),
        color: Theme.of(context).cardColor,
        child: Form(
          child: Column(
            children: <Widget>[
              buildAdding('Mobile  > ', 'Mobile No. '),
              buildAdd('Add Number'),
            ],
          ),
        ),
      ),
    );
  }

  Widget dns() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 1.3,
            horizontal: SizeConfig.widthMultiplier * 3.75),
        color: Theme.of(context).cardColor,
        child: Form(
          child: Column(
            children: <Widget>[
              buildAdding('E-mail   > ', 'Example@mail.com'),
              buildAdding('Tel      > ', 'Tel No.'),
              buildAdd('Add T-DNS'),
            ],
          ),
        ),
      ),
    );
  }
}
