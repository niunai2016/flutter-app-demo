/**
 * app的路由目录
 */
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/common/tab-nav.dart';
import 'package:flutter_app_demo/pages/home/home.dart';
import 'package:flutter_app_demo/pages/page1/page1.dart';
import 'package:flutter_app_demo/pages/page2/page2.dart';
import 'package:flutter_app_demo/pages/page3/page3.dart';

class MyAppRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNav(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/page1': (BuildContext context) => Page1(),
        '/page2': (BuildContext context) => Page2(),
        '/page3': (BuildContext context) => Page3(),
      },
    );
  }
}