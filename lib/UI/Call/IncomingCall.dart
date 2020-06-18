import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
class IncomingCall extends StatefulWidget {
  @override
  _IncomingCallState createState() => _IncomingCallState();
}

class _IncomingCallState extends State<IncomingCall> {
  String dropdownValue = 'One';
  final GlobalKey _menuKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: SizeConfig.heightMultiplier * 8.5),
              Text(
                'Incoming Call',
                style: TextStyle(color: Colors.white60, fontSize: SizeConfig.widthMultiplier * 4.4),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 11.5),
              CircleAvatar(
                radius: 75.0,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: SizedBox(
                    width: SizeConfig.widthMultiplier * 36,
                    height: SizeConfig.heightMultiplier * 21,
                    child: Image.asset('images/Asset 3.png'),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2.5),
              Text(
                'Alex CT Lee',
                style: TextStyle(color: Colors.white, fontSize: SizeConfig.widthMultiplier * 5),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1.3),
              Text(
                '+6012-364 6867',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: SizeConfig.widthMultiplier * 2.5),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 13),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {},
                    elevation: 20.0,
                    mini: false,
                    child: Icon(
                      Icons.call_end,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(width: SizeConfig.widthMultiplier * 5),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: SizedBox(
                        width: SizeConfig.widthMultiplier * 11,
                        height: SizeConfig.heightMultiplier * 6.5,
                        child: Image.asset('images/Asset 3.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.widthMultiplier * 5),
                  FloatingActionButton(
                    onPressed: () {},
                    elevation: 20.0,
                    mini: false,
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.greenAccent[400],
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: PopupMenuButton(
                      key: _menuKey,
                      child: Text('Reject with message'),
                      itemBuilder: (_) => <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                                child:
                                    const Text('I am busy ill call you late')),
                            new PopupMenuItem<String>(
                                child: const Text(
                                    'I am away now, we will talk later')),
                            new PopupMenuItem<String>(
                                child: const Text(
                                    'I am in meeting, We can talk in Message')),
                            new PopupMenuItem<String>(
                                child: const Text(
                                    'I am in Emergency now,cannot talk now')),
                          ],
                      onSelected: (_) {}),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
