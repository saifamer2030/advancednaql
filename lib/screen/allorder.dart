
import 'package:advancednaql/classes/OrderClass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:toast/toast.dart';


class AllOrder extends StatefulWidget {

  @override
  _AllOrderState createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {
  List<OrderClass> orderlist = [];
  List<String> namelist = [];

  String _userId, _userType;
  final orderdatabaseReference =FirebaseDatabase.instance.reference().child("orderdata");


  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.currentUser().then((user) => user == null
        ? null
        : setState(() {
            _userId = user.uid;
              final orderdatabaseReference =FirebaseDatabase.instance.reference().child("orderdata");
      orderdatabaseReference.once().then((DataSnapshot data) {
        var dateId = data.value.keys;

        orderlist.clear();
        namelist.clear();
        for (var id in dateId) {
          orderdatabaseReference.child(id).once().then((DataSnapshot data1) {

            var DATA = data1.value;
            var keys = data1.value.keys;

            for (var individualkey in keys) {
          OrderClass orderclass =
          new OrderClass(
            DATA[individualkey]['cId'],
            DATA[individualkey]['cdate'],
            DATA[individualkey]['clat1'],
            DATA[individualkey]['clong1'],
            DATA[individualkey]['clat2'],
            DATA[individualkey]['clong2'],
            DATA[individualkey]['cType'],
            DATA[individualkey]['cCategory'],
            DATA[individualkey]['cpayload'],
            DATA[individualkey]['cnocars'],
            DATA[individualkey]['ctime'],
            DATA[individualkey]['cpublished'],
            DATA[individualkey]['cstarttraveltime'],
            DATA[individualkey]['curi'],
          );
          //String  cName;
          final userdatabaseReference =
          FirebaseDatabase.instance.reference().child("userdata");
          userdatabaseReference
              .child(DATA[individualkey]['cId'],)
              .child("cName")
              .once()
              .then((DataSnapshot snapshot5) {
            setState(() {
              if (snapshot5.value != null) {
                setState(() {
                  namelist.add(snapshot5.value);
                 // cName = snapshot.value;
                });
              } else {
                setState(() {
                  namelist.add("no name");
                  // cName = snapshot.value;
                });
              }
            });
          });
          setState(() {
            orderlist.add(orderclass);

          });
        }
      });}
              });


          }));
  }

  final double _minimumPadding = 5.0;
  var _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
              color: Colors.pinkAccent,
            ),
          ),
        ),
      ),
      body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/bg_grad_gold.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: true
                      ? orderlist.length == 0
                          ? Center(
                              child: Text(
                              "لا توجد بيانات",
                              style: TextStyle(color: Colors.grey),
                            ))
                          : new ListView.builder(
                              physics: BouncingScrollPhysics(),
                              controller: _controller,
                              itemCount: orderlist.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return InkWell(
                                    child: firebasedata(
                                      index,
                                      orderlist.length,
                                      orderlist[index].cId,
                                      orderlist[index].cdate,
                                      orderlist[index].clat1,
                                      orderlist[index].clong1,
                                      orderlist[index].clat2,
                                      orderlist[index].clong2,
                                      orderlist[index].cType,
                                      orderlist[index].cCategory,
                                      orderlist[index].cpayload,
                                      orderlist[index].cnocars,
                                      orderlist[index].ctime,
                                      orderlist[index].cpublished,
                                      orderlist[index].cstarttraveltime,
                                        orderlist[index].curi,
                                      namelist[index],


                                    ),
                                    onTap:
                                        () {}
                                    );
                              })
                      : null)
            ],
          )),
    );
  }

  Widget firebasedata(
    int position,
    int length,
  String cId,
  String cdate,
  String clat1,
  String clong1,
  String clat2,
  String clong2,
  String cType,
  String cCategory,
  String cpayload,
  String cnocars,
  String ctime,
  bool cpublished,
  String cstarttraveltime,
      String  curi,
      String  cname,
  ) {

    return Card(

      shape: new RoundedRectangleBorder(
          side:
              new BorderSide(color: Theme.of(context).accentColor, width: 1.0),
          borderRadius: BorderRadius.circular(4.0)),
      //borderOnForeground: true,
      elevation: 10.0,
      margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
      child: InkWell(
        onTap: () {
//          setState(() {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => CoifUserProlile(
//                        cId, curi, cName, _userId,
//                        cRate: cRate)));
//          });
        },
        child: Container(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                Container(
                  child: curi != "a"
                      ? new Image.network(
                    'https://www.almrsal.com/wp-content/uploads/2015/09/fakhama.jpeg',
                    fit: BoxFit.cover,
                  )
                      : new Image.network(
                    'https://www.almrsal.com/wp-content/uploads/2015/09/fakhama.jpeg',
                    fit: BoxFit.cover,
                  ),
                  width: 100,
                  height:130,
                ),
                Container(
                  height: 130,
                  child: Stack(
                    //alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      cType == "order"
                          ? Positioned(
                        top: 0,
                        left: 0,
                        child: Container(

                          height: 40,
                          width: 60,
                          color: Colors.green,
                          child: Text(
                            "طلب",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gamja Flower',
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      )
                          : Positioned(
                        top: 0,
                        left: 0,
                        child: Container(

                          height: 40,
                          width: 60,
                          color: Colors.red,
                          child: Text(
                            "عرض",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gamja Flower',
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child:Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "$cCategory حمولة  $cpayload",textDirection: TextDirection.rtl,textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Gamja Flower',
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 0,
                        child:Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:cname!=null? Text(
                            cname,textDirection: TextDirection.rtl,textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: 'Gamja Flower',
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal),
                          ):Text(" "),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: 0,
                        child:Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[
                              Text(
                                "الواجهة: ",textDirection: TextDirection.rtl,textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Gamja Flower',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.normal),
                              ),
                              SizedBox(
                                height: _minimumPadding,
                                width: _minimumPadding,
                              ),
                              Text(
                                "الواجهة: ",textDirection: TextDirection.rtl,textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Gamja Flower',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.normal),
                              ),
                              SizedBox(
                                height: _minimumPadding,
                                width: _minimumPadding,
                              ),
                              Text(
                                "وقت التحرك: ",textDirection: TextDirection.rtl,textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Gamja Flower',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.normal),
                              ),
                              SizedBox(
                                height: _minimumPadding,
                                width: _minimumPadding,
                              ),
                              Text(
                                "منذ: $cdate",textDirection: TextDirection.rtl,textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Gamja Flower',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 5, top: 5, bottom: 5),
                            child:Text(
                              "                                                                    ",textDirection: TextDirection.rtl,textAlign: TextAlign.right,

                            ),
                          ),


                        ],
                      ),

                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }



}
