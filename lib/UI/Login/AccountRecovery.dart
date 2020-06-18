import 'package:flutter/material.dart';
import 'AppLock.dart';
import 'package:privacee/responsive/responsive_builder.dart';
import 'package:privacee/enums/device_screen_type.dart';

class RecoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: SafeArea(
              child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildSecurityText(),
                SizedBox(height: 10.0),
                buildSecurityText2(),
                SizedBox(height: 50.0),
                buildFinger(),
              ],
            ),
          ),
          bottomNavigationBar: DoneIcon(),
        ),
      ),
    );
  }


  
  buildSecurityText() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      
      double heightSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? MediaQuery.of(context).size.height * 0.03
              : MediaQuery.of(context).size.height * 0.04;

      return Container(
        height: heightSize,
        child: Text(
          "Account Recovered?",
          style: TextStyle(
            fontSize: heightSize / 1.2,
          ),
        ),
      );
    });
  }

  buildSecurityText2() {
    return ResponsiveBuilder(builder: (context, sI) {
      double heightSize = sI.deviceScreenType == DeviceScreenType.Mobile
          ? MediaQuery.of(context).size.height * 0.03
          : MediaQuery.of(context).size.height * 0.04;

      return Container(
        height: heightSize,
        child: Text(
          "Redirecting to Login",
          style: TextStyle(
            fontSize: heightSize/1.2,
          ),
        ),
      );
    });
  }

  buildFinger() {
    return ResponsiveBuilder(builder: (context, sI){
      double heightSize = sI.deviceScreenType == DeviceScreenType.Mobile
          ? MediaQuery.of(context).size.height * 0.3
          : MediaQuery.of(context).size.height * 0.4;

      double widthSize = sI.deviceScreenType == DeviceScreenType.Mobile
          ?0.6
          :sI.deviceScreenType == DeviceScreenType.Tablet
          ?0.6
          :0.4;

      return Container(
            alignment: Alignment.center,
            height: heightSize,
          child :FractionallySizedBox(
          widthFactor: widthSize,
          child: Icon(
        Icons.check_circle_outline,
        size: heightSize,
        color: Colors.greenAccent[400],
      ),
          ),
    );
    });
  }
}

class DoneIcon extends StatelessWidget {
  const DoneIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double hSize = height * 0.1;
    return BottomAppBar(
          child: Container(
            height: hSize,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Finger()));
              },
              child: Center(
                  child: Text('Done',
                      style: TextStyle(
                        fontSize: hSize/2,
                      ))),
            ),
          ),
          color: Colors.greenAccent[400],
        );
  }
}