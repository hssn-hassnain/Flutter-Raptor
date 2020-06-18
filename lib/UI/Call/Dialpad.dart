import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/responsive/responsive_builder.dart';
import 'calllog.dart';

class Dialpad extends StatefulWidget {
  @override
  _DialpadState createState() => _DialpadState();
}

class _DialpadState extends State<Dialpad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String phoneNumber = " ";
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: '');
  }

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
          Wrap(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 3),
                child: FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: SizeConfig.imageSizeMultiplier * 6,
                    ),
                    label: Text(
                      'Add to a contact',
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: SizeConfig.textMultiplier * 2),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 3),
                child: FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.person,
                        size: SizeConfig.imageSizeMultiplier * 6),
                    label: Text(
                      'Update a existing contact',
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: SizeConfig.textMultiplier * 2),
                    )),
              ),
            ],
          ),
          buildNumberPad(),
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
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => new CallLogs(),
              ),
            );
          },
          height: SizeConfig.heightMultiplier * 7.35,
          minWidth: SizeConfig.widthMultiplier * 12.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Icon(Icons.arrow_back,
              size: SizeConfig.imageSizeMultiplier * 11.25),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: SizedBox(
                  width: SizeConfig.widthMultiplier * 11.25,
                  height: SizeConfig.heightMultiplier * 6.6,
                  child: Image.asset('images/Asset3.png'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildNumberPad() {
    var orientation = MediaQuery.of(context).orientation;
    double numFontSize = 0;
    double textFontSize = 0;
    double width = 0;
    double height = 0;
    double padding = 0;

    if (orientation == Orientation.portrait) {
      numFontSize = 3.82;
      textFontSize = 1.5;
      width = 15;
      height = 8.8;
      padding = 1.17;
    } else {
      numFontSize = 2.8;
      textFontSize = 1;
      width = 12;
      height = 6.5;
      padding = 0.6;
    }

    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: SizeConfig.heightMultiplier * height,
              child: new TextField(
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: SizeConfig.textMultiplier * numFontSize,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                enabled: false,
                controller: _controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeybordNumber(
                  n: 1,
                  m: '',
                  onPressed: () {
                    _controller.text = _controller.text + "1";
                  },
                ),
                KeybordNumber(
                  n: 2,
                  m: 'ABC',
                  onPressed: () {
                    _controller.text = _controller.text + "2";
                  },
                ),
                KeybordNumber(
                  n: 3,
                  m: 'DEF',
                  onPressed: () {
                    _controller.text = _controller.text + "3";
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeybordNumber(
                  n: 4,
                  m: 'GHI',
                  onPressed: () {
                    _controller.text = _controller.text + "4";
                  },
                ),
                KeybordNumber(
                  n: 5,
                  m: 'JKL',
                  onPressed: () {
                    _controller.text = _controller.text + "5";
                  },
                ),
                KeybordNumber(
                  n: 6,
                  m: 'MNO',
                  onPressed: () {
                    _controller.text = _controller.text + "6";
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeybordNumber(
                  n: 7,
                  m: 'PQRS',
                  onPressed: () {
                    _controller.text = _controller.text + "7";
                  },
                ),
                KeybordNumber(
                  n: 8,
                  m: 'TUV',
                  onPressed: () {
                    _controller.text = _controller.text + "8";
                  },
                ),
                KeybordNumber(
                  n: 9,
                  m: 'WXYZ',
                  onPressed: () {
                    _controller.text = _controller.text + "9";
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: SizeConfig.widthMultiplier * width,
                  child: MaterialButton(
                    height: SizeConfig.heightMultiplier * height,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    onPressed: () {
                      _controller.text = _controller.text + "*";
                    },
                    child: Text(
                      '*',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: SizeConfig.textMultiplier * 3.82),
                    ),
                  ),
                ),
                KeybordNumber(
                  n: 0,
                  m: '',
                  onPressed: () {
                    _controller.text = _controller.text + "0";
                  },
                ),
                Container(
                  width: SizeConfig.widthMultiplier * width,
                  child: MaterialButton(
                    height: SizeConfig.heightMultiplier * height,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    onPressed: () {
                      _controller.text = _controller.text + "#";
                    },
                    child: Text(
                      '#',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: SizeConfig.textMultiplier * 3.82),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: SizeConfig.widthMultiplier * width,
                  child: MaterialButton(
                    height: SizeConfig.heightMultiplier * height,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.dialpad,
                      color: Colors.lightBlueAccent,
                      size: SizeConfig.imageSizeMultiplier * 6,
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.widthMultiplier * width,
                  height: SizeConfig.heightMultiplier * height,
                  child: FloatingActionButton(
                    onPressed: () {},
                    elevation: 20.0,
                    mini: false,
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                      size: SizeConfig.imageSizeMultiplier * 6,
                    ),
                    backgroundColor: Colors.greenAccent[400],
                  ),
                ),
                Container(
                  width: SizeConfig.widthMultiplier * 15,
                  child: MaterialButton(
                    height: SizeConfig.heightMultiplier * 8.8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    onPressed: () {
                      int l = _controller.text.length;
                      if (l != 0) {
                        _controller.text = _controller.text.substring(0, l - 1);
                      }
                    },
                    child: Icon(
                      Icons.backspace,
                      color: Colors.lightBlueAccent,
                      size: SizeConfig.imageSizeMultiplier * 6,
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }

  buildSecurityText() {
    return Text(
      "Enter PIN",
      style: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: SizeConfig.textMultiplier * 3,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  PINNumber({this.textEditingController, this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.widthMultiplier * 5,
      height: SizeConfig.heightMultiplier * 3.65,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.7),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.lightBlueAccent,
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.textMultiplier * 2.2,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: SizeConfig.widthMultiplier * 0.25,
              color: Colors.lightBlueAccent),
        ),
      ),
    );
  }
}

class KeybordNumber extends StatelessWidget {
  final int n;
  final String m;
  final Function() onPressed;
  KeybordNumber({this.n, this.m, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double numFontSize = 0;
    double textFontSize = 0;
    double width = 0;
    double height = 0;
    double padding = 0;

    if (orientation == Orientation.portrait) {
      numFontSize = 3.82;
      textFontSize = 1.5;
      width = 15;
      height = 8.8;
      padding = 1.17;
    } else {
      numFontSize = 2.8;
      textFontSize = 1;
      width = 12;
      height = 6.5;
      padding = 0.6;
    }

    return Container(
      width: SizeConfig.widthMultiplier * width,
      height: SizeConfig.heightMultiplier * height,
      // decoration: BoxDecoration(
      //   shape: BoxShape.rectangle,
      //   color: Colors.purpleAccent.withOpacity(0.1),
      // ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(SizeConfig.heightMultiplier * padding),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: SizeConfig.heightMultiplier * 13.2,
        child: Column(
          children: <Widget>[
            Text(
              "$n",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * numFontSize,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$m",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * textFontSize,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
