import 'dart:io';

import 'package:advancednaql/classes/CommentClass.dart';
import 'package:advancednaql/classes/OrderClass.dart';
import 'package:advancednaql/classes/OrderDetailClass.dart';
import 'package:advancednaql/translation/app_localizations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:simple_slider/simple_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';
class orderProfile  extends StatefulWidget {

  String cId;
      String cdate;
  String clat1;
      String clong1;
  String clat2;
      String clong2;
  String cType;
      String cCategory;
  String cpayload;
      String cnocars;
  String ctime;
      bool cpublished;
  String cstarttraveltime;
      String curi;
  String cname;
      String  cDateID;
  orderProfile( this.cId,
      this.cdate,
      this.clat1,
      this.clong1,
      this.clat2,
      this.clong2,
      this.cType,
      this.cCategory,
      this.cpayload,
      this.cnocars,
      this.ctime,
      this.cpublished,
      this.cstarttraveltime,
      this.curi,
      this.cname,
      this.cDateID,);
  @override
  _orderProfileState createState() => _orderProfileState();
}

class _orderProfileState extends State<orderProfile> {
  String _userId;
  var _formKey1 = GlobalKey<FormState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<void> _launched;
  var _controller = ScrollController();
  bool favcheck=false;
  //List<OrderDetailClass> orderlist = [];
  List<CommentClass> commentlist = [];
  //var _controller = ScrollController();

  final double _minimumPadding = 5.0;
  bool _load=false;
  String cPhone;
  TextEditingController _commentController = TextEditingController();
  List<String> _imageUrls;

