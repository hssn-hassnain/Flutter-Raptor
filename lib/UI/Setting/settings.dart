import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Login/LoginPage.dart';
import 'package:privacee/UI/Setting/Support.dart';
import 'package:privacee/Services/themes.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';
import 'package:provider/provider.dart';
import 'package:privacee/UI/Setting/Profile.dart';
import 'package:privacee/UI/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // bool _light = true;
  SharedPreferences sharedPreferences;
  // _SettingState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      height: SizeConfig.heightMultiplier * 7,
                      minWidth: SizeConfig.widthMultiplier * 12.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(Icons.arrow_back,
                          size: SizeConfig.imageSizeMultiplier * 11.25),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        radius: SizeConfig.widthMultiplier * 12.5,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: SizedBox(
                            width: SizeConfig.widthMultiplier * 22.5,
                            height: SizeConfig.heightMultiplier * 13,
                            child: Image.asset('assets/Human.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 1.3),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'John',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: SizeConfig.widthMultiplier * 6.25),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
                  child: Column(
                    children: <Widget>[
                      Consumer<ThemeNotifier>(
                        builder: (context, notifier, child) => SwitchListTile(
                          secondary: Icon(Icons.brightness_2,
                              color: Colors.lightBlueAccent,
                              size: SizeConfig.imageSizeMultiplier * 6),
                          title: Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 4.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.widthMultiplier * 3.75),
                            child: Text(
                              'Enable Dark Theme',
                              style: TextStyle(
                                fontSize: SizeConfig.widthMultiplier * 3,
                              ),
                            ),
                          ),
                          onChanged: (val) {
                            notifier.toggleTheme();
                          },
                          value: notifier.darkTheme,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person_outline,
                          color: Colors.lightBlueAccent,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        title: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 3.75),
                          child: Text(
                            'Update your profile setting',
                            style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 3,
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.filter_vintage,
                          color: Colors.lightBlueAccent,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        title: Text(
                          'General',
                          style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 3.75),
                          child: Text(
                            'Backup, history & customize chat setting',
                            style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 3,
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        onTap: () {
                          // Navigator.push(

                          //   context,

                          //   MaterialPageRoute(

                          //     builder: (context) => ThemeSelectorPage(),

                          //   ),

                          // );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.help_outline,
                          color: Colors.lightBlueAccent,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        title: Text(
                          'Support',
                          style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 3.75),
                          child: Text(
                            'FAQ & Technical Issue',
                            style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 3,
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Support(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.public,
                          color: Colors.lightBlueAccent,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        title: Text(
                          'Language',
                          style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 3.75),
                          child: Text(
                            'Select application language',
                            style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 3,
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.power_settings_new,
                          color: Colors.lightBlueAccent,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 3.75),
                          child: Text(
                            'Logout this account',
                            style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 3,
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                        onTap: () {
                          sharedPreferences.clear();

                          // sharedPreferences.commit();

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginPage()),
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingLayout() {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return SafeArea(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    height: SizeConfig.heightMultiplier * 7,
                    minWidth: SizeConfig.widthMultiplier * 12.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Icon(Icons.arrow_back,
                        size: SizeConfig.imageSizeMultiplier * 11),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              top: SizeConfig.heightMultiplier * 4,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: SizedBox(
                            width: SizeConfig.widthMultiplier * 22.5,
                            height: SizeConfig.heightMultiplier * 13,
                            child: Image.asset('assets/Human.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 1.3),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'John',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: SizeConfig.widthMultiplier * 6.25),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ])
            ]),
            Positioned(
                top: SizeConfig.heightMultiplier * 26,
                child: Container(
                    child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text('Map'),
                    ),
                    ListTile(
                      leading: Icon(Icons.photo_album),
                      title: Text('Album'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone'),
                    ),
                  ],
                ))),
          ],
        ),
      );
    } else {
      return Center();
    }
  }
}
