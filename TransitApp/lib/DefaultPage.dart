import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Map/HomeWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const homeWidget(),

    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.info_circle),
            onPressed: () {
              showAboutDialog(
                  context: context,
                  applicationName: 'TransitApp',
                  applicationVersion: 'Version 1',
                  children: [
                    Text('TransitApp'),
                  ],
              );
            }
          )
        ]
      ),
      body: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_fill),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock_solid),
            label: 'Scheduled',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chart_bar_circle),
            label: 'Analytics',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}




