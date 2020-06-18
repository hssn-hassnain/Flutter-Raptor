import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Message/contact.dart';
import 'package:privacee/UI/Message/sms.dart';
import '../sim/sim_bloc_provider.dart';

typedef void MessageSentCallback(SmsMessage message);

class FormSend extends StatelessWidget {
  FormSend(this.thread, {this.onMessageSent});

  final SmsThread thread;
  final MessageSentCallback onMessageSent;
  final TextEditingController _textField = new TextEditingController();
  final SmsSender _sender = new SmsSender();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final simCards = SimCardsBlocProvider.of(context);
    return new Material(
      elevation: 4.0,
      child: new Row(
        children: [
          new Expanded(
            child: new Container(
              child: new TextField(
                controller: _textField,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  labelStyle:
                      new TextStyle(fontSize: SizeConfig.widthMultiplier * 4),
                  hintText: "Send message:",
                  hintStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2.35),
                ),
              ),
              padding: new EdgeInsets.only(
                  left: SizeConfig.widthMultiplier * 5,
                  top: SizeConfig.heightMultiplier * 1.1,
                  bottom: SizeConfig.heightMultiplier * 1.1),
            ),
          ),
          new IconButton(
              icon: new StreamBuilder<SimCard>(
                  stream: simCards.onSimCardChanged,
                  initialData: simCards.selectedSimCard,
                  builder: (context, snapshot) {
                    return new Row(
                      children: [
                        new Icon(Icons.sim_card, size: SizeConfig.imageSizeMultiplier * 5.5,
                            color: snapshot.data.state == SimCardState.Ready
                                ? Colors.blue
                                : Colors.grey),
                        new Text(
                          snapshot.data.slot.toString(),
                          style: new TextStyle(
                              color: snapshot.data.state == SimCardState.Ready
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                      ],
                    );
                  }),
              onPressed: () {
                SimCardsBlocProvider.of(context).toggleSelectedSim();
              }),
          new IconButton(
            icon: new Icon(Icons.send, size: SizeConfig.imageSizeMultiplier * 5.5),
            onPressed: () {
              _sendMessage(context);
            },
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context) async {
    SmsMessage message =
        new SmsMessage(thread.address, _textField.text, threadId: thread.id);
    message.onStateChanged.listen((SmsMessageState state) {
      if (state == SmsMessageState.Delivered) {
        print('Message delivered to ${message.address}');
        _notifyDelivery(message, context);
      }
      if (state == SmsMessageState.Sent) {
        print('Message sent to ${message.address}');
      }
    });

    final simCard = SimCardsBlocProvider.of(context).selectedSimCard;
    await _sender.sendSms(message, simCard: simCard);
    _textField.clear();
    onMessageSent(message);
  }

  void _notifyDelivery(SmsMessage message, BuildContext context) async {
    final contacts = new ContactQuery();
    Contact contact = await contacts.queryContact(message.address);
    final snackBar = new SnackBar(
        content: new Text('Message to ${contact.fullName} delivered'));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
