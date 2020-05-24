import 'package:flutter/material.dart';

import 'fragmentbar.dart';
import 'screen/Splash.dart';
import 'screen/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      routes: <String,WidgetBuilder>{
        '/landingpage':(BuildContext context)=>new MyApp(),
        '/splash':(BuildContext context)=>new Splash(),
        '/login':(BuildContext context)=>new LoginScreen2(),
        '/signupprovider':(BuildContext context)=>new LoginScreen2(),
        '/signupuser':(BuildContext context)=>new Fragmentnaql(),

      },
    );
  }
}

