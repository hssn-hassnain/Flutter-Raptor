import 'package:flutter/material.dart';
import 'package:privacee/UI/Login/AppLock.dart';
import 'package:privacee/UI/Login/LoginPage.dart';
import 'package:privacee/UI/Login/local_auth.dart';
import 'package:privacee/UI/Registration/AccountType.dart';
// import 'package:local_auth/local_auth.dart';
import 'package:privacee/UI/home_page.dart';
import 'package:flutter/services.dart';
import 'package:privacee/responsive/screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';
import 'package:privacee/enums/device_screen_type.dart';

import 'ResetPassword.dart';
// import 'changePasscode.dart';

class LoginSelection extends StatefulWidget {
  @override
  _LoginSelectionState createState() => _LoginSelectionState();
}

class _LoginSelectionState extends State<LoginSelection> {
  bool _isHidden = true;
  @override
  void initState() {
    super.initState();
    _checkBiometrics();
    // _getAvailableBiometrics();
  }

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  // List<BiometricType> _availableBiometrics;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }
void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed('/AppLockPage');
  }
  // Future<void> _getAvailableBiometrics() async {
  //   List<BiometricType> availableBiometrics;
  //   try {
  //     availableBiometrics = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  //   if (!mounted) return;

  //   setState(() {
  //     _availableBiometrics = availableBiometrics;
  //   });
  // }

 
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _layoutDetails()));
  }


  Widget _layoutDetails(){
    return ScreenTypeLayout(
      mobile: _layoutDetailsM(),
      tablet: _layoutDetailsM(),
      desktop: _layoutDetailsTD(),
      
    );

  }

  Widget _layoutDetailsM() {
    Orientation orientation = MediaQuery.of(context).orientation;
    double h = MediaQuery.of(context).size.height;
    double fSpace = h * 0.02;
    double space = h * 0.03;
    if (orientation == Orientation.portrait) {
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Logo())),
            Flexible(
              child: buildunlocksapp(),
              flex: 3,
            ),
            Flexible(
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                    signInButtton(),
                    SizedBox(height : fSpace),
                    forgotLabel(),
                    SizedBox(height : space),
                    regButton()
                  ]
                  ),
              flex: 2,
            ),

            // Icon(Icons.star, size: 50),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(children: <Widget>[
          Logo(),
          // SizedBox(height: 20.0),
          Row(
              children: <Widget>[
                Container(
                  
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height *0.7,
                  child: buildunlocksapp(),
                ),
                Container(
                  
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height *0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                    signInButtton(),
                    SizedBox(height : fSpace),
                    forgotLabel(),
                    SizedBox(height : space),
                    regButton()
                  ]
                  ),
                  ),
              ]),
        ]),
      );
    }
  }

Widget _layoutDetailsTD() {
    
     return Center(
        child: Column(children: <Widget>[
          SizedBox(height: 20.0),
          Logo(),
          // SizedBox(height: 20.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 3.0,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: buildunlocksapp(),
                ),
                VerticalDivider(
                  color: Colors.white,
                ),
                Container(
                  
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 3.0,
                  height: MediaQuery.of(context).size.height / 2.0,
                  child: Column(children:<Widget>[
                    SizedBox(height: 80,),
                    signInButtton(),
                    SizedBox(height: 10,),
                    forgotLabel(),
                    regButton()
                  ]),),
              ]),
        ]),
      );
   
  }


  Widget buildSecurityText() {
    return Column(children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
         padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
        ),
      ),

      // padding: const EdgeInsets.only(left: 200.0),
    ]);
  }

  Widget buildSecurityText2() {
    return Center(
        child: _canCheckBiometrics ==true || _canCheckBiometrics ==null?
      Text(
        "Online",
        style: TextStyle(
          fontSize: 14.0,
        ),
      ):
      Text(
        "Offline",
        style: TextStyle(
          fontSize: 14.0,
        ),)
      // buildFinger(),
    );
  }

  Widget buildunlocksapp() {
    return ResponsiveBuilder(builder: (context, sizingInformation){
      double size = 
        sizingInformation.orientation == Orientation.portrait
        ?MediaQuery.of(context).size.width
        :MediaQuery.of(context).size.height;
      
      double widthSize =
        sizingInformation.deviceScreenType == DeviceScreenType.Mobile
          ?size * 0.2
          :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
          ?size * 0.2
          :size * 0.4;

    
      return Column(children: <Widget>[
      buildSecurityText(),
      Expanded(
              child: GestureDetector(
                  onTap: () {
                   Navigator.push(
                  context, MaterialPageRoute(builder: (context) => new Finger()));
                  }, child:
            CircleAvatar(
          radius: widthSize,
          backgroundColor:  Colors.lightBlueAccent,
          child: Text(
            "Unlock App",overflow: TextOverflow.ellipsis,
            // ,$_canCheckBiometrics
            style: TextStyle(color: Colors.white, fontSize: widthSize /5 ),
          )
          //     Icon(
          //   Icons.fingerprint,
          //   size: 100.0,
          //   color: Colors.lightBlueAccent,
          // ),
        )
        ),
      ),
      
    ]);
    });
  }

  buildSecurityText3() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 5.0, bottom: 20.0),
      child: Text(
        "Or just use Pin Number inserted",
        style: TextStyle(
          fontSize: 13.0,
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: Column(children: <Widget>[
          buildSecurityText3(),
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
              
            ),
          ),
        ]));
  }

  Widget regButton() {
    return ResponsiveBuilder(builder: (context, sizingInformation){
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
          ?0.05
          :0.08;
    
      double hSize = MediaQuery.of(context).size.height * heightSize;
       return 
      FractionallySizedBox(
            widthFactor: widthSize,
            child: Container(
            height: hSize,
            child: MaterialButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
            onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegistrationScreen(
                        // themeBloc: themeBloc,
                        )));
            },
            color: Colors.lightBlueAccent,
            child: Text('Create Account',
            style: TextStyle(fontSize: hSize/2)),
          ),
              ),
      );              
    });
  }

  Widget signInButtton() {

    return ResponsiveBuilder(builder: (context, sizingInformation){
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
          ?0.05
          :0.08;
      
      double h = MediaQuery.of(context).size.height;
      double hSize = h * heightSize;
      return FractionallySizedBox(
      widthFactor: widthSize,
      
      child: Container(
          height:hSize,
          child: OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          borderSide: BorderSide(
            color: Colors.blue[200],
          ),
          onPressed: (){
            
Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );        },
          // elevation: 0.0,
          // color: Colors.purple,
          child: Text("Sign In",
          style: TextStyle(fontSize: hSize /2),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
    });
  }

  Widget forgotLabel() {
    return ResponsiveBuilder(builder: (context, sizingInformation){
        double heightSize =
        sizingInformation.deviceScreenType == DeviceScreenType.Mobile
          ?0.05
          :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
          ?0.05
          :0.08;

        double hSize = MediaQuery.of(context).size.height * heightSize;
        return GestureDetector(
      
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResetPassword()));
        },
        child: Center(
          
          child: Container(
            child: Text("Forgot Password?", 
            style: TextStyle(fontSize: hSize/2.5),)),
        ));       
    });
  }
}
