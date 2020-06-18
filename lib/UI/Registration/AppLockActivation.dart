import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Registration/OTP.dart';
import 'package:privacee/UI/Registration/AccountType.dart';
import 'package:privacee/responsive/responsive_builder.dart';

class ActiveLock extends StatefulWidget {
  @override
  _ActiveLockState createState() => _ActiveLockState();
}

class _ActiveLockState extends State<ActiveLock> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sI){
    SizeConfig().init(context);
     double height = MediaQuery.of(context).size.height;
       double width = MediaQuery.of(context).size.width;
       double size = 
          sI.orientation == Orientation.portrait
          ?width
          :height;
       double overallSize = size * 0.5;
       double sizing = size * 0.2;
       double titleSize = sizing * 0.3;
       double textSize = sizing *0.2;
       double space = sizing * 0.1;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Logo(),
              ),
              SizedBox(height: space),
              Column(
                children: <Widget>[
                   Text(
                'Activate App Lock?',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: titleSize,
                ),
              ),
              Text(
                'New Phone Number',
                style: TextStyle(
                  fontSize: textSize,
                ),
              ),
                ],
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 5),
              Container(
                width: width * 0.55,
                     child: MaterialButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                      minWidth: SizeConfig.safeBlockVertical * 50,
                      height: SizeConfig.safeBlockVertical * 5,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Pin(),
                          ),
                        );
                      },
                      color: Colors.lightBlueAccent,
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                    ),
              ),
           SizedBox(height: SizeConfig.safeBlockVertical * 6),      
           Container(
             width: width * 0.55,
                        child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      minWidth: SizeConfig.safeBlockVertical * 50,
   
                      height: SizeConfig.safeBlockVertical * 5,
                      onPressed: () {},
                      color: Colors.lightBlueAccent,
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                    ),
           ),
           
            ],
          ),
        ),
      ),
    );
    });
  }
}


