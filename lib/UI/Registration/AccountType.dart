import 'package:flutter/material.dart';
import 'package:privacee/UI/Registration/OrganizationAccount.dart';
import 'package:privacee/Services/themes.dart';
import 'package:privacee/UI/Registration/TermsAndCondition.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';


class RegistrationScreen extends StatefulWidget {
  // final ThemeBloc themeBloc;

  // RegistrationScreen({Key key, this.themeBloc}) : super(key: key);

  @override
  _RegistrationScreen createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  int b;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: layoutAccountType(),
        ),
      ),
    );
  }

  Widget radioButton() {
    return ResponsiveBuilder(builder: (context, sizingInformation){

      double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        
    
        double hSize = height * 0.1;
        double titleSize = height * 0.06;
        double textSize = height * 0.04;

        double space = height * 0.01;

        return Column(
      children: <Widget>[
        Container(
            height: hSize,
            child: RadioListTile(
            
            value: 1,
            
            groupValue: b,
            title: Text(
              'Individual Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleSize/2),
            ),
            subtitle: Text(
              'Telephony Dns Cyber Security System For Individual Use',
              style: TextStyle(color: Colors.grey, fontSize: textSize/2),
            ),
            onChanged: (v) {
              f1(v);
            },
            activeColor: Colors.white,
            selected: true,
          ),
        ),
     
        Container(
            height: hSize,
            child: RadioListTile(
            value: 2,
            groupValue: b,
            title: Text(
              'Organization Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleSize/2),
            ),
            subtitle: Text(
              'Telephony Dns Cyber Security System For Organization Use',
              style: TextStyle(color: Colors.grey, fontSize:textSize/2),
            ),
            onChanged: (v) {
              f1(v);
            },
            activeColor: Colors.white,
            selected: true,
          ),
        ),
      ],
    );

    });
  }

  void f1(int a) {
    setState(() {
      b = a;
    });
  }

  void f2() {
    setState(() {
      if (b == 1)
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TermAndCondition()));
      else if (b == 2)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Organizationac()));
    });
  }

  Widget raiseButton() {
    
    return ResponsiveBuilder(builder: (context, sizingInformation){
      double widthSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ?0.5
              :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
              ?0.4
              :0.4;

      double heightSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ?0.05
              :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
              ?0.06
              :0.07;

      double textSize = MediaQuery.of(context).size.height * heightSize /2;
      
      return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * heightSize,
        child: FractionallySizedBox(
                    widthFactor: widthSize,
                    child: MaterialButton(
                    onPressed: () {
                      f2();
                    },
                    child: Text('NEXT',
                    style: TextStyle(fontSize: textSize),),
                    color: Theme.of(context).buttonColor,
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
    );

    });
  }

  Widget selection(){
      return ResponsiveBuilder(builder: (context, sizingInformation){
          double fracSize = 
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ?0.9
            :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
            ?0.75
            :0.4;           
        
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        double size = 
        sizingInformation.orientation == Orientation.portrait
        ?height
        :width;

        double hSize = size * 0.4;

        double space = width * 0.01;
          return FractionallySizedBox(
            widthFactor: fracSize,
  
            child: Container(
              height: hSize,
              
                    decoration: new BoxDecoration(
                    color: const Color(0xFF212121).withOpacity(0.5),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25),
                      topRight: const Radius.circular(25),
                      bottomRight: const Radius.circular(25),
                      bottomLeft: const Radius.circular(25),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                  children: <Widget>[
                    
                        
                    radioButton(),
                    SizedBox(height: space),
                    raiseButton(),
                   
                
                  ],
                ),
                )
          );

      });

  }



Widget layoutAccountType(){
    
    return ResponsiveBuilder(builder: (context, sizingInformation){
        double fracSize = 
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ?0.65
            :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
            ?0.65
            :0.4;           
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        double size = 
          sizingInformation.orientation == Orientation.portrait
            ?width
            :height;
        double hSize = height * 0.4;
        double titleSize = size * 0.08;
        double textSize = size * 0.05;

        double space = height * 0.01;

        return Column(
          //move all the thing to center
 
          children: <Widget>[
            Flexible(
              flex:4,
              child: Container(
                alignment: Alignment.center,
                child: Logo())),
            
            Flexible(
                flex: 6,
                child: Column(
                  children: <Widget>[
                  FractionallySizedBox(
                  widthFactor: fracSize,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     
                     Text(
                          'Get Private Today',
                          style: TextStyle(
                              
                              fontFamily: 'Source Sans Pro',
                              fontSize: titleSize/1.2,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent),
                        ),
                      
                      Container(
                        height: textSize,
                        child: Text(
                          'Creator of Telephony DNS for Cyber Security System',
                          style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: textSize/2.0,
                            letterSpacing: 0.5,
                            color: Colors.lightBlueAccent,
                  ),
              ),
                      ),
                     
                      
                    ],
                    ),
              ),
              Container(
                  height: hSize,
                  alignment: Alignment.center,
                  child: selection()
                  ),
            
                ],
                ),
            ),
             
          ],
        );
    });

}

}
class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ResponsiveBuilder(builder: (context, sizingInformation){
      
      double heightSize =
      sizingInformation.deviceScreenType == DeviceScreenType.Mobile
          ?0.2
          :sizingInformation.deviceScreenType == DeviceScreenType.Tablet
          ?0.25
          :0.3;

      return SizedBox(
      height: MediaQuery.of(context).size.height * heightSize,
      child:Image.asset(
          'assets/Logo.png',
          fit: BoxFit.fitHeight,
        ),
   
    );

    });

    
  }
}
