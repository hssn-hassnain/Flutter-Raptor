import 'package:flutter/material.dart';
import 'package:privacee/UI/Login/ResetPassword2.dart';
import 'package:privacee/UI/Login/AccountRecovery.dart';
import 'package:privacee/responsive/responsive_builder.dart';
import 'package:privacee/enums/device_screen_type.dart';


class VerificationEmail extends StatefulWidget {
  @override
  _VerificationEmailState createState() => _VerificationEmailState();
}

class _VerificationEmailState extends State<VerificationEmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     colors: <Color>[
          //       Colors.deepPurpleAccent,
          //       Colors.deepPurple,
          //     ],
          //   ),
          // ),
          child: OtpScreen(),
        ),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<String> currentPin = ["", "", "", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.transparent),
  );

  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          buildExitButton(),
          Expanded(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildSecurityText(),
                  buildSecurityText2(),
                  buildSecurityText3(),
                  SizedBox(height: 40.0),
                  buildPinRow(),
                  buildNumberPad(),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        
         
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => Organizationac()));
                   MaterialPageRoute(builder: (context) => ChangePassword()));
            },
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(Icons.arrow_back, size: 45.0),
          ),
      
      ],
    );
  }

  buildNumberPad() {
    return Expanded(
      child: Container(
    
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeybordNumber(
                      n: 1,
                      onPressed: () {
                        pinIndexSetup("1");
                      },
                    ),
                    KeybordNumber(
                      n: 2,
                      onPressed: () {
                        pinIndexSetup("2");
                      },
                    ),
                    KeybordNumber(
                      n: 3,
                      onPressed: () {
                        pinIndexSetup("3");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeybordNumber(
                      n: 4,
                      onPressed: () {
                        pinIndexSetup("4");
                      },
                    ),
                    KeybordNumber(
                      n: 5,
                      onPressed: () {
                        pinIndexSetup("5");
                      },
                    ),
                    KeybordNumber(
                      n: 6,
                      onPressed: () {
                        // pinIndexSetup("6");
                        Navigator.push(
              context, MaterialPageRoute(builder: (context) => RecoverPage()));
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeybordNumber(
                      n: 7,
                      onPressed: () {
                        pinIndexSetup("7");
                      },
                    ),
                    KeybordNumber(
                      n: 8,
                      onPressed: () {
                        pinIndexSetup("8");
                      },
                    ),
                    KeybordNumber(
                      n: 9,
                      onPressed: () {
                        pinIndexSetup("9");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      child: MaterialButton(
                        onPressed: null,
                        child: SizedBox(),
                      ),
                    ),
                    KeybordNumber(
                      n: 0,
                      onPressed: () {
                        pinIndexSetup("0");
                      },
                    ),
                    Container(
                      width: 60.0,
                      child: MaterialButton(
                        height: 60.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        onPressed: () {
                          cleanPin();
                        },
                        child: cleanIcon()
                      ),
                    ),
                  ],
                ),
              ]),
        )
      );
   
  }

  Widget cleanIcon(){
    return ResponsiveBuilder(builder: (context, sI){
      double widthSize = MediaQuery.of(context).size.width * 0.1;
      double h = MediaQuery.of(context).size.height;
      double heightSize =
        sI.deviceScreenType == DeviceScreenType.Mobile
        ?h *0.08
        :sI.deviceScreenType == DeviceScreenType.Tablet
        ?h * 0.1
        :h * 0.1;

      return Container(
        height: heightSize,
        width: widthSize,
              child: Icon(
                            Icons.backspace,
                            color: Colors.lightBlueAccent,
                            size: heightSize /2
                          ),
      );
    });
  }
  buildSecurityText() {
    return ResponsiveBuilder(builder:(context, sI){
      double h = MediaQuery.of(context).size.height;
      double heightSize = 
      sI.deviceScreenType == DeviceScreenType.Mobile
        ?h * 0.1
        :sI.deviceScreenType == DeviceScreenType.Tablet
        ?h* 0.1
        :h * 0.12;

      return Container(
        height: heightSize,
        child: Text(
        "Verification Code",
        style: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: heightSize/2,
          fontWeight: FontWeight.bold,
        ),
    ),
      );
    });
  }

  buildSecurityText2() {
  return ResponsiveBuilder(builder:(context, sI){
      double h = MediaQuery.of(context).size.height;
      double heightSize = 
      sI.deviceScreenType == DeviceScreenType.Mobile
        ?h * 0.03
        :sI.deviceScreenType == DeviceScreenType.Tablet
        ?h* 0.03
        :h * 0.04;  
  return Container(
    height: heightSize,
      child: Text(
        "Please type the verification code sent to",
        style: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: heightSize/ 1.5,
        ),
      ),
  );
  });
  }

  buildSecurityText3() {
    return ResponsiveBuilder(builder:(context, sI){
      double h = MediaQuery.of(context).size.height;
      double heightSize = 
      sI.deviceScreenType == DeviceScreenType.Mobile
        ?h * 0.03
        :sI.deviceScreenType == DeviceScreenType.Tablet
        ?h* 0.03
        :h * 0.04; 
    return Container(
      height: heightSize,
          child: Text(
        "User@gmail.com",
        style: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: heightSize/ 1.5,
        ),
      ),
    );
    });
  }

  cleanPin() {
    if (pinIndex == 0)
      pinIndex = 0;
    else if (pinIndex == 6) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0)
      pinIndex = 1;
    else if (pinIndex < 6) pinIndex++;
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 6) print(strPin);
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
      case 5:
        pinFiveController.text = text;
        break;
      case 6:
        pinSixController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinOneController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinTwoController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThreeController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFiveController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinSixController,
        ),
      ],
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  PINNumber({this.textEditingController, this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sI){
      
      double widthSize = MediaQuery.of(context).size.width * 0.1;
      double h = MediaQuery.of(context).size.height;
      double heightSize =
        sI.deviceScreenType == DeviceScreenType.Mobile
        ?h *0.08
        :sI.deviceScreenType == DeviceScreenType.Tablet
        ?h * 0.1
        :h * 0.1;

      return Container(
        height : heightSize,
      width: widthSize,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(

        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: heightSize/ 2,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.lightBlueAccent),
        ),
      ),
    );
    });
  }
}

class KeybordNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  KeybordNumber({this.n, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sI){
      double widthSize = MediaQuery.of(context).size.width * 0.1;
      double h = MediaQuery.of(context).size.height;
      double heightSize =
        sI.deviceScreenType == DeviceScreenType.Mobile
        ?h *0.08
        :sI.deviceScreenType == DeviceScreenType.Tablet
        ?h * 0.1
        :h * 0.1;
      return Container(
      width: widthSize,
      height: heightSize,
      // decoration: BoxDecoration(
      //   shape: BoxShape.rectangle,
      //   color: Colors.purpleAccent.withOpacity(0.1),
      // ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: heightSize /2,
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    });
  }
}