  @override
  void initState() {
    super.initState();

    final userdatabaseReference =
    FirebaseDatabase.instance.reference().child("userdata");
    userdatabaseReference
        .child(
     widget.cId,
    )
        .child("cPhone")
        .once()
        .then((DataSnapshot snapshot5) {
      setState(() {
        if (snapshot5.value != null) {
          setState(() {
            cPhone=snapshot5.value;
          });
        }

      });
    });
    final commentdatabaseReference =
    FirebaseDatabase.instance.reference().child("commentsdata").child(widget.cId);
    commentdatabaseReference.once().then((DataSnapshot snapshot) {
      var KEYS = snapshot.value.keys;
      var DATA = snapshot.value;
      //Toast.show("${snapshot.value.keys}",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

      commentlist.clear();

      for (var individualkey in KEYS) {
       // if (!blockList.contains(individualkey) &&user.uid != individualkey) {
          CommentClass commentclass =
          new CommentClass(
            DATA[individualkey]['cId'],
            DATA[individualkey]['cuserid'],
            DATA[individualkey]['cdate'],
            DATA[individualkey]['cheaddate'],
            DATA[individualkey]['ccoment'],
            DATA[individualkey]['cname'],
          );

        setState(() {
              commentlist.add(commentclass);
//              Toast.show("${favchecklist.length}/${coiffurelist.length}",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
            });
       // }
      }
    });
    FirebaseAuth.instance.currentUser().then((user) => user == null
        ? null
        : setState(() {
      _userId = user.uid;
    }));
  }
  @override
  Widget build(BuildContext context) {
//    Widget loadingIndicator = _load
//        ? new Container(
//      child: SpinKitCircle(color: Colors.blue),
//    )
//        : new Container();
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width:  MediaQuery.of(context).size.width,
              height: 86.0,
              decoration: BoxDecoration(

                color: const Color(0xff4fc3f7),
              ),
            ),
            Transform.translate(
              offset: Offset(0.0, -250.0),
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


            Form(
              key: _formKey1,
              child: Padding(
                  padding: EdgeInsets.only(top:_minimumPadding * 20,bottom: _minimumPadding * 0, right: _minimumPadding * 0,left: _minimumPadding * 0),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      //getImageAsset(),

                      Container(
                        //color: Colors.grey[200],
                          width: 300,height: 180,
                       child:
                       new Image.asset("assets/images/ic_bluecar.png",
                           fit: BoxFit.contain)

                      ),
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),
                      Card(

                        shape: new RoundedRectangleBorder(
                            side: new BorderSide(color:Colors.grey[400], width: 3.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        //borderOnForeground: true,
                        elevation: 10.0,
                        margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
                        child: Container(
                            height: 110,
                            color: Colors.grey[300],
                            padding: EdgeInsets.all(0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[

                                Positioned(
                                  top: 0,
                                  right: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "شاحنة ${widget.cCategory} حمولة ${widget.cpayload}",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: 'Gamja Flower',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                ),
                             /**   Positioned(
                                  top: 0,
                                  left: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[

                                        orderclass==null?Text(""):
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0),
                                          child: Text("خلال: ${ widget.cmodel}",
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: 'Gamja Flower',
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),**/

                                Positioned(
                                  top: 20,
                                  right: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[
                                             Padding(
                                               padding: const EdgeInsets.only(top:8.0),
                                               child: Text("الطالب: ${ widget.cname}",
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: 'Gamja Flower',
                                                fontStyle: FontStyle.normal),
                                        ),
                                             ),
                                        Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              /**  Positioned(
                                  top: 45,
                                  right: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[

                                        orderclass==null?Text(""):
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0),
                                          child: Text("الماركة: ${ orderclass.ccompany}",
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: 'Gamja Flower',
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        Icon(
                                          Icons.drive_eta,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),**/
                                Positioned(
                                  top: 45,
                                  right: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[

                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0),
                                          child: Text("الفترة: ${ widget.ctime}",
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: 'Gamja Flower',
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        Icon(
                                          Icons.calendar_today,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 70,
                                  right: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[

                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0),
                                          child: Text("من: الى: ",
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: 'Gamja Flower',
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),





                              ],
                            )),
                      ),
                      /**Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child:orderclass==null?Text(""): Text(orderclass.cdetail,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Gamja Flower',
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),**/
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 300 /*MediaQuery.of(context).size.width*/,
                          height: 40,
                          child: new RaisedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text("الطلب"),
                                Padding(
                                  padding: const EdgeInsets.only(left:10.0),
                                  child: Icon(Icons.check,color: Colors.white,),
                                ),
                              ],
                            ),
                            textColor: Colors.white,
                            color: const Color(0xff43A2CC),
                            onPressed: () {

                            },
//
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2*_minimumPadding,
                        width: _minimumPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Container(
                              width: 150 /*MediaQuery.of(context).size.width*/,
                              height: 40,
                              child: new RaisedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Text("تواصل عبر الدردشة",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 10,
                                      ),),
                                    Icon(Icons.mail_outline,color: Colors.blue,),
                                  ],
                                ),
                                textColor: Colors.black54,
                                color: Colors.grey[400],
                                onPressed: () {
                                },
//
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Container(
                              width: 150 /*MediaQuery.of(context).size.width*/,
                              height: 40,
                              child: new RaisedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Text("تواصل برقم الجوال",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 10,
                                      ),),
                                    Icon(Icons.phone,color: Colors.blue,),
                                  ],
                                ),
                                textColor: Colors.black54,
                                color: Colors.grey[400],
                                onPressed: () {
                                  if(cPhone!=null){
                                    _makePhoneCall('tel:$cPhone');
                                  }else{
                                    Toast.show("حاول مرة اخرى",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

                                  }


                                },
//
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 2*_minimumPadding,
                        width: _minimumPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Container(
                              width: 150 /*MediaQuery.of(context).size.width*/,
                              height: 40,
                              child: new RaisedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Text("مشاركة عبر التطبيق",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 10,
                                      ),),
                                    Icon(Icons.exit_to_app,color: Colors.blue,),
                                  ],
                                ),
                                textColor: Colors.black54,
                                color: Colors.grey[400],
                                onPressed: () {
                                },
//
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Container(
                              width: 150 /*MediaQuery.of(context).size.width*/,
                              height: 40,
                              child: new RaisedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Text("تواصل عن طريق الواتس",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 10,
                                      ),),
                                    Icon(Icons.call,color: Colors.blue,),
                                  ],
                                ),
                                textColor: Colors.black54,
                                color: Colors.grey[400],
                                onPressed: () {
                                  if(cPhone!=null){
                                   //var phone="01003208785";
                                    var whatsappUrl ="whatsapp://send?phone=$cPhone";
                                    canLaunch(whatsappUrl) != null? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                                  }else{
                                    Toast.show("حاول مرة اخرى",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

                                  }
                                    },
//
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 2*_minimumPadding,
                        width: _minimumPadding,
                      ),
                      Card(

                        shape: new RoundedRectangleBorder(
                            side: new BorderSide(color:Colors.grey[400], width: 3.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        //borderOnForeground: true,
                        elevation: 10.0,
                        margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
                        child: Container(
                            height: 330,
                            color: Colors.grey[300],
                            padding: EdgeInsets.all(0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:0.0,bottom: 65),
                                  child: Container(
                                    height:300,
                                   //color: Colors.red[300],
                                    child:  Expanded(
                                        child: Center(
                                          child: commentlist.length == 0
                                              ? new Text(
                                            "لا يوجد بيانات",
                                          )
                                              : new ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              controller: _controller,
                                             // reverse: true,
                                              itemCount: commentlist.length,
                                              itemBuilder: (BuildContext ctxt, int index) {
                                                return InkWell(
                                                    child:  _firebasedata(
                                                      index,
                                                      commentlist.length,
                                                      commentlist[index].cId,
                                                      commentlist[index].cuserid,
                                                      commentlist[index].cdate,
                                                      commentlist[index].cheaddate,
                                                      commentlist[index].ccoment,
                                                      commentlist[index].cname,

                                                    ),
//                                                    onTap: () {
//                                                      if(_userId==commentlist[index].cuserid){
//                                                        FirebaseDatabase.instance
//                                                            .reference()
//                                                            .child("commentsdata")
//                                                            .child(widget.cId)
//                                                            .child(commentlist[index].cheaddate)
//                                                            .remove()
//                                                            .whenComplete(() {
//
//                                                          setState(() {
//                                                            commentlist.removeAt(index);
//                                                          });
//                                                          Toast.show("تم حذف التعليق", context,
//                                                              duration: Toast.LENGTH_SHORT,
//                                                              gravity: Toast.BOTTOM);
//                                                        });
//                                                      }
//                                                      else{
//                                                        Toast.show("ليس تعليقك", context,
//                                                            duration: Toast.LENGTH_SHORT,
//                                                            gravity: Toast.BOTTOM);
//                                                      }
//                                                    }
                                                    );
                                              }),
                                         /** new ListView.builder(
                                              key: refreshKey,
                                              physics: BouncingScrollPhysics(),
                                              //controller: _controller,
                                              itemCount: commentlist.length,
                                              itemBuilder: (_, index) {
                                                return Dismissible(
                                                  key: Key(commentlist[index].cId),
                                                  background: Container(
                                                      color: Colors.red,
                                                      padding: EdgeInsets.only(left: 20),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Icon(
                                                          Icons.delete_forever,
                                                          color: Colors.white,
                                                          size: 60,
                                                        ),
                                                      )),
                                                  direction: DismissDirection.startToEnd,
                                                  onDismissed: (direction) {
                                                    setState(() {
                                                      setState(() {
                                                        commentlist.removeAt(index);
                                                     });
                                                     // commentlist.removeAt(index);
                                                      //Toast.show(userfavlist[index].cId+"//"+_userId,context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
                                                      if(_userId==commentlist[index].cuserid){
                                                        FirebaseDatabase.instance
                                                            .reference()
                                                            .child("commentsdata")
                                                            .child(widget.cId)
                                                            .child(commentlist[index].cheaddate)
                                                            .remove()
                                                            .whenComplete(() {

//                                                          setState(() {
//                                                            commentlist.removeAt(index);
//                                                          });
                                                          Toast.show("تم حذف التعليق", context,
                                                              duration: Toast.LENGTH_SHORT,
                                                              gravity: Toast.BOTTOM);
                                                        });
                                                      }
                                       else{
                                                        Toast.show("ليس تعليقك", context,
                                                            duration: Toast.LENGTH_SHORT,
                                                            gravity: Toast.BOTTOM);
                                                      }
                                                    });
                                                  },
                                                  child:
                                                  _firebasedata(
                                                    index,
                                                    commentlist.length,
                                                    commentlist[index].cId,
                                                    commentlist[index].cuserid,
                                                    commentlist[index].cdate,
                                                    commentlist[index].cheaddate,
                                                    commentlist[index].ccoment,
                                                    commentlist[index].cname,

                                                  ),
                                                );
                                              }),**/
                                        )),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child:  Row(
                                      children: <Widget>[
                                        Container(
                                          width: 320,
                                          height: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Card(
                                              elevation: 0.0,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Directionality(
                                                textDirection: TextDirection.rtl,
                                                child: TextFormField(
                                                  textAlign: TextAlign.right,
                                                  keyboardType: TextInputType.text,
                                                  textDirection: TextDirection.rtl,
                                                   controller: _commentController,
                                                  validator: (String value) {
                                                    if ((value.isEmpty)) {
                                                      return 'برجاء ادخال التعليق';
                                                    }
                                                  },

                                                  onChanged: (value) {},
                                                  //  controller: controller,
                                                  decoration: InputDecoration(
                                                      errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                                                      labelText: "التعليق",
                                                     // hintText: "التعليق",

//                                prefixIcon: Icon(
//                                  Icons.phone_iphone,
//                                  color: Colors.pinkAccent,
//                                ),
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(5.0)))
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            if (_formKey1.currentState.validate()) {
                                              createRecord();

//                                                setState(() {
//                                                  _load2 = true;
//                                                });


                                            }

                                          },
                                          child: Icon(
                                            Icons.add_comment,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),





                                  ),
                                ),





                              ],
                            )),
                      ),

                    ],
                  )),
            ),
