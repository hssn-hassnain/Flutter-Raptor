import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Message/contact.dart';
import 'package:privacee/UI/Message/conversations/thread.dart';
import 'package:privacee/UI/Message/sms.dart';
import 'package:privacee/UI/Setting/settings.dart';
import 'package:privacee/enums/device_screen_type.dart';
import 'package:privacee/responsive/responsive_builder.dart';

import 'Empty_ChatWindows.dart';

class Messages extends StatefulWidget {
  @override
  StateMessages createState() => StateMessages();
}

class StateMessages extends State<Messages>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<Messages> {
  @override
  bool get wantKeepAlive => true;
  TabController _nestedTabController;
  bool _loading = true;
  List<SmsThread> _threads;
  UserProfile _userProfile;
  final SmsQuery _query = SmsQuery();
  final UserProfileProvider _userProfileProvider = UserProfileProvider();
  AnimationController opacityController;
  var fabIcon = Icons.add;
  final GlobalKey _menuKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    _userProfileProvider.getUserProfile().then(_onUserProfileLoaded);
    _query.getAllThreads.then(_onThreadsLoaded);
    opacityController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this, value: 0.0);
    _nestedTabController = new TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          switch (_nestedTabController.index) {
            case 0:
              fabIcon = Icons.add;
              break;
            case 1:
              fabIcon = Icons.add;
              break;
          }
        });
      });
  }

  void _onThreadsLoaded(List<SmsThread> threads) {
    _threads = threads;
    _checkIfLoadCompleted();
  }

  void _onUserProfileLoaded(UserProfile userProfile) {
    _userProfile = userProfile;
    _checkIfLoadCompleted();
  }

  void _checkIfLoadCompleted() {
    if (_threads != null && _userProfile != null) {
      setState(() {
        _loading = false;
        opacityController.animateTo(1.0, curve: Curves.easeIn);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(height: SizeConfig.heightMultiplier * 1.2),
                _TitleBar(),
                SizedBox(height: SizeConfig.heightMultiplier * 1.3),
                tabBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstRow() {
    return Container(
        height: SizeConfig.heightMultiplier * 23,
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.heightMultiplier * 2,
              bottom: SizeConfig.heightMultiplier * 2),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 5),
                    child: Container(
                      child: Text(
                        "Message",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.widthMultiplier * 5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: SizeConfig.widthMultiplier * 3.75),
                    child: Container(
                      child: new InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'images/Asset 3.png',
                          fit: BoxFit.contain,
                          width: SizeConfig.widthMultiplier * 11.25,
                          height: SizeConfig.heightMultiplier * 6.5,
                        ),
                      ),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1.45),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.widthMultiplier * 2.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 7.5,
                          right: SizeConfig.widthMultiplier * 2.5),
                      child: Container(
                          height: SizeConfig.heightMultiplier * 6.5,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                filled: true,
                                prefixIcon: Icon(Icons.search,
                                    size: SizeConfig.imageSizeMultiplier * 5),
                                contentPadding: EdgeInsets.all(
                                    SizeConfig.widthMultiplier * 3),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                                hintStyle: TextStyle(
                                    fontSize: SizeConfig.widthMultiplier * 4),
                                hintText: 'Search by names and number'),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget tabBar() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.lightBlueAccent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.blueGrey,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: Colors.lightBlueAccent),
          isScrollable: true,
          tabs: <Widget>[
            new Container(
              height: SizeConfig.heightMultiplier * 4,
              width: SizeConfig.widthMultiplier * 31,
              child: new Tab(
                child: Text(
                  'Message Box',
                  style: TextStyle(fontSize: SizeConfig.widthMultiplier * 3.8),
                ),
              ),
            ),
            new Container(
              height: SizeConfig.heightMultiplier * 4,
              width: SizeConfig.widthMultiplier * 31,
              child: new Tab(
                child: Text(
                  'Block',
                  style: TextStyle(fontSize: SizeConfig.widthMultiplier * 3.8),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 3),
        Container(
          height: screenHeight * 0.60,
          
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Builder(
                /// try to add floater button or Raised button here
                builder: (context) => Scaffold(
                  body: Builder(
                    builder: (context) => details(),
                  ),
                  floatingActionButton: DraggableFab(
                    child: FloatingActionButton(
                        child: Icon(
                          Icons.add,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Chat(),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              Builder(
                builder: (context) => Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget detail() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(SizeConfig.widthMultiplier * 0.5),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: SizeConfig.imageSizeMultiplier * 12.5,
                color: Colors.grey[600],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Amanda",
                            // chatItem.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.widthMultiplier * 4.5,
                            ),
                          ),
                          Text(
                            "Today",
                            // chatItem.messageDate,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text(
                          "OK. Meet you at 8pm",
                          // chatItem.mostRecentMessage,
                          style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 4),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.widthMultiplier * 0.5),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: SizeConfig.imageSizeMultiplier * 12.5,
                color: Colors.grey[600],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Bella Ciao",
                            // chatItem.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.widthMultiplier * 4.5,
                            ),
                          ),
                          Text(
                            "Yesterday",
                            // chatItem.messageDate,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text(
                          "No Problem",
                          // chatItem.mostRecentMessage,
                          style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 4),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.widthMultiplier * 0.5),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: SizeConfig.imageSizeMultiplier * 12.5,
                color: Colors.grey[600],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Bella Ciao",
                            // chatItem.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.widthMultiplier * 4.5,
                            ),
                          ),
                          Text(
                            "Yesterday",
                            // chatItem.messageDate,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text(
                          "No Problem",
                          // chatItem.mostRecentMessage,
                          style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 4),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.widthMultiplier * 0.5),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: SizeConfig.imageSizeMultiplier * 12.5,
                color: Colors.grey[600],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Bella Ciao",
                            // chatItem.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.widthMultiplier * 4.5,
                            ),
                          ),
                          Text(
                            "Yesterday",
                            // chatItem.messageDate,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text(
                          "No Problem",
                          // chatItem.mostRecentMessage,
                          style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 4),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.widthMultiplier * 0.5),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: SizeConfig.imageSizeMultiplier * 12.5,
                color: Colors.grey[600],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Bella Ciao",
                            // chatItem.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.widthMultiplier * 4.5,
                            ),
                          ),
                          Text(
                            "Yesterday",
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text(
                          "No Problem",
                          // chatItem.mostRecentMessage,
                          style: TextStyle(
                              fontSize: SizeConfig.widthMultiplier * 4),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
      ],
    );
  }

  Widget details() {
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
          body: ListView.builder(
              itemCount: _threads.length,
              itemBuilder: (context, index) {
                return Thread(_threads[index], _userProfile);
              }));
    }
  }
}

class _TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
        child: Padding(
      padding: EdgeInsets.only(top: 0, bottom: 0),
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
                    "Messages",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.widthMultiplier * 5,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: SizeConfig.widthMultiplier * 3.75),
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
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.heightMultiplier * 1.45,
                    left: SizeConfig.widthMultiplier * 6.25,
                    right: SizeConfig.widthMultiplier * 7.5),
                child: new Container(
                  height: SizeConfig.heightMultiplier * 4.8,
                  child: TextField(
                      decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.all(SizeConfig.widthMultiplier * 2.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    hintStyle:
                        TextStyle(fontSize: SizeConfig.widthMultiplier * 4),
                    hintText: 'Search by name and number',
                    prefixIcon: Icon(Icons.search,
                        size: SizeConfig.imageSizeMultiplier * 5),
                  )),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
