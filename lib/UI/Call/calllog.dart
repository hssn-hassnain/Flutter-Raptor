import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Call/Dialpad.dart';
import 'package:privacee/UI/Setting/settings.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class CallLogs extends StatefulWidget {
  _CallLogsState createState() => _CallLogsState();
}

class _CallLogsState extends State<CallLogs>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<CallLogs> {
  var value;
  bool isExpanded = false;
  @override
  bool get wantKeepAlive => true;
  TabController _nestedTabController;
  var fabIcon = Icons.add;
  var fabIcon1 = Colors.greenAccent[400];
  Iterable<CallLogEntry> _callLogEntries = [];
  // @override
  // initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  Future<void> initPlatformState() async {
    var result = await CallLog.query();
    setState(() {
      _callLogEntries = result;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
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

// String initials() {
//     return ((_callLogEntries.name?.isNotEmpty == true ? this.givenName[0] : "") +
//             (this.familyName?.isNotEmpty == true ? this.familyName[0] : ""))
//         .toUpperCase();
//   }
  Offset position = Offset(200, 100);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(SizeConfig.heightMultiplier * 23),
            child: Column(children: <Widget>[
              SizedBox(height: SizeConfig.heightMultiplier * 1.3),
              _TitleBar(),
              tabBar()
            ]),
          ),
          body: Container(
                child: _callLogEntries != null
                    ? ListView.builder(
                        itemCount: _callLogEntries?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          CallLogEntry c = _callLogEntries?.elementAt(index);
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 0.75),
                                                      child: GroovinExpansionTile(
                                defaultTrailingIconColor: Colors.lightBlueAccent,
                                leading: CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: SizeConfig.imageSizeMultiplier * 5,
                                  ),
                                ),
                                title: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(0.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Flexible(
                                                          child: c.name != null
                                                              ? Text("${c.name}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          SizeConfig
                                                                                  .widthMultiplier *
                                                                              3.8))
                                                              : Text("",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          SizeConfig
                                                                                  .widthMultiplier *
                                                                              3.8)
                                                                  // chatItem.name,
                                                                  ),
                                                        ),
                                                        Text("${(c.updatedDt)}",
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .widthMultiplier *
                                                                    3.8)),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              left: SizeConfig
                                                                      .widthMultiplier *
                                                                  1.75),
                                                          child: c.formattedNumber !=
                                                                  null
                                                              ? Text(
                                                                  "${c.formattedNumber}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          SizeConfig
                                                                                  .widthMultiplier *
                                                                              3.8)
                                                                  // chatItem.name,
                                                                  )
                                                              : Text("${c.number}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          SizeConfig
                                                                                  .widthMultiplier *
                                                                              3.8)
                                                                  // chatItem.name,
                                                                  ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              right: SizeConfig
                                                                      .widthMultiplier *
                                                                  1.75),
                                                          child: c.callType ==
                                                                  CallType.missed
                                                              ? Icon(
                                                                  Icons
                                                                      .phone_missed,
                                                                  color: Colors.red,
                                                                  size: SizeConfig
                                                                          .imageSizeMultiplier *
                                                                      5,
                                                                )
                                                              : c.callType ==
                                                                      CallType
                                                                          .incoming
                                                                  ? Icon(
                                                                      Icons.phone,
                                                                      color: Colors
                                                                          .green,
                                                                      size: SizeConfig
                                                                              .imageSizeMultiplier *
                                                                          5,
                                                                    )
                                                                  : c.callType ==
                                                                          CallType
                                                                              .outgoing
                                                                      ? Icon(
                                                                          Icons
                                                                              .phone,
                                                                          color: Colors
                                                                              .blue,
                                                                          size:
                                                                              SizeConfig.imageSizeMultiplier *
                                                                                  5,
                                                                        )
                                                                      : Text(
                                                                          '',
                                                                        ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                    Divider(
                                      color: Colors.white54,
                                    ),
                                  ],
                                ),

                                // subtitle: Text("123-456-7890");
                                onExpansionChanged: (value) {
                                  setState(() {
                                    isExpanded = value;
                                  });
                                },
                                inkwellRadius: !isExpanded
                                    ? BorderRadius.all(Radius.circular(8.0))
                                    : BorderRadius.only(
                                        topRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                      ),
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: SizeConfig.widthMultiplier * 2,
                                              right:
                                                  SizeConfig.widthMultiplier * 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(
                                                  Icons.phone,
                                                  color: Colors.green,
                                                  size: SizeConfig
                                                          .imageSizeMultiplier *
                                                      5,
                                                ),
                                                onPressed: () {},
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.video_call,
                                                  color: Colors.blue,
                                                  size: SizeConfig
                                                          .imageSizeMultiplier *
                                                      5,
                                                ),
                                                onPressed: () {},
                                              ),
                                              // IconButton(
                                              //   icon: Icon(Icons.edit),
                                              //   onPressed: () {},
                                              // ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.message,
                                                  color: Colors.greenAccent,
                                                  size: SizeConfig
                                                          .imageSizeMultiplier *
                                                      5,
                                                ),
                                                onPressed: () {},
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.info,
                                                  color: Colors.blue,
                                                  size: SizeConfig
                                                          .imageSizeMultiplier *
                                                      5,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          );
                        })
                    : Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                        ),
                      ),
              ),
              floatingActionButton: DraggableFab(
                child: FloatingActionButton(
                    child: Icon(
                      Icons.dialpad,
                    ),
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
    );
  }

  Widget tabBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.lightBlueAccent),
          isScrollable: true,
          tabs: <Widget>[
            new Container(
              height: SizeConfig.heightMultiplier * 4,
              width: SizeConfig.widthMultiplier * 31,
              child: new Tab(
                child: Text(
                  'Call History',
                  style: TextStyle(fontSize: SizeConfig.widthMultiplier * 3.8),
                ),
              ),
            ),
            new Container(
              height: SizeConfig.heightMultiplier * 4,
              width: SizeConfig.widthMultiplier * 31,
              child: new Tab(
                child: Text('Block Contacts',
                    style:
                        TextStyle(fontSize: SizeConfig.widthMultiplier * 3.8)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.heightMultiplier * 14.5,
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
                        "Calls History",
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
                        right: SizeConfig.widthMultiplier * 3.75),
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
                        top: SizeConfig.heightMultiplier * 1.3,
                        left: SizeConfig.widthMultiplier * 6.25,
                        right: SizeConfig.widthMultiplier * 7.5),
                    child: new Container(
                      height: SizeConfig.heightMultiplier * 5,
                      child: TextField(
                          decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.all(SizeConfig.widthMultiplier * 2.5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        hintStyle:
                            TextStyle(fontSize: SizeConfig.widthMultiplier * 4),
                        hintText: 'Search by name and number',
                        prefixIcon: Icon(
                          Icons.search,
                          size: SizeConfig.imageSizeMultiplier * 5,
                        ),
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

class CallLog {
  static const MethodChannel _channel =
      const MethodChannel('sk.fourq.call_log');

  /// Get all call history log entries. Permissions are handled automatically
  static Future<Iterable<CallLogEntry>> get() async {
    Iterable result = await _channel.invokeMethod('get', null);
    return result?.map((m) => CallLogEntry.fromMap(m));
  }

  /// Query call history log entries
  /// dateFrom: unix timestamp. precision in millis
  /// dateTo: unix timestamp. precision in millis
  /// durationFrom: minimal call length in seconds
  /// durationTo: minimal call length in seconds
  /// name: call participant name (present only if in contacts)
  /// number: call participant phone number
  /// type: value from [CallType] enum
  static Future<Iterable<CallLogEntry>> query({
    int dateFrom,
    int dateTo,
    int durationFrom,
    int durationTo,
    String name,
    String number,
    CallType type,
  }) async {
    var params = {
      "dateFrom": dateFrom?.toString(),
      "dateTo": dateTo?.toString(),
      "durationFrom": durationFrom?.toString(),
      "durationTo": durationTo?.toString(),
      "name": name,
      "number": number,
      "type": type?.index == null ? null : (type.index + 1).toString(),
    };
    Iterable records = await _channel.invokeMethod('query', params);
    return records?.map((m) => CallLogEntry.fromMap(m));
  }
}

/// PODO for one call log entry
class CallLogEntry {
  CallLogEntry({
    this.name,
    this.number,
    this.formattedNumber,
    this.callType,
    this.duration,
    this.timestamp,
  });

  String name;
  String number;
  String formattedNumber;
  CallType callType;
  int duration;
  int timestamp;
  String updatedDt;
  var newFormat = DateFormat("dd-MM, hh:mm");
  CallLogEntry.fromMap(Map m) {
    name = m['name'];
    number = m['number'];
    formattedNumber = m['formattedNumber'];
    callType = CallType.values[m['callType'] - 1];
    duration = m['duration'];
    timestamp = m['timestamp'];
    var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);

    updatedDt = newFormat.format(dt);
// print(updatedDt); // 20-04-03
  }
}

/// All possible call types
enum CallType {
  incoming,
  outgoing,
  missed,
  voiceMail,
  rejected,
  blocked,
  answeredExternally
}

class IncomingCall extends StatelessWidget {
  IncomingCall(this._callLogEntries);
  final CallLogEntry _callLogEntries;
  String dropdownValue = 'One';
  final GlobalKey _menuKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: SizeConfig.heightMultiplier * 8.8),
              Text(
                'Incoming Call',
                style: TextStyle(color: Colors.white60, fontSize: 30),
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
              SizedBox(height: SizeConfig.heightMultiplier * 2.6),
              Text(
                '${_callLogEntries.name}',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1.45),
              Text(
                '${_callLogEntries.number}',
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: SizeConfig.widthMultiplier * 3.75),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 13),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new CallLogs(),
                        ),
                      );
                    },
                    elevation: 20.0,
                    mini: false,
                    child: Icon(Icons.call_end,
                        color: Colors.white,
                        size: SizeConfig.imageSizeMultiplier * 5),
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
                    child: Icon(Icons.call,
                        color: Colors.white,
                        size: SizeConfig.imageSizeMultiplier * 5),
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
