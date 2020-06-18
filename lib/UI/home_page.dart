import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Call/calllog.dart';
import 'package:privacee/UI/Contact/Contact_page.dart';
import 'package:privacee/UI/Message/sms.dart';
import 'package:privacee/UI/T_DNS/T_DNS.dart';
import 'package:privacee/UI/Message/Messages.dart';

class HomePage extends StatefulWidget {
  @override
  _StateHomePage createState() => _StateHomePage();
}

class _StateHomePage extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  List<SmsThread> _threads;
  @override
  bool get wantKeepAlive => true;

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool enabled = false; // tracks if drawer should be opened or not
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _drawerKey, // assign key to Scaffold
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: [
            CallLogs(),
            Messages(),
            ContactPage(),
            // TDNSSearch(),
          ],
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      child: TabBar(
        labelStyle: TextStyle(fontSize: SizeConfig.widthMultiplier * 3),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(0.0),
        tabs: [
          Container(
            height: SizeConfig.heightMultiplier * 12.5,
            child: Tab(
              child: Text("Phone", style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.2),),
              icon: Icon(
                Icons.phone,
                size: SizeConfig.imageSizeMultiplier * 6.5,
              ),
            ),
          ),
          Container(
            height: SizeConfig.heightMultiplier * 12.5,
            child: Tab(
              child: Text("Message", style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.2),),
              icon: Icon(Icons.message,
                  size: SizeConfig.imageSizeMultiplier * 6.5),
            ),
          ),
          Container(
            height: SizeConfig.heightMultiplier * 12.5,
            child: Tab(
              child: Text("Contact", style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.2),),
              icon: Icon(Icons.contacts,
                  size: SizeConfig.imageSizeMultiplier * 6.5),
            ),
          ),
          // Container(
          //   height: SizeConfig.heightMultiplier * 12.5,
          //   child: Tab(
          //     child: Text("T-DNS", style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.2),),
          //     icon: Icon(Icons.search,
          //         size: SizeConfig.imageSizeMultiplier * 6.5),
          //   ),
          // ),
        ],
      ),
    );
  }
}
