import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pit_sms_call_log/pit_sms_call_log.dart';
import 'package:privacee/UI/Call/dialpad.dart';
import 'package:privacee/UI/Setting/settings.dart';


class CallHistory extends StatefulWidget {
  @override
  _StateCallHistory createState() => _StateCallHistory();
}

class _StateCallHistory extends State<CallHistory>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<CallHistory>  {
        @override
  bool get wantKeepAlive => true;

  TabController _nestedTabController;
  var fabIcon = Icons.add;
  var fabIcon1 = Colors.greenAccent[400];
final f = new DateFormat('yyyy-MM-dd hh:mm');

  List<SmsLog> smsList = [];

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          switch (_nestedTabController.index) {
            case 0:
            
              fabIcon = Icons.add;
              fabIcon1 = Colors.greenAccent[400];
              break;
            case 1:
              fabIcon1 = Colors.greenAccent[400];
              fabIcon = Icons.add;
              break;
          }
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[_TitleBar(), SizedBox(height: 10), tabBar()],
          ),
        ),
      ),
    );
  }


  Widget firstRow() {
    return Container(
        height: 160,
        color: Colors.grey[900],
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Container(
                      child: Text(
                        "Call History",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Container(
                      child: new InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'images/Asset 3.png',
                          fit: BoxFit.contain,
                          width: 55.0,
                          height: 55.0,
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 10),
                      child: Container(
                          height: 45,
                          width: 360,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                filled: true,
                                prefixIcon: Icon(Icons.search),
                                contentPadding: EdgeInsets.all(12.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
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
          indicator: BoxDecoration(borderRadius: BorderRadius.circular(80), color: Colors.lightBlueAccent),
          isScrollable: true,
          tabs: <Widget>[
            new Container(
              width: 120.0,
              child: new Tab(text: 'Call History'),
            ),
            new Container(
              width: 120.0,
              child: new Tab(text: 'Block Contacts'),
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.60,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Builder(
                /// try to add floater button or Raised button here
                ///
                builder: (context) => Container(
                  child: Scaffold(
                    body: Builder(
                      builder: (context) => Container(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            calllog(),
                          ],
                        ),
                      ),
                    ),
                    floatingActionButton: FloatingActionButton(
                        child: Icon(Icons.dialpad),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dialpad(),
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
                    children: <Widget>[calllog()],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget calllog() {
    return Column(
      children: <Widget>[],
    );
  }

 

  Widget toggle() {
    return FloatingActionButton(
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      onPressed: () {},
    );
  }

  Widget aaaa() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 64.0,
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
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                      Text(
                        "Today",
                        // chatItem.messageDate,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "+6013432233",
                        // chatItem.name,
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Icon(
                          Icons.phone,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget aaa() {
    return ExpansionTile(
      title: aaaa(),
      trailing: Text(''),
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.phone, color: Colors.lightBlueAccent),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.video_call, color: Colors.greenAccent[400]),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.sms, color: Colors.white60),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.info, color: Colors.lightBlueAccent),
              onPressed: () {},
            ),
          ),
        ])
      ],
    );
  }
}

Widget aaa2() {
  return ExpansionTile(
    title: aaaa2(),
    trailing: Text(''),
    children: <Widget>[
      Row(children: <Widget>[
        Expanded(
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.phone, color: Colors.lightBlueAccent),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.video_call, color: Colors.greenAccent[400]),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.sms, color: Colors.white60),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.info, color: Colors.lightBlueAccent),
            onPressed: () {},
          ),
        ),
      ])
    ],
  );
}

Widget aaaa2() {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.account_circle,
          size: 64.0,
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
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                    Text(
                      "Today",
                      // chatItem.messageDate,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "+6013432233",
                      // chatItem.name,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: Icon(
                        Icons.phone_missed,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

class _TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Padding(
          padding: EdgeInsets.only(top: 0, bottom: 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Container(
                      child: Text(
                        "Calls History",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
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
                          width: 45.0,
                          height: 45.0,
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            height: 35,
                            width: 310,
                            child: TextField(
                                decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              hintText: 'Search by name and number',
                              prefixIcon: const Icon(
                                Icons.search,
                              ),
                            )),
                          )
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
