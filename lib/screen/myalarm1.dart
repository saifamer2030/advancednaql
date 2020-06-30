import 'package:advancednaql/classes/AlarmaClass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'ModelsForChating/chat.dart';
import 'login.dart';

class MyAlarms1 extends StatefulWidget {
  @override
  _MyAlarms1State createState() => _MyAlarms1State();
}

class _MyAlarms1State extends State<MyAlarms1> {
  List<AlarmaClass> alarmlist = [];
  bool _load = false;
  String _userId;
  final databasealarm = FirebaseDatabase.instance.reference().child("Alarm");

  @override
  void initState() {
    super.initState();
    setState(() {
      _load = true;
    });

    FirebaseAuth.instance.currentUser().then((user) => user == null
        ?
    Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
        builder: (context) => LoginScreen2(), maintainState: false))
        :

    setState(() {
      _userId = user.uid;
      final databasealarm =
      FirebaseDatabase.instance.reference().child("Alarm");

      databasealarm.child(_userId).once().then((DataSnapshot data1) {
        var DATA = data1.value;
        var keys = data1.value.keys;
        alarmlist.clear();
        //  namelist.clear();
        for (var individualkey in keys) {
          AlarmaClass alarmaalass = new AlarmaClass(
            DATA[individualkey]['alarmid'],
            DATA[individualkey]['wid'],
            DATA[individualkey]['Name'],
            DATA[individualkey]['cType'],
            DATA[individualkey]['cDateID'],
            DATA[individualkey]['arrange'],
          );
          setState(() {
            alarmlist.add(alarmaalass);
            setState(() {
              print("size of list : 5");
              alarmlist.sort((alarm1, alarm2) =>
                  alarm1.arrange.compareTo(alarm2.arrange));
            });
          });
          print("kkkkkkk${DATA[individualkey]['arrange']}");
        }
      });
    }));
  }

  final double _minimumPadding = 5.0;
  var _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _load
        ? new Container(
            child: SpinKitCircle(color: Colors.blue),
          )
        : new Container();
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      floatingActionButton: Container(
        height: 30.0,
        width: 30.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              _controller.animateTo(0.0,
                  curve: Curves.easeInOut, duration: Duration(seconds: 1));
            },
            backgroundColor: Colors.white,
            elevation: 20.0,
            child: Icon(
              Icons.arrow_drop_up,
              size: 50,
              color: const Color(0xff4fc3f7),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width:  MediaQuery.of(context).size.width,
                height: 86.0,
                decoration: BoxDecoration(

                  color: const Color(0xff4fc3f7),
                ),
                child: InkWell(
                  onTap: () => Navigator.pop(context),

                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 20,
                    height: 20,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back)),
                  ),
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

          Expanded(
              child: alarmlist.length == 0
                  ? Center(
                      child:  loadingIndicator,)
                  : new ListView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: _controller,
                      itemCount: alarmlist.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return firebasedata(
                            index,
                            alarmlist.length,
                            alarmlist[index].alarmid,
                            alarmlist[index].wid,
                            alarmlist[index].Name,
                            alarmlist[index].cType,
                            alarmlist[index].cDateID,
                            alarmlist[index].arrange
                        );

                      })

          )
        ],
      ),
    );
  }
  Widget firebasedata(
      int position,
      int length,
      String alarmid,
      String wid,
      String Name,
      String cType,
      String cDateID,
      int arrange,
      ) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        // color: Colors.grey[300],
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)),
        //borderOnForeground: true,
        elevation: 10.0,
        margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
        child: InkWell(
          onTap: () {
            setState(() {
              if (cType == "chat") {
                final userdatabaseReference =
                FirebaseDatabase.instance.reference().child("userdata");
                userdatabaseReference
                    .child(wid)
                    .child("cName")
                    .once()
                    .then((DataSnapshot snapshot5) {
                  setState(() {
                    if (snapshot5.value != null) {
                      setState(() {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) => new ChatPage(
                                  name: snapshot5.value, uid: wid)),
                        );
                      });
                    }
                  });
                });
              }
            });
          },
          child: Container(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cType == "love"
                          ? new Icon(
                        Icons.favorite,
                        color: Colors.blue,
                      )
                          : new Icon(
                        Icons.mail_outline,
                        color: Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: cType == "love"
                                ? Text(
                              " $Name منحك اعجاب ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                //    fontWeight: FontWeight.bold
                              ),
                            )
                                : Text(
                              " رسالة جديدة من $Name",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                //    fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          new Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
