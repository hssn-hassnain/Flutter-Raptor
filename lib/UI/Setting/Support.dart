import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';

class Support extends StatefulWidget {
  @override
  _Support createState() => _Support();
}

class _Support extends State<Support> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Support',
            style: TextStyle(fontSize: SizeConfig.widthMultiplier * 6.25),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            helpRow(),
            contactRow(),
          ],
        ),
      ),
    );
  }

  Widget helpRow() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: EdgeInsets.all(SizeConfig.widthMultiplier * 6.25),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'How can we help? ',
              style: TextStyle(
                fontSize: SizeConfig.widthMultiplier * 6.25,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 7),
            GestureDetector(
              onTap: () {},
              child: Text('How it work ?',
                  style: TextStyle(
                    fontSize: SizeConfig.widthMultiplier * 4,
                    color: Colors.grey[700],
                  )),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            GestureDetector(
              onTap: () {},
              child: Text('How do i make call in Privacy ?',
                  style: TextStyle(
                    fontSize: SizeConfig.widthMultiplier * 4,
                    color: Colors.grey[700],
                  )),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            GestureDetector(
              onTap: () {},
              child: Text('Why use Privacy ?',
                  style: TextStyle(
                    fontSize: SizeConfig.widthMultiplier * 4,
                    color: Colors.grey[700],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget contactRow() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: EdgeInsets.fromLTRB(SizeConfig.widthMultiplier * 6.25, 0,
          SizeConfig.widthMultiplier * 6.25, 0),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: SizeConfig.widthMultiplier * 6,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 4),
            GestureDetector(
              onTap: () {},
              child: Text('Privacy@gmail.com',
                  style: TextStyle(
                    fontSize: SizeConfig.widthMultiplier * 4,
                    color: Colors.grey[700],
                  )),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            GestureDetector(
              onTap: () {},
              child: Text('+603 92865874',
                  style: TextStyle(
                    fontSize: SizeConfig.widthMultiplier * 4,
                    color: Colors.grey[700],
                  )),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            GestureDetector(
              onTap: () {},
              child: Text('Monday - Sunday 10am - 8pm',
                  style: TextStyle(
                    fontSize: SizeConfig.widthMultiplier * 4,
                    color: Colors.grey[700],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
