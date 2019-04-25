/**
 * App的主程序
 */
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/app-router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyAppRouter();
  }
}