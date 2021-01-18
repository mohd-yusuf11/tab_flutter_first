import 'package:codehelpnavuagtor/tab_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial_material_design/flutter_speed_dial_material_design.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LstView(),
    );
  }
}

class LstView extends StatefulWidget {
  @override
  _LstViewState createState() => _LstViewState();
}

class _LstViewState extends State<LstView> {
  SpeedDialController _controller = SpeedDialController();

  final tabs = [
    'Home',
    'Person',
    'Draft',
    'Search',
  ];
  int selectedTabs = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[selectedTabs]),
      ),


      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomTab(),
    );
  }

  _buildBottomTab() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Color.fromRGBO(9, 20, 97, .9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabItem(
              text: tabs[0],
              icon: Icons.home,
              isSelected: selectedTabs == 0,
              onTap: () {
                setState(() {
                  selectedTabs = 0;
                });
              }),
          TabItem(
            text: tabs[1],
            icon: Icons.person,
            isSelected: selectedTabs == 1,
            onTap: () {
              setState(() {
                selectedTabs = 1;
              });
            },
          ),
          SizedBox(
            width: 20,
          ),
          TabItem(
            text: tabs[2],
            icon: Icons.drafts,
            isSelected: selectedTabs == 2,
            onTap: () {
              setState(() {
                selectedTabs = 2;
              });
            },
          ),
          TabItem(
            text: tabs[3],
            icon: Icons.search,
            isSelected: selectedTabs == 3,
            onTap: () {
              setState(() {
                selectedTabs = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    final TextStyle customStyle = TextStyle(
        inherit: false, color: Colors.black);
    final icons = [
      SpeedDialAction(
        //backgroundColor: Colors.green,
        //foregroundColor: Colors.yellow,
          child: Icon(Icons.mode_edit),
          label: Text('Edit any item', style: customStyle)),
      SpeedDialAction(child: Icon(Icons.date_range),
          label: Text('Choose the date', style: customStyle)),
      SpeedDialAction(
          child: Icon(Icons.list), label: Text('Menu', style: customStyle)),
    ];

    return SpeedDialFloatingActionButton(
      actions: icons,
      childOnFold: Icon(Icons.event_note, key: UniqueKey()),
      screenColor: Colors.black.withOpacity(0.3),
      //childOnUnfold: Icon(Icons.add),
      useRotateAnimation: false,
      onAction: _onSpeedDialAction,
      controller: _controller,
      isDismissible: true,
      //backgroundColor: Colors.yellow,
      //foregroundColor: Colors.blue,
    );
  }

  _onSpeedDialAction(int selectedActionIndex) {
    print('$selectedActionIndex Selected');
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.today),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }


}