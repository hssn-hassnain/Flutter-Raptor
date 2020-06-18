import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:privacee/UI/Message/contact.dart';
import 'package:privacee/UI/Message/sms.dart';

import 'thread.dart';

class Threads extends StatelessWidget {
//   @override
//   State<Threads> createState() => _ThreadsState();
// }

// class _ThreadsState extends State<Threads>  {
  bool _loading = true;
  List<SmsThread> _threads;
  UserProfile _userProfile;

  // Animation
  AnimationController opacityController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      body: _getThreadsWidgets(),
     
    );
  }

  Widget _getThreadsWidgets() {
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(body: 
      FadeTransition(
        opacity: opacityController,
        child:  ListView.builder(
            itemCount: _threads.length,
            itemBuilder: (context, index) {
              return Thread(_threads[index], _userProfile);
            }),
      ));
    }
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
}
