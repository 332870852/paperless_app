import 'package:flutter/material.dart';
import 'package:paperless_app/constants.dart' show Constants;
import 'package:paperless_app/view/LoginPage.dart';
import 'package:paperless_app/view/filePage.dart';
import 'package:paperless_app/view/fileview/transferFilePage.dart';
import 'view/mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Constants.themeData,
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/LoginPage',
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/LoginPage': (context) => LoginPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}
