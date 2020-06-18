import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Contact/ContactListPage.dart';
import 'package:privacee/UI/Setting/settings.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';
import 'package:privacee/UI/Contact/Addnewcontact.dart';

class ContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateContactPage();
  }
}

class StateContactPage extends State<ContactPage>
    with AutomaticKeepAliveClientMixin<ContactPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
          child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            _titleBar(),
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Expanded(
                child: ContactListPage(),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  /// contacts items

  _titleBar() {
    return Container(
        height: SizeConfig.heightMultiplier * 17.5,
        child: Padding(
          padding:
              EdgeInsets.only(top: SizeConfig.heightMultiplier * 1.5, bottom: 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.widthMultiplier * 7.5),
                    child: Container(
                      child: Text(
                        "Contact",
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
                        right: SizeConfig.widthMultiplier * 3.7),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 6),
                      child: Container(
                          height: SizeConfig.heightMultiplier * 5,
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search,size: SizeConfig.imageSizeMultiplier * 5),
                                contentPadding: EdgeInsets.all(
                                    SizeConfig.widthMultiplier * 0.5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                                hintStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.widthMultiplier * 4),
                                hintText: 'Search by name and number'),
                          )),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNewContact()));
                    },
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.person_add,
                      size: SizeConfig.imageSizeMultiplier * 5,
                    ),
                    padding:
                        EdgeInsets.all(SizeConfig.widthMultiplier * 1.25),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
