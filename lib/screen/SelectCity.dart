import 'dart:io';

import 'package:advancednaql/classes/CityClass.dart';
import 'package:advancednaql/classes/CityRegionClass.dart';
import 'package:advancednaql/classes/RegionClass.dart';
import 'package:advancednaql/translation/app_localizations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';

class SelectCity  extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {

  var connectivityResult =  (Connectivity().checkConnectivity());

  bool _load = false;
  var _formKey1 = GlobalKey<FormState>();
  List<CityClass> regionlist = [];

  List<String> cityList = [];

  final double _minimumPadding = 5.0;

  @override
  void initState() {
    super.initState();

    final regiondatabaseReference =
    FirebaseDatabase.instance.reference().child("City");
    regiondatabaseReference.once().then((DataSnapshot snapshot) {
      var KEYS = snapshot.value.keys;
      var DATA = snapshot.value;
      //Toast.show("${snapshot.value.keys}",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
      regionlist.clear();
      for (var individualkey in KEYS) {
        CityClass regionclass =new CityClass(
          DATA[individualkey]['ccid'],
          DATA[individualkey]['ccity'],
          DATA[individualkey]['cregion'],

        );
        setState(() {
          regionlist.add(regionclass);
        });

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _load
        ? new Container(
      child: SpinKitCircle(color: Colors.blue),
    )
        : new Container();
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;
  //  print('nnnnnnnn/${regionlist.length}');

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Stack(
          children: <Widget>[
       /**     Column(
              children: <Widget>[
                Container(
                  width:  MediaQuery.of(context).size.width,
                  height: 86.0,
                  decoration: BoxDecoration(

                    color: const Color(0xff4fc3f7),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0.0, -42.0),
                  child:
                  // Adobe XD layer: 'logoBox' (shape)
                  Center(
                    child: Container(
                      width: 166.0,
                      height: 67.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.center,
                          matchTextDirection: true,
                          repeat: ImageRepeat.noRepeat,
                          image: AssetImage("assets/logowhite.png"),
                        ),
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xff4fc3f7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
**/


            Form(
              key: _formKey1,
              child: Padding(
                  padding: EdgeInsets.only(top:_minimumPadding * 2,bottom: _minimumPadding * 2, right: _minimumPadding * 2,left: _minimumPadding * 2),
                  child: new ListView.builder(
                    itemCount: regionlist.length,
                    itemBuilder: (context, i) {
                      return new ExpansionTile(
                        title: new Text(regionlist[i].cregion, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                        children: <Widget>[
                          new Column(
                            children:
                            _buildExpandableContent(regionlist[i]),
                          ),
                        ],
                      );
                    },
                  ),
              ),
            ),
            new Align(
              child: loadingIndicator,
              alignment: FractionalOffset.center,
            ),

          ],
        ),
      ),
    );
  }
  _buildExpandableContent( region) {
    List<Widget> columnContent = [];
    List<String> ccityy = [];

    List<bool> check = [];
    bool val = false;
    ccityy=region.ccity.split(",");
    check.clear();
    for (String content in ccityy){
      check.add(true);
      int i=ccityy.indexOf(content);
      columnContent.add(
        InkWell(
          onLongPress: () => setState(() {
            //content=content+"selected";
            print("11${check[ccityy.indexOf(content)]}jjjjjj${ccityy.indexOf(content)}");
//
//                check[ccityy.indexOf(content)] = !check[ccityy.indexOf(content)];
//                print("22${check[ccityy.indexOf(content)]}jjjjjj${ccityy.indexOf(content)}");
//val=check[ccityy.indexOf(content)];
          })
          ,

          onTap: () {
              setState(() {
                //content=content+"selected";
//                print("11${check[ccityy.indexOf(content)]}jjjjjj${ccityy.indexOf(content)}");
//
//                check[ccityy.indexOf(content)] = !check[ccityy.indexOf(content)];
//                print("22${check[ccityy.indexOf(content)]}jjjjjj${ccityy.indexOf(content)}");
//val=check[ccityy.indexOf(content)];
              });

            },

        child: new ListTile(
            title: new Text(content, style: new TextStyle(fontSize: 18.0),),
           /** leading: new Checkbox(value:check[ccityy.indexOf(content)],
              onChanged: (bool val1) {
                setState(() {
               //   check[ccityy.indexOf(content)] = !val1;
                  //  _groups[index].checked = val;
                });
              },
            ),**/
          ),
        ),
      );
  }
    return columnContent;
  }


}

