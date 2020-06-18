import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Message/contact.dart';
import 'package:privacee/UI/Message/sms.dart';

import 'arrow_painter.dart';
import 'message.dart';

class ReceivedMessage extends Message {
  ReceivedMessage(SmsMessage message, bool compactMode, this.contact)
      : super(message,
            compactMode: compactMode,
            backgroundColor: Colors.grey[800],
            arrowDirection: ArrowDirection.Left);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return new Container(
      child: new Stack(
        children: [
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                child: createAvatar(contact.thumbnail, contact.fullName),
                margin: new EdgeInsets.only(
                    right: SizeConfig.widthMultiplier * 2,
                    top: SizeConfig.heightMultiplier * 1.1),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      color: this.backgroundColor),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      new Text(message.body.trim(),style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.5)),
                      new Align(
                        child: new Padding(
                          padding: new EdgeInsets.only(
                              top: SizeConfig.heightMultiplier * 0.7),
                          child: new Text(
                            time.format(context),
                            style: new TextStyle(color: Colors.white, fontSize: SizeConfig.textMultiplier * 2),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                  margin: new EdgeInsets.only(
                      right: SizeConfig.widthMultiplier * 12),
                  padding:
                      new EdgeInsets.all(SizeConfig.heightMultiplier * 1.45),
                ),
              ),
            ],
          ),
          this.createArrow()
        ],
      ),
      margin: new EdgeInsets.only(
          top: compactMode
              ? SizeConfig.heightMultiplier * 0.29
              : SizeConfig.heightMultiplier * 1.45,
          bottom: SizeConfig.widthMultiplier * 0.0,
          left: SizeConfig.widthMultiplier * 3.75,
          right: SizeConfig.widthMultiplier * 3.75),
    );
  }
}
