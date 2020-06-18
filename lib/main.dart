import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Call/calllog.dart';
import 'package:privacee/UI/Login/LoginPage.dart';
import 'package:privacee/Services/themes.dart';
import 'package:privacee/UI/Login/LoginSelection.dart';
import 'package:privacee/UI/Message/contact.dart';
import 'package:privacee/UI/Message/sim/sim_bloc.dart';
import 'package:privacee/UI/Message/sim/sim_bloc_provider.dart';
import 'package:privacee/UI/Message/sms.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/Contact/ContactListPage.dart';
import 'UI/Message/Messages.dart';

Map<PermissionGroup, PermissionStatus> permissions;

void getPermission() async {
  permissions = await PermissionHandler().requestPermissions([
    PermissionGroup.location,
    PermissionGroup.camera,
    PermissionGroup.locationAlways,
    PermissionGroup.phone,
    PermissionGroup.sensors,
    PermissionGroup.storage,
    PermissionGroup.microphone,
    PermissionGroup.contacts,
    PermissionGroup.sms,
  ]);
}

void main() async {
  runApp(
    //DevicePreview(builder: (context) =>
    MyApp(),
  );

}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');

    if (firstTime != null && !firstTime) {
      // Not first time
      return navigationPageHome();
    } else {
      // First time
      prefs.setBool('first_time', false);
      return navigationPageWel();
    }
  }

  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed('/AppLockPage');
  }

  void navigationPageWel() {
    Navigator.of(context).pushReplacementNamed('/SignUpPage');
  }

  @override
  void initState() {
    super.initState();
    getPermission();
    startTime();
    CallLogs();
    Messages();
    ContactListPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container();

  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //  @override
  // bool get wantKeepAlive => true;
  final SmsReceiver _receiver = SmsReceiver();
  final UserProfileProvider _userProfileProvider = UserProfileProvider();
  final SmsSender _smsSender = SmsSender();
  List<SmsThread> _threads;
  Map<PermissionGroup, PermissionStatus> permissions;
  @override
  void initState() {
    super.initState();
    getPermission();
    _receiver.onSmsReceived.listen(_onSmsReceived);
    // _userProfileProvider.getUserProfile().then(_onUserProfileLoaded);
    // _query.getAllThreads.then(_onThreadsLoaded);
    //  _smsSender.onSmsDelivered.listen(_onSmsDelivered);
  }

  void _onSmsReceived(SmsMessage sms) async {
    var thread = _threads.singleWhere((thread) {
      return thread.id == sms.threadId;
    }, orElse: () {
      var thread = SmsThread(sms.threadId);
      _threads.insert(0, thread);
      return thread;
    });

    thread.addNewMessage(sms);
    await thread.findContact();

    int index = _threads.indexOf(thread);
    if (index != 0) {
      _threads.removeAt(index);
      _threads.insert(0, thread);
    }
  }
  // void _onSmsDelivered(SmsMessage sms) async {
  //   final contacts = new ContactQuery();
  //   Contact contact = await contacts.queryContact(sms.address);
  //   final snackBar = new SnackBar(
  //       content: new Text('Message to ${contact.fullName} delivered'));
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().state(constraints, orientation);
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          final bloc = new SimCardsBloc();
          bloc.loadSimCards();

          return new SimCardsBlocProvider(
              simCardBloc: bloc,
              child: MaterialApp(
                
                title: 'Theme Switcher',
                theme: notifier.darkTheme ? dark : light,
                home: SplashScreen(),
                routes: <String, WidgetBuilder>{
                  '/AppLockPage': (BuildContext context) =>
                      new LoginSelection(),
                  '/SignUpPage': (BuildContext context) => new LoginSelection(),
                },
              ));
        }));
          });
      });
  }
}
