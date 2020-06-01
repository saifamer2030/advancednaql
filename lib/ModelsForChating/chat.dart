import 'dart:collection';
import 'dart:io';

import 'package:advancednaql/ModelsForChating/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.url, this.name, this.uid}) : super(key: key);
  final String url;
  final String name;
  final String uid;

  @override
  _ChatState createState() => _ChatState();
}

final mDatabase = FirebaseDatabase.instance.reference();

class _ChatState extends State<ChatPage> {
  @override
  final double _minimumPadding = 5.0;

  ChatPage get widget => super.widget;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  DatabaseReference reference1, reference2, reference3, reference4;
  TextEditingController _controller;
  List<Message> chatHolder;
  File image;
  String _cName = "";
  String _imgUrl = "";
  bool isLoaded = false;

  picker() async {
    DateTime time = DateTime.now();
    String formattedDate = DateFormat('hh:mm').format(time);
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      int timestamp = new DateTime.now().millisecondsSinceEpoch;
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child("PhotoChating");

      StorageUploadTask uploadTask = storageReference
          .child("img_" + timestamp.toString() + ".jpg")
          .putFile(img);
      image = img;
      var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
      String url1 = Imageurl.toString();
      sendMessage(msg: null, img: url1, time: formattedDate);
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    getLoggedInUser();
    _controller = new TextEditingController();
    chatHolder = new List<Message>();
    setState(() {
      isLoaded = true;
    });
  }

