import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Message/sms.dart';

import '../utils/group.dart';
import 'conversationStore.dart';
import 'received_message.dart';
import 'sent_message.dart';

class MessageGroup extends StatelessWidget {
  final Group group;

  MessageGroup(this.group) : super();

  @override
  Widget build(BuildContext context) {
        SizeConfig().init(context);

    final userProfile = ConversationStore.of(context).userProfile;
    final thread = ConversationStore.of(context).thread;

    List<Widget> widgets = <Widget>[
      new Container(
        color: Colors.black,
        child: new Text(_formatDatetime(group.messages[0], context), style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.1),),
        margin: new EdgeInsets.only(top: SizeConfig.heightMultiplier * 3.5),
      )
    ];

    for (int i = 0; i < group.messages.length; i++) {
      if (group.messages[i].kind == SmsMessageKind.Sent) {
        widgets.add(
            new SentMessage(group.messages[i], _isCompactMode(i), userProfile));
      } else {
        widgets.add(new ReceivedMessage(
            group.messages[i], _isCompactMode(i), thread.contact));
      }
    }

    return new Padding(
      padding: EdgeInsets.only(bottom:SizeConfig.widthMultiplier * 2.5),
      child: new Container(
        child: Column(
          children: widgets,
        ),
      ),
    );
  }

  String _formatDatetime(SmsMessage message, BuildContext context) {
    return MaterialLocalizations.of(context).formatFullDate(message.date);
  }

  bool _isCompactMode(int i) {
    return i > 0 && group.messages[i].kind == group.messages[i - 1].kind;
  }
}
