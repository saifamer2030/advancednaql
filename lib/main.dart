import 'package:advancednaql/screen/addNewAds.dart';
import 'package:advancednaql/screen/myadvertisement.dart';
import 'package:advancednaql/screen/pledge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ModelsForChating/home.dart';
import 'fragmentbar.dart';
import 'screen/Splash.dart';
import 'screen/login.dart';
import 'screen/network_connection.dart';
import 'screen/signup.dart';
import 'screen/neworder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'translation/app_localizations.dart';
import 'translation/applic.dart';
import 'translation/helper_func.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
//language
 //set def lang or retrieve saved
  void checkDefLang() async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    Locale curLoc;
    if (sPref.getString('defLangCode') == null &&
        sPref.getString('defLangCountry') == null) {
      HelperFunc.setFirstLang();
      curLoc = new Locale('ar', 'EG');
    } else {
      curLoc = new Locale(
          sPref.getString('defLangCode'), sPref.getString('defLangCountry'));
    }
    applic.onLocaleChanged(curLoc);
  }

  SpecificLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState() {
    super.initState();
    checkDefLang();

    _localeOverrideDelegate = new SpecificLocalizationDelegate(null);
    applic.onLocaleChanged = onLocaleChange;
  }

  onLocaleChange(Locale locale) {
    setState(() {
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Naql',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      routes: <String,WidgetBuilder>{
        '/landingpage':(BuildContext context)=>new MyApp(),
        '/splash':(BuildContext context)=>new Splash(),
        '/login':(BuildContext context)=>new LoginScreen2(),
        '/signup':(BuildContext context)=>new SignUp(),
        '/fragmentnaql':(BuildContext context)=>new Fragmentnaql(),
        '/addnewads':(BuildContext context)=>new AddNewAds(),
        '/myadvertisement':(BuildContext context)=>new MyAdvertisement(),
        '/homechatroom':(BuildContext context)=>new HomePage(),
        '/pledge':(BuildContext context)=>new Pledge(),
        '/neworder':(BuildContext context)=>new newOrder(),
        '/conection':(BuildContext context)=>new ConnectionScreen(),
      },
      localizationsDelegates: [
              _localeOverrideDelegate,
              const TranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: applic.supportedLocales(),
    );
  }
}

