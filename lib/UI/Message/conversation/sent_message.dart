import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Message/contact.dart';
import 'package:privacee/UI/Message/sms.dart';
import 'arrow_painter.dart';
import 'message.dart';

class SentMessage extends Message {
  SentMessage(SmsMessage message, bool compactMode, this.userProfile)
      : super(message,
            compactMode: compactMode,
            backgroundColor: Colors.lightBlue[300],
            arrowDirection: ArrowDirection.Right);

  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Stack(
        children: [
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text(message.body.trim(),style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.5),),
                      new Align(
                        child: new Padding(
                          padding: new EdgeInsets.only(top: SizeConfig.heightMultiplier * 0.7),
                          child: new Text(
                            time.format(context),
                            style: new TextStyle(color: Colors.white, fontSize: SizeConfig.textMultiplier * 2),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                  margin: new EdgeInsets.only(left: SizeConfig.widthMultiplier * 12),
                  padding:                       new EdgeInsets.all(SizeConfig.heightMultiplier * 1.45),

                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: this.backgroundColor
                  ),
                ),
              ),
              new Container(
                child:
                    createAvatar(userProfile.thumbnail, userProfile.fullName),
                margin: new EdgeInsets.only(left: 8.0, top: 8.0),
              ),
            ],
          ),
          new Container(
            width: double.infinity,
            child: createArrow(),
          ),
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