//            new Align(
//              child: loadingIndicator,
//              alignment: FractionalOffset.center,
//            ),

          ],
        ),
      ),
    );
  }

  void createRecord() {


      final userdatabaseReference =
      FirebaseDatabase.instance.reference().child("userdata");
      userdatabaseReference
          .child(_userId)
          .child("cName")
          .once()
          .then((DataSnapshot snapshot5) {
        setState(() {
          if (snapshot5.value != null) {
            setState(() {
              DateTime now = DateTime.now();

              // String date1 ='${now.year}-${now.month}-${now.day}';// ${now.hour}:${now.minute}:00.000';
              String date ='${now.year}-${now.month}-${now.day}-${now.hour}-${now.minute}-00';
              final commentbaseReference =
              FirebaseDatabase.instance.reference().child("commentsdata");
              commentbaseReference.child(widget.cId).child(_userId+date).set({
                'cId': widget.cId,
                'cuserid': _userId,
                'cdate':now.toString(),
                'cheaddate':_userId+date,
                'ccoment':_commentController.text,
                'cname': snapshot5.value,
              }).whenComplete(() {
                Toast.show("تم التعليق بنجاح",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
                CommentClass commentclass =
                new CommentClass(
                    widget.cId,
                  _userId,
                  now.toString(),
                  _userId+date,
                  _commentController.text,
                  snapshot5.value,
                );
                setState(() {
                  commentlist.add(commentclass);
                  _commentController.text="";
            //      var cursor = (5/commentlist.length)* _controller.position.maxScrollExtent;//specific item

                  _controller.animateTo(                                      // NEW
                    _controller.position.maxScrollExtent*1.1,                     // NEW
                    duration: const Duration(milliseconds: 500),                    // NEW
                    curve: Curves.ease,                                             // NEW
                  );
                });

              //  _controller.animateTo(0.0,curve: Curves.easeInOut, duration: Duration(seconds: 1));
              }).catchError((e) {
                Toast.show(e,context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
                setState(() {
                  //  _load2 = false;
                });
              });

            });
          }
        });
      });


   // })
   // );



  }
  Widget _firebasedata(
  index,
  length,
  cId,
  cuserid,
  cdate,
  cheaddate,
  ccoment,
  cname,


      ) {
    return Padding(
      padding: const EdgeInsets.only(top:5.0,right: 5.0, left: 5.0),
      child: Card(
        shape: new RoundedRectangleBorder(
            side: new BorderSide(color: Colors.grey, width: 3.0),
            borderRadius: BorderRadius.circular(10.0)),
        //borderOnForeground: true,
        elevation: 10.0,
        margin: EdgeInsets.all(1),
        child: InkWell(
          onTap: () {
            setState(() {

                print("kkkkkkkkkkkk");
                if(_userId==commentlist[index].cuserid){
                  FirebaseDatabase.instance
                      .reference()
                      .child("commentsdata")
                      .child(widget.cId)
                      .child(commentlist[index].cheaddate)
                      .remove()
                      .whenComplete(() {

                    setState(() {
                      commentlist.removeAt(index);
                    });
                    Toast.show("تم حذف التعليق", context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.BOTTOM);
                  });
                }
                else{
                  Toast.show("ليس تعليقك", context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM);
                }
           //   }),
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) =>
//                        CoifUserProlile(cId, curi, cName, _userId)));
            });
          },
          child: Container(
              padding: EdgeInsets.all(8),
              child: Container(
                  width:350 ,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width:300,
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(cname,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                    ),
                                    textDirection: TextDirection.rtl,)),
                            ),
                            Icon(
                              Icons.person,
                              size: 25,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:2.0, right: 30.0,bottom: 2,left: 2.0),
                        child:Align(
                            alignment: Alignment.topRight,
                            child: Text(ccoment,textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),)),
                      ),
                    ],
                  )
              )),
        ),
      ),
    );
  }
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}