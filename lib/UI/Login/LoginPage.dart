// import 'dart:html';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:privacee/Services/themes.dart';
import 'package:privacee/UI/Registration/AccountType.dart';
import 'package:privacee/UI/Login/ResetPassword.dart';
import 'package:privacee/Services/API.dart';
import 'package:privacee/UI/home_page.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';
import 'package:privacee/responsive/size_config.dart';

class LoginPage extends StatefulWidget {
  // final ThemeBloc themeBloc;
  // LoginPage({Key key, this.themeBloc}) : super(key: key);
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  bool _isHidden = true;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sI){
         double space = MediaQuery.of(context).size.height * 0.04;
         double fSpace = MediaQuery.of(context).size.height * 0.01;
         return SafeArea(
                    child: Scaffold(
        body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                 SizedBox( height : space *3),
                Logo(),
                SizedBox( height : space *3),
                
                Column(
                  children: <Widget>[
                    textSection(),
                    signInButtton(),
                SizedBox( height : fSpace ),
                forgotLabel(),
                SizedBox( height : space ),
                regButton(),

                  ],
                ),
                
              ],
            ),
        ),
      ),
    ));
         

    });
  }

//email and field input widget
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController deviceIdController = new TextEditingController();
  Widget textSection() {
    return ResponsiveBuilder(builder: (context, sI){
      SizeConfig().init(context);
      double wSize = SizeConfig.safeBlockHorizontal;
      double hSize = SizeConfig.safeBlockVertical;
      double space = hSize * 1;
      double heightSize = hSize * 30;
      double widthSize = 
        sI.deviceScreenType == DeviceScreenType.Mobile
        ?wSize * 80
        :sI.deviceScreenType == DeviceScreenType.Tablet
        ?wSize * 80
        :wSize * 65;
       
      double textSize =
       sI.deviceScreenType == DeviceScreenType.Mobile
        ?hSize* 2.5
        :sI.deviceScreenType == DeviceScreenType.Tablet
        ?hSize* 2.5
        :hSize * 3;

      return Container(
      height: heightSize,
      width: widthSize,
      child: Column(
        children: <Widget>[
          TextFormField(
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white, fontSize: textSize),
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "e.g abc@gmail.com",
              icon: Icon(Icons.email, color: Colors.white, size: textSize,),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintStyle: TextStyle(color: Colors.white),
            ),
            textInputAction: TextInputAction.next,
            validator: (email) =>
                EmailValidator.validate(email) ? null : "Invalid email address",
          ),
          SizedBox(height: space),
          TextFormField(
            focusNode: _passwordFocusNode,
            keyboardType: TextInputType.text,
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white, fontSize: textSize),
            decoration: InputDecoration(
              labelText: "Password",
              icon: Icon(Icons.lock, color: Colors.white ,size: textSize,),
              hintText: "Password",
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintStyle: TextStyle(color: Colors.white),
            ),
            textInputAction: TextInputAction.done,
            validator: (password) {
              Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
              RegExp regex = new RegExp(pattern);
              if (!regex.hasMatch(password))
                return 'Invalid password';
              else
                return null;
            },
            onFieldSubmitted: (_) {
              fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
            },
          ),
        ],
      ),
    );
    });
  }

  Widget regButton() {
    return ResponsiveBuilder(builder: (context, sI){
      double widthSize = 
         sI.deviceScreenType == DeviceScreenType.Mobile
         ?0.55:
         sI.deviceScreenType == DeviceScreenType.Tablet
         ?0.55
         :0.5;
      
      double heightSize = 
      sI.deviceScreenType == DeviceScreenType.Mobile
         ?0.05:
         sI.deviceScreenType == DeviceScreenType.Tablet
         ?0.07
         :0.07;

      double h = MediaQuery.of(context).size.height;
      double hSize =  h * heightSize;
    return FractionallySizedBox(
        widthFactor: widthSize,
        child:Container(
            height: hSize,
            child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => RegistrationScreen(
                      // themeBloc: themeBloc,
                      )));
            },
            color: Colors.lightBlueAccent,
            child: Text('Create Account',
            style: TextStyle(fontSize: hSize/2)),
          ),
        ));
    });
  }

  Widget signInButtton() {
    return ResponsiveBuilder(builder: (context, sI){
      double widthSize = 
         sI.deviceScreenType == DeviceScreenType.Mobile
         ?0.55:
         sI.deviceScreenType == DeviceScreenType.Tablet
         ?0.55
         :0.5;
      
      double heightSize = 
      sI.deviceScreenType == DeviceScreenType.Mobile
         ?0.05:
         sI.deviceScreenType == DeviceScreenType.Tablet
         ?0.07
         :0.07;

      double h = MediaQuery.of(context).size.height;
      double hSize =  h * heightSize;
      return FractionallySizedBox(
        widthFactor: widthSize,
        child: Container(
        height: hSize,
        child: OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          borderSide: BorderSide(
            color: Colors.blue[200],
          ),
          onPressed: () {
            setState(() {
              _isLoading = true;
            });
            signIn(emailController.text, passwordController.text, deviceIdController.text).then((value) {
              if (value == 200) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()),
                    (Route<dynamic> route) => false);
              }
            });
          },
          // elevation: 0.0,
          // color: Colors.purple,
          child: Text("Sign In",
          style: TextStyle(fontSize : hSize /2),),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
    ),
      );
    });
  }

  Widget forgotLabel() {

    return ResponsiveBuilder(builder: (context, sI){
      double heightSize = 
      sI.deviceScreenType == DeviceScreenType.Mobile
         ?0.03:
         sI.deviceScreenType == DeviceScreenType.Tablet
         ?0.05
         :0.05;

      double h = MediaQuery.of(context).size.height;
      double hSize =  h * heightSize;
    return Container(
      height: hSize,
          child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResetPassword()));
          },
          child: Center(
            child: Text("Forgot Password?", 
            style: TextStyle(fontSize: hSize /2)),
          )),
    );

    });
  }

  Widget logo() {
    return SizedBox(
      child: Container(
        // color: Colors.black,
        height: 130.0,
        child: Image.asset(
          'assets/Logo.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      fontSize: 16.0);
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
