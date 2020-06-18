import 'package:flutter/material.dart';
import 'package:privacee/UI/Registration/AccountEmailVerification2.dart';
import 'package:privacee/UI/Registration/AccountType.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder:  (context, sizingInformation){
      double space = 
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        ?0.1
        :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
        ?0.1
        :0.15;

      return SafeArea(
              child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Logo(),
                  SizedBox(height: MediaQuery.of(context).size.height * space),
                  buildSecurityText(),
                  SizedBox(height: MediaQuery.of(context).size.height * space ),
                  buildTextField('Email'),
                  SizedBox(height: MediaQuery.of(context).size.height * space),
                  resetButton(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  
  }

  Widget buildTextField(String hintText) {
    return ResponsiveBuilder(builder: (context, sizingInformation){
      
       double widthSize = 
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        ?0.9
        :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
        ?0.8
        :0.7;

  

      double h = MediaQuery.of(context).size.height;
      double heightSize = 
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        ?h * 0.08
        :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
        ?h* 0.08
        :h * 0.07;

      return Container(
          height: heightSize,
          child: FractionallySizedBox(
          widthFactor: widthSize,
          child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: heightSize /2.5,
            ),
            prefixIcon: hintText == "Email" ? Icon(Icons.person , size: heightSize /2.5) : Icon(Icons.lock, size: heightSize /2),
            suffixIcon: hintText == "Password"
                ? IconButton(
                    onPressed: _toggleVisibility,
                    icon: _isHidden
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )
                : null,
          ),
          obscureText: hintText == "Password" ? _isHidden : false,
    ),
        ),
      );
    });
  }


  buildSecurityText() {
     return ResponsiveBuilder(builder: (context, sizingInformation){

      double h = MediaQuery.of(context).size.height;
      double heightSize = 
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        ?h * 0.1
        :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
        ?h* 0.1
        :h * 0.12;

    return Container(
      height: heightSize,
          child: Text(
        "Reset Password?",
        style: TextStyle(
          fontSize: heightSize/ 3,
        ),
      ),
    );
     });
  }

  Widget resetButton() {
    return ResponsiveBuilder(builder: (context, sizingInformation){

      double textSize =
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        ?15
        :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
        ?20
        :25;

      double widthSize =
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        ?0.55
        :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
        ?0.5
        :0.4;
      
      double heightSize = 
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        ?0.05
        :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
        ?0.07
        :0.08;

      return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      minWidth: MediaQuery.of(context).size.width * widthSize,
      height: MediaQuery.of(context).size.height * heightSize,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VerificationEmail()));
      },
      color: Colors.lightBlueAccent,
      child: Text('Reset Password',
      style: TextStyle(fontSize: textSize)),
    );
    });
  }
}
