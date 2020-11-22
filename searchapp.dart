import 'package:etech/models/searchITEMS.dart';
import 'package:etech/screens/comment.dart';
import 'package:etech/screens/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchApp extends StatefulWidget {
  @override
  _SearchAppState createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          title: Text("WhatsApp"),
          expandedHeight: 100,
          actions: <Widget>[
            Icon(Icons.search),
            SizedBox(
              width: 30,
            ),
            Icon(Icons.more_vert),
          ],
          floating: true,
          flexibleSpace: ListView(
            children: <Widget>[],
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
