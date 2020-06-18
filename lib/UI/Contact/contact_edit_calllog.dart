import 'package:flutter/material.dart';
import 'package:privacee/SizeConfig.dart';

class Contactdetailcalllog extends StatefulWidget {
  @override
  _Contactdetailcalllog createState() => _Contactdetailcalllog();
}

class _Contactdetailcalllog extends State<Contactdetailcalllog>
    with TickerProviderStateMixin {
  TabController _nestedTabController;
  final GlobalKey _menuKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) => Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                firstRow(),
                SizedBox(height: SizeConfig.heightMultiplier * 2.5),
                tabBar()
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: SizeConfig.heightMultiplier * 8.5,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () => {},
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.add,
                            size: SizeConfig.imageSizeMultiplier * 6),
                        Text('Add Contact',
                            style: TextStyle(
                                fontSize: SizeConfig.widthMultiplier * 3)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () => {},
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.create,
                            size: SizeConfig.imageSizeMultiplier * 6),
                        Text('Edit',
                            style: TextStyle(
                                fontSize: SizeConfig.widthMultiplier * 3)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: PopupMenuButton(
                        key: _menuKey,
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                              new PopupMenuItem<String>(
                                  child: Text('Doge',
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.widthMultiplier * 4)),
                                  value: 'Doge'),
                              new PopupMenuItem<String>(
                                  child: Text('Lion',
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.widthMultiplier * 4)),
                                  value: 'Lion'),
                            ],
                        onSelected: (_) {})),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstRow() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        color: const Color(0xFF212121).withOpacity(0.5),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.widthMultiplier * 3),
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      height: SizeConfig.heightMultiplier * 11,
                      minWidth: SizeConfig.widthMultiplier * 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(Icons.arrow_back,
                          size: SizeConfig.widthMultiplier * 11),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 2.5),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 11,
                          height: SizeConfig.heightMultiplier * 6.5,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              width: SizeConfig.widthMultiplier * 11,
                              height: SizeConfig.heightMultiplier * 6.5,
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: SizedBox(
                                    child: Image.asset('images/Asset 3.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(children: <Widget>[
                Container(
                  width: SizeConfig.widthMultiplier * 22.5,
                  height: SizeConfig.heightMultiplier * 13,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset('images/Asset 3.png'),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1.3),
                Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Adam',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: SizeConfig.widthMultiplier * 6),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ]),
              SizedBox(height: SizeConfig.heightMultiplier * 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBar() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.lightBlueAccent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.blueGrey,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: Colors.lightBlueAccent),
          isScrollable: true,
          tabs: <Widget>[
            new Container(
              width: SizeConfig.widthMultiplier * 20,
              child: new Tab(
                child: Text(
                  'Detail',
                  style: TextStyle(fontSize: SizeConfig.widthMultiplier * 4),
                ),
              ),
            ),
            new Container(
              width: SizeConfig.widthMultiplier * 20,
              child: new Tab(
                child: Text(
                  'CallLog',
                  style: TextStyle(fontSize: SizeConfig.widthMultiplier * 4),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.60,
          margin: EdgeInsets.only(
              left: SizeConfig.widthMultiplier * 4,
              right: SizeConfig.widthMultiplier * 4),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Builder(
                builder: (context) => Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[detail()],
                  ),
                ),
              ),
              Builder(
                builder: (context) => Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[calllog()],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget calllog() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.4),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.call_made,
                size: SizeConfig.imageSizeMultiplier * 8.5,
                color: Colors.lightBlueAccent,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 4.5),
                      child: Text(
                        "+6012-3456781",
                        // chatItem.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            color: Colors.white60),
                      ),
                    ),
                    Text(
                      "Today",
                      // chatItem.messageDate,
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.25),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.call_received,
                size: SizeConfig.widthMultiplier * 8.5,
                color: Colors.lightGreenAccent[400],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 2.5),
                      child: Text(
                        "+6012-3456781",
                        // chatItem.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            color: Colors.white60),
                      ),
                    ),
                    Text(
                      "Today",
                      // chatItem.messageDate,
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.25),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.call_received,
                size: SizeConfig.imageSizeMultiplier * 8.5,
                color: Colors.lightGreenAccent[400],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 2.5),
                      child: Text(
                        "+6012-3456781",
                        // chatItem.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            color: Colors.white60),
                      ),
                    ),
                    Text(
                      "Yesterday",
                      // chatItem.messageDate,
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.25),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.call_made,
                size: SizeConfig.imageSizeMultiplier * 8.5,
                color: Colors.lightBlueAccent,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 2.5),
                      child: Text(
                        "+6012-3456781",
                        // chatItem.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.widthMultiplier * 4.5,
                            color: Colors.white60),
                      ),
                    ),
                    Text(
                      "Testerday",
                      // chatItem.messageDate,
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
      ],
    );
  }

  Widget detail() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.25),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.white60,
                    size: SizeConfig.imageSizeMultiplier * 6,
                  ),
                  title: Text(
                    '+6012-3456789',
                    style: TextStyle(
                      fontSize: SizeConfig.widthMultiplier * 4.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  subtitle: Text(
                    'Phone',
                    style:
                        TextStyle(fontSize: SizeConfig.widthMultiplier * 3.5),
                  ),
                  onTap: () {},
                ),
              ),
              MaterialButton(
                onPressed: () {},
                minWidth: SizeConfig.widthMultiplier * 2.5,
                child:
                    Icon(Icons.sms, size: SizeConfig.imageSizeMultiplier * 8.7),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
        ListTile(
          leading: Icon(
            Icons.phonelink_ring,
            color: Colors.white60,
            size: SizeConfig.imageSizeMultiplier * 6,
          ),
          title: Text(
            'Ring',
            style: TextStyle(
              fontSize: SizeConfig.imageSizeMultiplier * 4.5,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          subtitle: Text('default',
              style: TextStyle(fontSize: SizeConfig.widthMultiplier * 3.5)),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white60,
            size: SizeConfig.imageSizeMultiplier * 6,
          ),
          onTap: () {},
        ),
        Divider(
          color: Colors.white54,
        ),
      ],
    );
  }
}