  void getUser() async {
    FirebaseUser usr = await _auth.currentUser();
    if (usr != null) {
      mDatabase
          .child("userdata")
          .child(usr.uid)
          .once()
          .then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        if (values != null) {
          setState(() {
            _cName = values['cName'].toString();
            _imgUrl = values['curi'].toString();
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    DateTime time = DateTime.now();
    String formattedDate = DateFormat('hh:mm').format(time);

    return new Scaffold(
      backgroundColor: const Color(0xffffffff),
//      appBar: new AppBar(
//        title: new Text(widget.name,style: TextStyle(color: Colors.black),),
//        backgroundColor: Colors.pinkAccent,
//        leading: Padding(
//          padding: const EdgeInsets.all(5.0),
//          child: Container(
//            height: 50,
//            width: 50,
//            decoration: BoxDecoration(
//
//                image: new DecorationImage(
//
//                  image: // NetworkImage(_imgUrl)
//                    new AssetImage("assets/logo.png"),
//
//                )),
//          ),
//        ),
//      ),
//
      body: Stack(
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: new Stack(
              //alignment:new Alignment(x, y)
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 86.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff4fc3f7),
                  ),
                ),
                Transform.translate(
                  offset: Offset(124.0, 39.0),
                  child:
                      // Adobe XD layer: 'logoBox' (shape)
                      Container(
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
//
//                Form(
//                  child: Padding(
//                    padding: EdgeInsets.only(
//                        top: _minimumPadding * 22,
//                        left: _minimumPadding,
//                        right: _minimumPadding),
//                    child: Container(
//                      width: MediaQuery.of(context).size.width,
//                      height: 80.0,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(7.0),
//                        color: const Color(0xffe5e5e5),
//                        boxShadow: [
//                          BoxShadow(
//                              color: const Color(0x33000000),
//                              blurRadius: 3)
//                        ],
//                      ),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Icon(Icons.call,color: Colors.lightBlueAccent,),
//                          Container(
//                            height: 50,
//                            width: 50,
//                            decoration: BoxDecoration(
//                                shape: BoxShape.circle,
//                                image: new DecorationImage(
//                                  fit: BoxFit.cover,
//                                  image: // NetworkImage(_imgUrl)
//                                  new AssetImage("assets/images/ic_driver.png"),
//
//                                )),
//                          ),
//
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
                Form(

                    child: Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding * 22,
                          left: _minimumPadding,
                          right: _minimumPadding),
                      child: new Positioned(
                          child: isLoaded
                              ? chatHolder.length == 0
                                  ? Center(child: Text("لا توجد محادثة"))
                                  : ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        if (chatHolder[index].senderUser ==
                                            user.uid) {
                                          if (chatHolder[index].img != null) {
                                            print("this Me =" +
                                                chatHolder[index].img);
                                          }
                                          return Bubble(
                                            message: chatHolder[index].message,
                                            time: formattedDate,
                                            delivered: true,
                                            isMe: true,
                                            img: chatHolder[index].img,
                                          );
                                        } else {
                                          return new Bubble(
                                            message: chatHolder[index].message,
                                            time: formattedDate,
                                            delivered: false,
                                            isMe: false,
                                            img: chatHolder[index].img,
                                          );
                                        }
                                      },
                                      itemCount: chatHolder.length,
                                      padding:
                                          new EdgeInsets.fromLTRB(0, 0, 0, 70),
                                    )
                              : Center(
                                  child: SpinKitPumpingHeart(
                                    color: const Color(0xff4fc3f7),
                                  ),
                                )),

                  ),
                ),
                new Positioned(
                    child: new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: new Container(
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Padding(
                            child: new TextField(
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              maxLines: null,
                              decoration: new InputDecoration.collapsed(
                                hintText: "اكتب رساله هنا",
                              ),
                              controller: _controller,
                            ),
                            padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                          ),
                        ),
                        new IconButton(
                            icon: new Icon(
                              Icons.insert_photo,
                              color: const Color(0xff4fc3f7),
                            ),
                            onPressed: () => picker()),
                        new IconButton(
                          onPressed: () => sendMessage(
                              msg: _controller.text,
                              img: null,
                              time: formattedDate),
                          icon: new Icon(
                            Icons.send,
                            color: const Color(0xff4fc3f7),
                          ),
                        ),
                      ],
                    ),
                    decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(Radius.circular(25.0)),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    margin: EdgeInsets.all(10.0),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  getLoggedInUser() async {
    user = await _auth.currentUser();
    reference1 = FirebaseDatabase.instance
        .reference()
        .child("Chats")
        .child(widget.uid)
        .child(user.uid /*+ " : " + widget.uid*/);
    reference2 = FirebaseDatabase.instance
        .reference()
        .child("Chats")
        .child(user.uid)
        .child(widget.uid /*+ " : " + user.uid*/);

    reference3 = FirebaseDatabase.instance
        .reference()
        .child("ChatList")
        .child(user.uid)
        .child("idTo");
    reference4 = FirebaseDatabase.instance
        .reference()
        .child("ChatList")
        .child(widget.uid)
        .child("idTo");

    reference1.onChildAdded.listen((Event event) {
      Map map = event.snapshot.value;

      Message m = Message.fromJson(map);
      setState(() {
        isLoaded = true;
        chatHolder.add(m);
      });
    }, onError: (Object o) {
      final DatabaseError error = o;
      print('Error: ${error.code} ${error.message}');
    });
    // here you write the codes to input the data into firestore
  }

  void sendMessage({String msg, String img, String time}) {
//    DateTime time = DateTime.now();
//    String formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(time);

    if (msg != "") {
      setState(() {
        isLoaded = true;
      });
      Map<String, String> map = new HashMap<String, String>();
      map.putIfAbsent("message", () => msg);
      map.putIfAbsent("img", () => img);
      map.putIfAbsent("senderUser", () => user.uid);
      map.putIfAbsent("recevdUser", () => widget.uid);
      map.putIfAbsent("recevdName", () => widget.name);
      map.putIfAbsent("timeData", () => time);
      reference1.push().set(map);
      reference2.push().set(map);
      reference3.set(widget.uid);
      reference4.set(user.uid);
      _controller.clear();
    } else {
      Fluttertoast.showToast(
          msg: "لا يمكن إرسال رسالة فارغة",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          fontSize: 15.0,
          textColor: Colors.black,
          backgroundColor: Theme.of(context).accentColor);
    }
  }
}

class Bubble extends StatelessWidget {
  Bubble({this.message, this.time, this.delivered, this.isMe, this.img});

  final String message, time, img;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? const Color(0xff85D0F2) : const Color(0xff85D0F2);
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final icon = delivered ? Icons.done : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          )
        : BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              img == null
                  ? Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(message),
                    )
                  : Padding(
                      padding: EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () => null,
                        child: Container(
                          child: Image.network(img),
                        ),
                      ),
                    ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 8.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 10.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
