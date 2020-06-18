import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';
import 'package:privacee/UI/Message/contact.dart';

class Avatar extends StatelessWidget {
  Avatar(Photo photo, String alternativeText)
      : photo = photo,
        alternativeText = alternativeText,
        super(key: new ObjectKey(photo));

  final Photo photo;
  final String alternativeText;

  @override
  Widget build(BuildContext context) {
    if (photo != null) {
      return Container(
        width: SizeConfig.widthMultiplier * 10.5,
        height: SizeConfig.widthMultiplier * 10.5,
        child: CircleAvatar(
          backgroundImage: new MemoryImage(photo.bytes),
        ),
      );
    }
    return Container(
      width: SizeConfig.widthMultiplier * 10.5,
      height: SizeConfig.widthMultiplier * 10.5,
      child: CircleAvatar(child: new Icon(Icons.person, color: Colors.grey, size: SizeConfig.imageSizeMultiplier * 6,)
          // Text(alternativeText != null ? alternativeText[0] : 'Unknown'),
          ),
    );
  }
}
 