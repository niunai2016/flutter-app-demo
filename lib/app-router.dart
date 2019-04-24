/**
 * app的路由目录
 */
import 'package:flutter/material.dart';
import 'pages/home/home.dart';

class MyAppRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}