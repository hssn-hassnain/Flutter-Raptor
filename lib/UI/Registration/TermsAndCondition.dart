import 'package:flutter/material.dart';
import 'package:privacee/Services/themes.dart';
import 'package:privacee/UI/Registration/IndividualAccount.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';

class TermAndCondition extends StatefulWidget {
  // final ThemeBloc themeBloc;

  // TermAndCondition({Key key, this.themeBloc}) : super(key: key);
  @override
  _TermAndCondition createState() => _TermAndCondition();
}

class _TermAndCondition extends State<TermAndCondition> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: termCon(),
      ),
    );
  }

  Widget termCon() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = MediaQuery.of(context).size.height;
      double titleSzie = height * 0.6;
      double textSize = height * 0.4;
      double widthSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 0.9
              : sizingInformation.deviceScreenType == DeviceScreenType.Tablet
                  ? 0.8
                  : 0.75;

      return ListView(
        // scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: FractionallySizedBox(
              widthFactor: widthSize,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      border: Border(
                        top: BorderSide(
                            width: 5.0, color: Colors.lightBlueAccent),
                        left: BorderSide(
                            width: 5.0, color: Colors.lightBlueAccent),
                        right: BorderSide(
                            width: 5.0, color: Colors.lightBlueAccent),
                        bottom: BorderSide(
                            width: 5.0, color: Colors.lightBlueAccent),
                      ),
                    ),
                    child: detailCondition(),
                  )
                ],
              ),
            ),
          ),
          agreeOrDisagreeButton(),
        ],
      );
    });
  }

  Widget detailCondition() {
    return ResponsiveBuilder(builder: (context, sI) {
      double height = MediaQuery.of(context).size.height;
      double hSize = height * 0.07;
      double textHSize = height * 0.1;

      return Wrap(
        runSpacing: 20,
        children: <Widget>[
          Center(
            child: Container(
              height: hSize,
              child: Text(
                //text of welcome
                'Terms and Conditions',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: hSize / 2,
                  decoration: TextDecoration.underline,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
            child: ListView(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text.rich(
                      TextSpan(
                        text:
                            'I here by acknowledge and agree to the followings:\n',
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  '\n1. The application came As is condition.This is no gurantee to the application performance.\n'),
                          TextSpan(
                              text:
                                  '\n2. The application will extract device information to assist in preventing SIM hijacking.\n'),
                          TextSpan(
                              text:
                                  '\n2. The application will extract device information to assist in preventing SIM hijacking.\n'),
                          TextSpan(
                              text:
                                  '\n2. The application will extract device information to assist in preventing SIM hijacking.\n'),
                        ],
                      ),
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: textHSize / 4,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget agreeOrDisagreeButton() {
    return ResponsiveBuilder(builder: (context, sI) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      double wSize = sI.deviceScreenType == DeviceScreenType.Mobile
          ? width * 0.35
          : sI.deviceScreenType == DeviceScreenType.Tablet
              ? width * 0.4
              : width * 0.4;

      double hSize = height * 0.05;

      return Column(
        children: <Widget>[
          Container(
            height: hSize,
            width: wSize,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Individualac()));
              },
              child: Text('I Agree', style: TextStyle(fontSize: hSize/2)),
              color: Theme.of(context).buttonColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
              height: hSize,
              width: wSize,
              child: MaterialButton(
              onPressed: () {
                print('I Disagree');
              },
              child: Text('I Disagree',style: TextStyle(fontSize: hSize/2)),
              color: Theme.of(context).buttonColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        ],
      );
    });
  }
}
