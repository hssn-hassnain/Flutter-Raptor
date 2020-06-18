import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Message/contact.dart';
import 'package:privacee/UI/Message/conversation/conversationStore.dart';
import 'package:privacee/UI/Message/conversation/formSend.dart';
import 'dart:io';

import 'package:privacee/UI/Message/sms.dart';

import 'conversation/messages.dart';

class ChatWindow extends StatefulWidget {
  ChatWindow(this.thread, this.userProfile) : super();
  final SmsThread thread;
  final UserProfile userProfile;
  @override
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {
  final SmsReceiver _receiver = new SmsReceiver();
  List<String> _messages;
  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  TextEditingController textEditingController;
  ScrollController scrollController;

  bool enableButton = false;
  Icon actionIcon = new Icon(Icons.call);

  @override
  void initState() {
    _messages = List<String>();
    _receiver.onSmsReceived.listen((sms) {
      setState(() {});
    });
    super.initState();
    // _messages.add("Hi! How are you?");
    // _messages.add("I'm fine. thanks");
    // _messages.add("This is a multiline message.\nKeep reading!");
    // _messages.add("And this is a very..\nvery..\nlong..\nmessage.");
    // _messages.add("Hi! How are you?");
    // _messages.add("I'm fine. thanks");
    // _messages.add("This is a multiline message.\nKeep reading!");
    // _messages.add("And this is a very..\nvery..\nlong..\nmessage.");

    textEditingController = TextEditingController();

    scrollController = ScrollController();

    super.initState();
  }

  void handleSendMessage() {
    var text = textEditingController.value.text;
    textEditingController.clear();
    setState(() {
      _messages.add(text);
      enableButton = false;
    });

    Future.delayed(Duration(milliseconds: 100), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          curve: Curves.ease, duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var textInput = Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  enableButton = text.isNotEmpty;
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.attach_file,
                    size: SizeConfig.imageSizeMultiplier * 6),
                suffixIcon: Icon(Icons.send,
                    color: Colors.lightBlueAccent,
                    size: SizeConfig.imageSizeMultiplier * 6),
                hintStyle:
                    TextStyle(fontSize: SizeConfig.widthMultiplier * 3.75),
                hintText: "Type a message",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0)),
              ),
              controller: textEditingController,
            ),
          ),
        ),
        enableButton
            ? IconButton(
                color: Colors.lightBlueAccent,
                icon: Icon(Icons.send, size: SizeConfig.imageSizeMultiplier * 6),
                
                disabledColor: Colors.lightBlueAccent,
                onPressed: handleSendMessage,
              )
            : SizedBox(),
            // IconButton(
            //     color: Colors.lightBlueAccent,
            //     icon: Icon(
            //       Icons.send, size: SizeConfig.imageSizeMultiplier * 6
            //     ),
            //     disabledColor: Colors.lightBlueAccent,
            //     onPressed: null,
            //   )
      ],
    );

    return SafeArea(
          child: Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft,
              size: SizeConfig.safeBlockHorizontal * 6,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.thread.contact.fullName ??
                    widget.thread.contact.address, style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4.5)),
                Text(
                  widget.thread.contact.address,
                  style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new IconButton(
              icon: actionIcon,
              color: Colors.lightBlueAccent,
               iconSize: SizeConfig.safeBlockHorizontal * 6,
                onPressed: () {
                // setState(() {});
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            new Expanded(
              child: new ConversationStore(
                widget.userProfile,
                widget.thread,
                child: new Messages(widget.thread.messages),
              ),
            ),
            FormSend(
              widget.thread,
              onMessageSent: _onMessageSent,
            ),
          ],
        ),
      ),
    );
  }

  void _onMessageSent(SmsMessage message) {
    setState(() {
      widget.thread.addNewMessage(message);
    });
  }
}
