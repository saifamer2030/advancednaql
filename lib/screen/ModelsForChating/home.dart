import 'package:advancednaql/classes/UserRegDataClass.dart';
import 'package:advancednaql/screen/ModelsForChating/state.dart';
import 'package:advancednaql/translation/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'ChatList.dart';
import 'chat.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

final mDatabase = FirebaseDatabase.instance.reference();

class _HomePageState extends State<HomePage> {
  final double _minimumPadding = 5.0;
  List<CoiffureRegDataClass> userList;
  FirebaseAuth _firebaseAuth;
  FirebaseUser curUser;
  List<ChatList> chatList2;
  StateModel appState;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userList = new List();
    chatList2 = new List();
    _firebaseAuth = FirebaseAuth.instance;

    gitcurUser();
    getFirebaseLoggedInUser();
  }

  void gitcurUser() async {
    await _firebaseAuth.currentUser().then((usr) {
      if (usr != null) {
        curUser = usr;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
/*
   appState = StateWidget.of(context).state;
*/
    return _buildContentView(
      child: _buildHomeContent(),
    );
  }

/*  Widget _buildContent() {

    if (appState.isLoading) {
      return _buildContentView(
        child: _buildLoadingIndicator(),
      );
    } else if (!appState.isLoading && appState.user == null) {
      return new MyLogIn();
    } else {
      return _buildContentView(
        child: _buildHomeContent(),
      );
    }
  }*/

  Container _buildContentView({Widget child}) {
    return Container(
      child: child,
    );
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  Scaffold _buildHomeContent() {
    return Scaffold(
//        appBar: new AppBar(
//            title: new Text("أخر المحادثات"),
//            backgroundColor: Theme
//                .of(context)
//                .secondaryHeaderColor,
//            leading: Image(image: AssetImage("assets/images/logo.png")),
//
//        ),
        body: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
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
          offset: Offset(124.0, 39.0),
          child:
              // Adobe XD layer: 'logoBox' (shape)
              Container(
                width: 156.0,
                height: 57.0,
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
        Padding(
          padding: EdgeInsets.only(
              top: _minimumPadding * 22,
              left: _minimumPadding,
              right: _minimumPadding),
          child: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              child: isLoaded
                  ? userList.length == 0
                      ? Center(child: Text(Translations.of(context).translate('history_chat')))
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext ctxt, int index) {
                            return new InkWell(
                              child: Row(children: <Widget>[
                                new Container(
                                  child: new Text(userList[index].cName[0],
                                      style: new TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900)),
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey),
                                  padding: new EdgeInsets.all(20.0),
                                ),
                                new Padding(
                                    child: new Text(userList[index].cName),
                                    padding: new EdgeInsets.all(10.0))
                              ]),
                              onTap: () => Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new ChatPage(
                                            name: userList[index].cName,
                                            uid: userList[index].cId)),
                              ),
                            );
                          },
                          itemCount: userList.length,
                          padding: const EdgeInsets.all(10.0),
                        )
                  : Center(
                      child: SpinKitCircle(color: Colors.blue),
                    )),
        ),
      ],
    ));
  }

  Future<void> getFirebaseLoggedInUser() async {
    mDatabase.child("userdata").once().then((DataSnapshot snapshot) {
      Map<String, dynamic> mapOfMaps = Map.from(snapshot.value);
      mapOfMaps.values.forEach((value) {
        CoiffureRegDataClass usr =
            CoiffureRegDataClass.fromJson(Map.from(value));

/*        HelperFunc.showToast("curUser ${curUser.uid}", Colors.pink);*/
        mDatabase
            .child("ChatList")
            .child(curUser.uid)

            .child("idTo")
            .once()
            .then((DataSnapshot snapshot2) {
          chatList2.add(new ChatList(snapshot2.value, "2"));
/*
              HelperFunc.showToast("idTo ${snapshot2.value}", Colors.pink);
*/
          if (usr.cId == snapshot2.value) {
/*
            HelperFunc.showToast("idTo ${usr.cName}", Colors.pink);
*/
            setState(() {
              isLoaded = true;
            });
            setState(() {
              userList.add(usr);
            });
            return;
          }
        });
      });
    }).whenComplete(() => doSetState());
  }

  bool stateIsSet = false;

  void doSetState() {
    if (!stateIsSet) {
      setState(() {});
      stateIsSet = true;
    }
  }
}
