# flutter-app-demo
flutter基础框架搭建

## 基础搭建

```
$ flutter create flutter_app_demo
```
具体环境搭建、下载xCode、配置编辑器和应用运行等问题查看[flutter中文官网](https://flutterchina.club/setup-macos/)

## 路由和导航栏
`flutter`自带底部导航栏和顶部导航栏以及路由的设置，无需自行构建


### 路由搭建
在`lib`中新建`app-router.dart`，用于存放路由，主要依赖于flutter中的`MaterialApp`。(注：底部导航<a href="#tabNav">tab-nav</a>的配置下面会讲到)

在`MaterialApp`中配置`routes`,设置`home`(注：如果在`routes`中设置了`根页面'/'`则无需再设置`home`),`MaterialApp`的其他用法请看官网API：[MaterialApp](https://docs.flutter.io/flutter/material/MaterialApp-class.html)

```
/**
 * app的路由目录
 */
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/common/tab-nav.dart';
import 'package:flutter_app_demo/pages/home/home.dart';
import 'package:flutter_app_demo/pages/page1/page1.dart';
import 'package:flutter_app_demo/pages/page2/page2.dart';
import 'package:flutter_app_demo/pages/page3/page3.dart';
import 'package:flutter_app_demo/pages/list/list.dart';
import 'package:flutter_app_demo/pages/detail/detail.dart';

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
        '/list': (BuildContext context) => List(),
        '/detail': (BuildContext context) => Detail(),
      },
    );
  }
}
```

**修改main.dart**
本案例的主程序是main.dart，上面讲到了如何配置路由，现在我们把写好的路由都依赖到主程序中，运行此程序就是运行整个app

```
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

```

**新建各路由页面**
在`lib`下新建`pages`，用于存放各路由的视图页面，分别新建`home/home.dart`、`page1/page1.dart`、`page2/page2.dart`、`page3/page3.dart`、`list/list.dart`、`detail/detail.dart`。

因页面太多，只写一个页面，其他页面自行模仿。此示例也用到了顶部导航栏：`flutter`自带的[AppBar](https://docs.flutter.io/flutter/material/AppBar-class.html)

```
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home')
      ),
      body: Center(
        child: Text('home')
      )
    );
  }
}

```

### <a name="tabNav">底部导航栏配置TabNav</a>
在lib下新建`common/tab-nav.dart`，通过[BottomNavigationBar](https://docs.flutter.io/flutter/material/BottomNavigationBar-class.html)实现，示例如下：（自行了解[Icon](https://docs.flutter.io/flutter/widgets/Icon-class.html)）

```
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
  var appBarTitles = ['home', 'page1', 'page2', 'page3'];
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

```


