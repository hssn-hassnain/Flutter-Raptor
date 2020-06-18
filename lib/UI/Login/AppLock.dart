import 'package:flutter/material.dart';
import 'package:privacee/UI/Login/local_auth.dart';
// import 'package:local_auth/local_auth.dart';
import 'package:privacee/UI/home_page.dart';
import 'package:flutter/services.dart';
import 'package:privacee/responsive/responsive_builder.dart';
import 'package:privacee/responsive/screen_type.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/sizing_information.dart';
// import 'changePasscode.dart';

class Finger extends StatefulWidget {
  @override
  _FingerState createState() => _FingerState();
}

class _FingerState extends State<Finger> {
  bool _isHidden = true;
  @override
  void initState() {
    // super.initState();
    _checkBiometrics();
  }

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

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

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(body: SafeArea(child: _layoutDetails()));
  }
  Widget _layoutDetails(){
    return ScreenTypeLayout(
      mobile: _layoutDetailsM(),
      tablet: _layoutDetailsM(),
      
      
    );

  }

  Widget _layoutDetailsM() {
    double space = MediaQuery.of(context).size.height * 0.05;
    Orientation orientation = MediaQuery.of(context).orientation;
    
    if (orientation == Orientation.portrait) {
      return SafeArea(
        child: Column(

          children: <Widget>[
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  buildSecurityText(),
                  buildSecurityText2(),
                ],
                )
              
              ),
            Flexible(
              flex: 3,
              child: Container(
                child: buildFinger())),
         
            Flexible(
              flex: 2,
              child: buildTextField('Pin Number')),
            // Icon(Icons.star, size: 50),
          ],
        ),
      
      );
    } else {
      
      return Center(
        child: Column(
          children: <Widget>[
        
          buildSecurityText(),
         
   
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height *0.7,
                  child: Column(
                    children: <Widget>[
                      Expanded(child: buildSecurityText2()),
                      buildFinger()
                    ],
                    ),
                ),
            
                Container(
                  
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height *0.7,
                  child: buildTextField("Pin Number"),
                ),
              ]),
        ]),
      );
    }
  }

  Widget buildSecurityText() {
    return ResponsiveBuilder(builder: (context, sizingInformation){
      double heightSize =
        sizingInformation.deviceScreenType == DeviceScreenType.Mobile
          ?0.1
          :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
          ?0.1
          :0.1; 
      
      double w = MediaQuery.of(context).size.width;
       double h = MediaQuery.of(context).size.height;
       double size = 
       sizingInformation.orientation == Orientation.portrait
       ?h
       :w;
      double hSize = size * heightSize;
      var align = 
        sizingInformation.orientation == Orientation.portrait
        ?  Alignment.centerLeft
        : Alignment.center;

      return Container(
        alignment: align,
        height: hSize,
        width: w * 0.8,
      // padding: const EdgeInsets.only(left: 200.0),
      child: Text(
        "Welcome, John",
        style: TextStyle(
          fontSize: hSize/2.5,
        ),
      ),
    );
    });
  }

  Widget buildSecurityText2() {
    return ResponsiveBuilder(builder: (context, sI){
      double heightSize =
      sI.deviceScreenType == DeviceScreenType.Mobile
      ?0.15
      :sI.deviceScreenType == DeviceScreenType.Mobile
      ?0.15
      :0.15;
        double w = MediaQuery.of(context).size.width;
       double h = MediaQuery.of(context).size.height;
       double size = 
       sI.orientation == Orientation.portrait
       ?h
       :w;
      double hSize = size * heightSize;
      return Container(
        height: hSize,
        child: Column(children: <Widget>[
      Text(
        "Confirm Fingerprint to continue",
        style: TextStyle(
          fontSize: hSize/ 6,
        ),
      ),
       Text( _canCheckBiometrics ==true||_canCheckBiometrics ==null?
        "On":"OFF",
        style: TextStyle(
          fontSize: hSize/ 6,
        ),),
    ]));
    });
    
    
  }

  Widget buildFinger() {
     return ResponsiveBuilder(builder: (context, sI){
      double heightSize =
      sI.deviceScreenType == DeviceScreenType.Mobile
      ?0.4
      :sI.deviceScreenType == DeviceScreenType.Mobile
      ?0.5
      :0.5;
      
      double hSize = MediaQuery.of(context).size.height * heightSize;
      double radiusSize = hSize * 0.5;
    return Container(
      height: hSize,
      child:
     
      Expanded(
          child: CircleAvatar(
        radius: radiusSize,
        backgroundColor: _canCheckBiometrics ==true? Colors.black:Colors.blueGrey[900],
        child:new InkWell(
                        onTap:          _canCheckBiometrics ==true ||_canCheckBiometrics ==null?() {
                          Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()),
                  (Route<dynamic> route) => false);
                        }: (){},
                        child:
         _canCheckBiometrics ==true || _canCheckBiometrics ==null?
            //  CircleAvatar(
            //   radius: 100.0,
            //   backgroundColor: Colors.blueGrey[600],
            //   child:  RaisedButton(
            //             child: Text(_isAuthenticating ? 'Cancel' : 'Authenticate'),
            //             onPressed:
            //                 _isAuthenticating ? _cancelAuthentication : _authenticate,
            //           ),
            Image.asset(
                          'assets/image_fingerprint.png',
                          fit: BoxFit.contain,
                          
                          
                        ):
                           Icon(
          Icons.fingerprint,
          color: Colors.grey,
        ),
      )
      )
      ),
  
    )
    ;
    });
  }

  buildSecurityText3() {
    
    return ResponsiveBuilder(builder: (context,sI){
      double heightSize =
      sI.deviceScreenType == DeviceScreenType.Mobile
      ?0.05
      :sI.deviceScreenType == DeviceScreenType.Mobile
      ?0.07
      :0.1;
      double w = MediaQuery.of(context).size.width;
       double h = MediaQuery.of(context).size.height;
       double size = 
       sI.orientation == Orientation.portrait
       ?h
       :w;
      double hSize = size * heightSize;
        return Container(
          height: hSize,
                  child: Text(
          "Or just use Pin Number inserted",
          style: TextStyle(
            fontSize: hSize /3,
          ),
      ),
        );
    });
  }

  Widget buildTextField(String hintText) {
    return ResponsiveBuilder(builder: (context, sI){
      double heightSize =
      sI.deviceScreenType == DeviceScreenType.Mobile
      ?0.3
      :sI.deviceScreenType == DeviceScreenType.Tablet
      ?0.3
      :0.3;

      double widthSize =
      sI.deviceScreenType == DeviceScreenType.Mobile
      ?0.8
      :sI.deviceScreenType == DeviceScreenType.Tablet
      ?0.8
      :0.8;
      double hSize = MediaQuery.of(context).size.height * heightSize;
       double space = MediaQuery.of(context).size.height * 0.05;
      
      return Container(
        height: hSize,
      alignment: Alignment.center,
       child:Column(
         mainAxisAlignment : MainAxisAlignment.center,
         children: <Widget>[
          buildSecurityText3(),
          FractionallySizedBox(
            widthFactor: widthSize,
              child: TextField(
              
              decoration: InputDecoration(
                
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: hSize/10,
                ),
                prefixIcon:
                    hintText == "Email" ? Icon(Icons.person, size: hSize/8,) : Icon(Icons.lock,size: hSize/8),
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
          SizedBox(height: space),
          loginButton(),
        ]));
    });
  }

  Widget loginButton() {
    return ResponsiveBuilder(builder: (context, sI){
      double widthSize =
        sI.deviceScreenType == DeviceScreenType.Mobile
          ?0.55
          :sI.deviceScreenType == DeviceScreenType.Tablet
          ?0.5
          :0.4;
      
      double heightSize =
        sI.deviceScreenType == DeviceScreenType.Mobile
          ?0.05
          :sI.deviceScreenType == DeviceScreenType.Tablet
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
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            color: Colors.lightBlueAccent,
            child: Text('Login In',
            style: TextStyle(fontSize: hSize/2)),
          ),
              ),
      );
    });
  }
}
