import 'package:flutter/material.dart';
import 'package:flutter_dart_side_animations_demo/pages/pictures.page.dart';
import 'package:flutter_dart_side_animations_demo/pages/profile.page.dart';

import 'pages/home.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        'profile': (context) =>
            ProfilePage(ModalRoute.of(context).settings.arguments),
        'pictures': (context) => PicturesPage(),
      },
    );
  }
}
