import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Setting/settings.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';

import '../../SizeConfig.dart';

class TDNSSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateTDNSSearch();
  }
}

class StateTDNSSearch extends State<TDNSSearch> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
          child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            Expanded(
              child: _TitleBar(),
            ),
            Expanded(
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: Expanded(child: Stack(children: <Widget>[]))),
            )
          ]),
        ),
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        height: SizeConfig.heightMultiplier * 10.5,
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.heightMultiplier * 1.5, bottom: 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 7.5),
                    child: Container(
                      child: Text(
                        "T-DNS SEARCH",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.widthMultiplier * 5,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: SizeConfig.widthMultiplier * 3.75),
                    child: Container(
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Setting(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/Human.png',
                          fit: BoxFit.contain,
                          width: SizeConfig.widthMultiplier * 11,
                          height: SizeConfig.heightMultiplier * 6.5,
                        ),
                        //             decoration: new BoxDecoration(
                        //               color: Colors.transparent, // border color
                        //               shape: BoxShape.circle,
                        //             )),
                      ),
                      decoration: new BoxDecoration(
                        color: Colors.white, // border color
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1.3),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 0.75),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            child: IconButton(
                                icon: new Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: SizeConfig.imageSizeMultiplier * 5,
                                ),
                                onPressed: null),
                          ),
                          Flexible(
                            child: new Container(
                                height: SizeConfig.heightMultiplier * 5,
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(
                                        SizeConfig.widthMultiplier * 2.5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          bottomLeft: Radius.circular(40)),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.widthMultiplier * 4),
                                    hintText: 'example@mail.com',
                                  ),
                                )),
                          ),
                          new GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        backgroundColor: Colors.grey[900],
                                        content: Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              ListTile(
                                                title: Text(
                                                  'Telephone',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .widthMultiplier *
                                                          4.5,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                                onTap: () {},
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Mobile Phone',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .widthMultiplier *
                                                          4.5,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                                onTap: () {},
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Domain Name',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .widthMultiplier *
                                                          4.5,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                                onTap: () {},
                                              ),
                                            ],
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0)));
                                  });
                            },
                            child: new Container(
                                height: SizeConfig.heightMultiplier * 5,
                                width: SizeConfig.widthMultiplier * 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      // filled: true,
                                      // contentPadding: EdgeInsets.all(15.0),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(40),
                                        topRight: Radius.circular(40),
                                      ),
                                      border: Border.all(
                                          width: 0,
                                          color: Colors.green,
                                          style: BorderStyle.solid)
                                      // borderRadius:
                                      //     BorderRadius.circular(25.0)
                                      ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Text("T-DNS", style: TextStyle(fontSize:SizeConfig.widthMultiplier * 4),),
                                      Icon(
                                        Icons.search,
                                        size:
                                            SizeConfig.imageSizeMultiplier * 5,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
