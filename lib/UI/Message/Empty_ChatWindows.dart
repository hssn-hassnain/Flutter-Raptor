import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:privacee/SizeConfig.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
  Icon actionIcon = new Icon(Icons.person_add);

  @override
  void initState() {
    _messages = List<String>();

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
            padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2),
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
                icon:
                    Icon(Icons.send, size: SizeConfig.imageSizeMultiplier * 6),
                disabledColor: Colors.lightBlueAccent,
                onPressed: handleSendMessage,
              )
            : SizedBox(),
        // : IconButton(
        //     color: Colors.lightBlueAccent,
        //     icon: Icon(
        //       Icons.send,
        //     ),
        //     disabledColor: Colors.lightBlueAccent,
        //     onPressed: null,
        //   )
      ],
    );

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              size: SizeConfig.imageSizeMultiplier * 6,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Column(
          children: <Widget>[
            new Container(
              width: SizeConfig.widthMultiplier * 25,
              height: SizeConfig.heightMultiplier * 6.5,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier * 0.85,
                    horizontal: SizeConfig.widthMultiplier * 2.5),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Adam",
                    fillColor: Colors.lightBlueAccent,
                    filled: true,
                    labelStyle: TextStyle(
                      fontSize: SizeConfig.widthMultiplier * 5,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.heightMultiplier * 0.22,
                right: SizeConfig.widthMultiplier * 2.5),
            child: new IconButton(
              icon: actionIcon,
              color: Colors.lightBlueAccent,
              iconSize: SizeConfig.imageSizeMultiplier * 6,
              onPressed: () {
                setState(() {});
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool reverse = false;

                if (index % 2 == 0) {
                  reverse = true;
                }

                var avatar = Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.widthMultiplier * 2,
                      bottom: SizeConfig.heightMultiplier * 1.1,
                      right: SizeConfig.widthMultiplier * 2),
                  child: CircleAvatar(
                    radius: SizeConfig.heightMultiplier * 2.6,
                    backgroundColor: Colors.lightBlueAccent,
                    child: ClipOval(
                      child: SizedBox(
                        width: SizeConfig.widthMultiplier * 22.5,
                        height: SizeConfig.heightMultiplier * 13.2,
                        child: (_image != null)
                            ? Image.file(
                                _image,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                "images/Asset3.png",
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                );

                var messagebody = DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.widthMultiplier * 3),
                      child: Text(_messages[index]),
                    ),
                  ),
                );

                Widget message;

                if (reverse) {
                  message = Stack(
                    children: <Widget>[
                      messagebody,
                    ],
                  );
                } else {
                  message = Stack(
                    children: <Widget>[
                      messagebody,
                    ],
                  );
                }

                if (reverse) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                        child: message,
                      ),
                      avatar,
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      avatar,
                      Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                        child: message,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Divider(height: SizeConfig.heightMultiplier * 0.26),
          textInput
        ],
      ),
    );
  }
}
