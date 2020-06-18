import 'package:flutter/material.dart';
import 'package:privacee/UI/Login/AccountRecovery.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder:(context, sizingInformation){
      
      double space = 
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        ?0.07
        :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
        ?0.07
        :0.1;

      return SafeArea(
              child: Scaffold(
        body: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildSecurityText(),
                    SizedBox(height : MediaQuery.of(context).size.height * space),
                    buildTextField('Enter new password'),
                    SizedBox(height : MediaQuery.of(context).size.height * space),
                    buildTextField('Re-enter new password'),
                    SizedBox(height : MediaQuery.of(context).size.height * space * 2),
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
        :0.65;
          double heightSize = 
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        ?0.08
        :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
        ?0.08
        :0.07;
         double height = MediaQuery.of(context).size.height;
         double hSize = height * heightSize;
      return Container(
              height: hSize,
              child: FractionallySizedBox(
          widthFactor: widthSize,
          child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: hSize /2.5,
            ),
            prefixIcon: Icon(Icons.lock, size: hSize/2.5),
            suffixIcon: IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            ),
          ),
          obscureText: _isHidden,
    ),
        ),
      );
    });
  }

  buildSecurityText() {
    return ResponsiveBuilder(builder:(context, sizingInformation){
      double h = MediaQuery.of(context).size.height;
      double heightSize = h * 0.1;
  
      return Container(
              height: heightSize,
              child: Text(
        "Change Password?",
        style: TextStyle(
          fontSize: heightSize/2,
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
            context, MaterialPageRoute(builder: (context) => RecoverPage()));
      },
      color: Colors.lightBlueAccent,
      child: Text('Save',
      style: TextStyle(fontSize: MediaQuery.of(context).size.height * heightSize /2, )),
    );
    });
  }
}
