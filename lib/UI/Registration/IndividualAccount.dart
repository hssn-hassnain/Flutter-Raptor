import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privacee/SizeConfig.dart';
import 'dart:io';
import 'AccountEmailVerification.dart';
import '../../Services/API.dart';
import 'package:privacee/responsive/responsive_builder.dart';
import 'package:privacee/enums/device_screen_type.dart';

class Individualac extends StatefulWidget {
  @override
  _Individualac createState() => _Individualac();
}

class _Individualac extends State<Individualac> {
  File _image;
  bool _agreedToTOS = false;
  bool _sel = false;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
  final TextEditingController secondaryMobileController =
      new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController imageController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Individual Account',
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0)),
        ),
        body: iForm(),
      ),
    );
  }

  Widget iForm() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double widthSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 1
              : sizingInformation.deviceScreenType == DeviceScreenType.Tablet
                  ? 0.9
                  : 0.75;

      double h = MediaQuery.of(context).size.height;
      double space = h * 0.02;

      return Builder(
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.9,
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: widthSize,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                firstRow(),
                SizedBox(height: space),
                secondRow(),
                SizedBox(height: space),
                thirdRow(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    checkBox1(),
                    checkBox2(),
                  ],
                ),
                saveButton(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget saveButton() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      double size = sizingInformation.orientation == Orientation.portrait
          ? width
          : height;
      double overallSize = size * 0.1;
      double textSize = overallSize / 2;
      double widthSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 0.4
              : sizingInformation.deviceScreenType == DeviceScreenType.Tablet
                  ? 0.5
                  : 0.5;
      return FractionallySizedBox(
        widthFactor: widthSize,
        child: Container(
          height: overallSize,
          child: MaterialButton(
            color: Colors.greenAccent[400],
            onPressed: () {
              regIndividual(
                      emailController.text,
                      passwordController.text,
                      mobileController.text,
                      secondaryMobileController.text,
                      nameController.text,
                      imageController.text)
                  .then((value) {
                if (value == 200) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AccountVerificationEmail()),
                      (Route<dynamic> route) => false);
                }
                ;
              });
            },
            child: Text(
              'Save',
              style: TextStyle(fontSize: textSize),
            ),
          ),
        ),
      );
    });
  }

  Widget firstRow() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      double size = sizingInformation.orientation == Orientation.portrait
          ? height
          : width;
      double iconSize = size * 0.1;
      double hSize = size * 0.15;
      double sizing = size * 0.2;
      double textSize = sizing * 0.2;

      Future getImage() async {
        var image = await ImagePicker.pickImage(source: ImageSource.gallery);

        setState(() {
          _image = image;
          print('Image Path $_image');
        });
      }

      Future takeImage() async {
        var image = await ImagePicker.pickImage(source: ImageSource.camera);

        setState(() {
          _image = image;
          print('Image Path $_image');
        });
      }

      Future<void> _showDialog(BuildContext context) {
        return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
              backgroundColor: Colors.grey[900],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Pick an Image:",
                        style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     ListTile(
                      title: Text(
                        "Select From Gallery",
                        style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        getImage();
                      },
                    ),
                     ListTile(
                      title: Text(
                        "Open Camera",
                        style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        takeImage();
                      },
                    ),
                  ],
              ),
            );
          },
        );
      };

      return Column(
        children: <Widget>[
          Container(
            height: hSize,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              color: const Color(0xFF212121).withOpacity(0.5),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: iconSize / 2,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: SizedBox(
                          height: iconSize * 0.9,
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
                      size: iconSize * 0.2,
                    ),
                    onPressed: () {
                      _showDialog(context);
                    },
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Full Name',
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: textSize / 1.1,
                                letterSpacing: 0.5,
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Full Name',
                              hintStyle: TextStyle(fontSize: textSize / 1.5),
                              suffixIcon: Icon(
                                FontAwesomeIcons.pen,
                                size: textSize / 1.5,
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
          ),
        ],
      );
    });
  }

  Widget secondRow() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      double size = sizingInformation.orientation == Orientation.portrait
          ? height
          : width;
      double overallSize = size * 0.42;
      double sizing = size * 0.2;
      double textSize = sizing * 0.2;

      return Column(
        children: <Widget>[
          Container(
            height: overallSize,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              color: const Color(0xFF212121).withOpacity(0.5),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: textSize,
                        letterSpacing: 0.5,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'someone@email.com',
                          hintStyle: TextStyle(fontSize: textSize / 1.5),
                          labelText: '   Email*',
                          labelStyle: TextStyle(fontSize: textSize / 1.5),
                          suffixIcon: Icon(
                            FontAwesomeIcons.pen,
                            size: textSize / 1.5,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: mobileController,
                        decoration: InputDecoration(
                          hintText: '   Phone number*',
                          hintStyle: TextStyle(fontSize: textSize / 1.5),
                          suffixIcon: Icon(
                            FontAwesomeIcons.pen,
                            size: textSize / 1.5,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '   Address',
                          hintStyle: TextStyle(fontSize: textSize / 1.5),
                          suffixIcon: Icon(
                            FontAwesomeIcons.pen,
                            size: textSize / 1.5,
                          ),
                        ),
                      ),
                      Container(
                        child: Form(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: '   Country',
                                      hintStyle:
                                          TextStyle(fontSize: textSize / 1.5),
                                    ),
                                  ),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 1.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: '   State',
                                    hintStyle:
                                        TextStyle(fontSize: textSize / 1.5),
                                  ),
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
            ),
          ),
        ],
      );
    });
  }

  Widget thirdRow() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      double size = sizingInformation.orientation == Orientation.portrait
          ? height
          : width;
      double overallSize = size * 0.25;
      double sizing = size * 0.2;
      double titleSize = sizing * 0.2;
      double textSize = titleSize / 1.5;
      double space = size * 0.02;
      return Column(
        children: <Widget>[
          Container(
            height: overallSize,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              color: const Color(0xFF212121).withOpacity(0.5),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: titleSize,
                        letterSpacing: 0.5,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: '   Enter New Password*',
                          hintStyle: TextStyle(fontSize: textSize),
                          suffixIcon: Icon(
                            FontAwesomeIcons.pen,
                            size: textSize,
                          ),
                        ),
                        obscureText: true,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '   Re-enter New Password*',
                          hintStyle: TextStyle(fontSize: textSize),
                          suffixIcon: Icon(
                            FontAwesomeIcons.pen,
                            size: textSize,
                          ),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget checkBox1() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      double size = sizingInformation.orientation == Orientation.portrait
          ? width
          : height;
      double overallSize = size * 0.12;

      double textSize = overallSize / 4;
      double space = size * 0.02;
      return Container(
        height: overallSize,
        child: Row(
          children: <Widget>[
            Checkbox(
                tristate: false,
                activeColor: Colors.blue,
                checkColor: Colors.white,
                value: _sel,
                onChanged: (bool resp) {
                  setState(() {
                    _sel = resp;
                  });
                }),
            GestureDetector(
              child: Container(
                width: width * 0.8,
                child: Text(
                  'I want to receive exclusive offers and promotion from Privacy',
                  style: TextStyle(fontSize: textSize),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget checkBox2() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      double size = sizingInformation.orientation == Orientation.portrait
          ? width
          : height;
      double overallSize = size * 0.12;
      double textSize = overallSize / 4;
      double space = size * 0.02;

      return Container(
        height: overallSize,
        child: Row(
          children: <Widget>[
            Checkbox(
              tristate: false,
              activeColor: Colors.blue,
              checkColor: Colors.white,
              value: _agreedToTOS,
              onChanged: _setAgreedToTOS,
            ),
            GestureDetector(
              onTap: () => _setAgreedToTOS(!_agreedToTOS),
              child: Container(
                width: width * 0.8,
                child: Text(
                  'I Hearby acknowledge that I have completely read and fully understand the Privacy term and condition',
                  style: TextStyle(fontSize: textSize),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  void _submit() {
    _formKey.currentState.validate();
    print('Form submitted');
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
}
