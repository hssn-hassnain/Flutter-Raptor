import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:privacee/SizeConfig.dart';

class AddNewContact extends StatefulWidget {
  @override
  _AddNewContact createState() => _AddNewContact();
}

class _AddNewContact extends State<AddNewContact> {
  File _image;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
// upload function
// Future uploadPic(BuildContext context) async{
//       String fileName = basename(_image.path);
//        StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
//        StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
//        StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
//        setState(() {
//           print("Profile Picture uploaded");
//           Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
//        });
//     }

    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add New Contact",
            style: TextStyle(fontSize: SizeConfig.widthMultiplier * 5),
          ),
          leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                size: SizeConfig.widthMultiplier * 5,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Builder(
          builder: (context) => Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                image(),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.widthMultiplier * 7.5),
                  child: buildText2('Name'),
                ),
                name(),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.widthMultiplier * 7.5),
                  child: buildText2('Phone'),
                ),
                phone(),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.widthMultiplier * 7.5),
                  child: buildText2('T-DNS'),
                ),
                dns(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: SizeConfig.heightMultiplier * 7,
            child: MaterialButton(
              color: Colors.greenAccent[400],
              onPressed: () {},
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: SizeConfig.widthMultiplier * 5,
                ),
              ),
            ),
          ),
          color: Colors.greenAccent[400],
        ),
      ),
    );
  }

  buildText(String aaaa) {
    return Container(
      width: SizeConfig.widthMultiplier * 95,
      height: SizeConfig.heightMultiplier * 8.5,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(SizeConfig.widthMultiplier * 6.25),
          hintText: aaaa,
          suffixIcon: Icon(
            FontAwesomeIcons.pen,
            size: SizeConfig.widthMultiplier * 5,
          ),
        ),
      ),
    );
  }

  buildText2(String aaa) {
    return Text(
      aaa,
      style: TextStyle(
        fontSize: SizeConfig.widthMultiplier * 5.5,
        letterSpacing: SizeConfig.widthMultiplier * 0.125,
        color: Colors.lightBlueAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  buildAdd(String text1) {
    return ListTile(
      leading: Icon(Icons.add_circle,
          color: Colors.greenAccent[400],
          size: SizeConfig.widthMultiplier * 6),
      title: Text(
        text1,
        style: TextStyle(
          fontSize: SizeConfig.widthMultiplier * 4.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  buildAdding(String text1, String text2) {
    return TextField(
      decoration: InputDecoration(
        labelStyle: new TextStyle(
          fontSize: SizeConfig.widthMultiplier * 4.5,
        ),
        labelText: text1,
        hasFloatingPlaceholder: false,
        prefixIcon: IconButton(
          icon: Icon(Icons.remove_circle,
              size: SizeConfig.widthMultiplier * 6),
          onPressed: () {},
          color: Colors.red,
        ),
        hintStyle: new TextStyle(
          fontSize: SizeConfig.widthMultiplier * 4.5,
        ),
        prefixStyle: TextStyle(
          fontSize: SizeConfig.widthMultiplier * 4.5,
        ),
        prefixText: text1,
        hintText: text2,
      ),
    );
  }

  buildName(String text1) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: new TextStyle(
          fontSize: SizeConfig.widthMultiplier * 4.5,
        ),
        hasFloatingPlaceholder: false,
        hintText: text1,
        contentPadding:
            EdgeInsets.only(left: SizeConfig.widthMultiplier * 6.25),
      ),
    );
  }

  Widget image() {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future takeImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future<void> _showDialog(BuildContext context) {
        return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
              backgroundColor: Colors.grey[900],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Pick an Image:",
                        style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     ListTile(
                      title: Text(
                        "Select From Gallery",
                        style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      onTap: () {
                        getImage();
                      },
                    ),
                     ListTile(
                      title: Text(
                        "Open Camera",
                        style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      onTap: () {
                        takeImage();
                      },
                    ),
                  ],
              ),
            );
          },
        );
      };

    return Padding(
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 6.25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: SizeConfig.widthMultiplier * 21,
            backgroundColor: Colors.lightBlueAccent,
            child: ClipOval(
              child: SizedBox(
                width: SizeConfig.widthMultiplier * 41,
                height: SizeConfig.heightMultiplier * 24,
                child: (_image != null)
                    ? Image.file(
                        _image,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        "assets/Human.png",
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.camera,
              color: Colors.white,
              size: SizeConfig.widthMultiplier * 3,
            ),
            onPressed: () {
              _showDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget name() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 1.5,
            horizontal: SizeConfig.widthMultiplier * 3.75),
        color: const Color(0xFF212121).withOpacity(0.5),
        child: Form(
          child: Column(
            children: <Widget>[
              buildName('LastName'),
              buildName('FirstName'),
            ],
          ),
        ),
      ),
    );
  }

  Widget phone() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 1.5,
            horizontal: SizeConfig.widthMultiplier * 3.75),
        color: const Color(0xFF212121).withOpacity(0.5),
        child: Form(
          child: Column(
            children: <Widget>[
              buildAdding('Mobile  > ', 'Mobile No. '),
              buildAdd('Add Number'),
            ],
          ),
        ),
      ),
    );
  }

  Widget dns() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 1.5,
            horizontal: SizeConfig.widthMultiplier * 3.75),
        color: const Color(0xFF212121).withOpacity(0.5),
        child: Form(
          child: Column(
            children: <Widget>[
              buildAdding('E-mail   > ', 'Example@mail.com'),
              buildAdding('Tel      > ', 'Tel No.'),
              buildAdd('Add T-DNS'),
            ],
          ),
        ),
      ),
    );
  }
}

class AddContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  Contact contact = Contact();
  PostalAddress address = PostalAddress(label: "Home");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a contact"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              _formKey.currentState.save();
              contact.postalAddresses = [address];
              ContactsService.addContact(contact);
              Navigator.of(context).pop();
            },
            child: Icon(Icons.save, color: Colors.white),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'First name'),
                onSaved: (v) => contact.givenName = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Middle name'),
                onSaved: (v) => contact.middleName = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last name'),
                onSaved: (v) => contact.familyName = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Prefix'),
                onSaved: (v) => contact.prefix = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Suffix'),
                onSaved: (v) => contact.suffix = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onSaved: (v) =>
                    contact.phones = [Item(label: "mobile", value: v)],
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                onSaved: (v) =>
                    contact.emails = [Item(label: "work", value: v)],
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Company'),
                onSaved: (v) => contact.company = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Job'),
                onSaved: (v) => contact.jobTitle = v,
              ),
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'Note'),
              //   onSaved: (v) => contact.note = v,
              // ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Street'),
                onSaved: (v) => address.street = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'City'),
                onSaved: (v) => address.city = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Region'),
                onSaved: (v) => address.region = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Postal code'),
                onSaved: (v) => address.postcode = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Country'),
                onSaved: (v) => address.country = v,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
