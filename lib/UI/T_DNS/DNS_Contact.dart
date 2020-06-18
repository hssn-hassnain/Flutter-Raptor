import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';

class DNSContact extends StatefulWidget {
  @override
  _DNSContact createState() => _DNSContact();
}

class _DNSContact extends State<DNSContact> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) => Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                profilePic(),
                SizedBox(height: SizeConfig.heightMultiplier * 2.5),
                info(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            height: SizeConfig.heightMultiplier * 11.5,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () => {},
                    child: Container(
                      height: SizeConfig.heightMultiplier * 12.5,
                      child: Tab(
                        child: Text(
                          'Phone',
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2.2),
                        ),
                        icon: Icon(Icons.phone,
                            size: SizeConfig.imageSizeMultiplier * 8.5,
                            color: Colors.green),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () => {},
                    child: Container(
                      height: SizeConfig.heightMultiplier * 12.5,
                      child: Tab(
                        child: Text(
                          "Video Call",
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2.2),
                        ),
                        icon: Icon(Icons.videocam,
                            size: SizeConfig.imageSizeMultiplier * 8.5,
                            color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () => {},
                    child: Container(
                      height: SizeConfig.heightMultiplier * 12.5,
                      child: Tab(
                        child: Text(
                          "Message",
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2.2),
                        ),
                        icon: Icon(Icons.chat_bubble,
                            size: SizeConfig.imageSizeMultiplier * 8.5,
                            color: Colors.greenAccent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profilePic() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        color: const Color(0xFF212121).withOpacity(0.5),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.widthMultiplier * 3),
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      height: SizeConfig.heightMultiplier * 11,
                      minWidth: SizeConfig.widthMultiplier * 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(Icons.arrow_back,
                          size: SizeConfig.widthMultiplier * 10),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 2.5),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 11,
                          height: SizeConfig.heightMultiplier * 6.5,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              width: SizeConfig.widthMultiplier * 11,
                              height: SizeConfig.heightMultiplier * 6.5,
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: Image.asset('images/Asset 3.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(children: <Widget>[
                Container(
                  width: SizeConfig.widthMultiplier * 22.5,
                  height: SizeConfig.heightMultiplier * 13,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset('images/Asset 3.png'),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1.3),
                Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '+hp.Adam.my',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: SizeConfig.widthMultiplier * 4),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ]),
              SizedBox(height: SizeConfig.heightMultiplier * 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget info() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.25),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Container(
                    width: SizeConfig.widthMultiplier * 11.5,
                    height: SizeConfig.widthMultiplier * 11.5,
                    child: SizedBox(
                      width: SizeConfig.widthMultiplier * 11.5,
                      height: SizeConfig.widthMultiplier * 11.5,
                      child: CircleAvatar(
                        radius: SizeConfig.imageSizeMultiplier * 8.75,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset('images/Asset 3.png'),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    '+6012-3456789',
                    style: TextStyle(
                      fontSize: SizeConfig.widthMultiplier * 4.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  subtitle: Text(
                    'Mobile',
                    style:
                        TextStyle(fontSize: SizeConfig.widthMultiplier * 3.5),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
