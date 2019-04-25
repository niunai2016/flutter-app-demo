import 'package:flutter/material.dart';
import 'package:flutter_app_demo/pages/home/home.dart';
import 'package:flutter_app_demo/pages/page1/page1.dart';
import 'package:flutter_app_demo/pages/page2/page2.dart';
import 'package:flutter_app_demo/pages/page3/page3.dart';

class TabNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabNavState();
  }
}

class TabNavState extends State<TabNav> {
  int _tabIndex = 0;
  final _pageList = [
    new Home(),
    new Page1(),
    new Page2(),
    new Page3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('page1')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_square),
            title: Text('page2')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.panorama_fish_eye),
            title: Text('page3')
          )
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        }
      ),
    );
  }
}