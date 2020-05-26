
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
          );
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: cId != null
                          ? new Image.network(
                        'https://www.almrsal.com/wp-content/uploads/2015/09/fakhama.jpeg',,
                              fit: BoxFit.cover,
                            )
                          : new Image.network(
                              'https://www.almrsal.com/wp-content/uploads/2015/09/fakhama.jpeg',
                              fit: BoxFit.cover,
                            ),
                      height: 240,
                      width: 350,
                    ),
                    cpublished == true
                        ? Positioned(
                            bottom: 180,
                            left: 30,
                            child: Container(
                              width: 70,
                              height: 40,
                              color: Colors.black.withOpacity(0.3),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.stars,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  Text(
                                    "VIP",
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontFamily: 'Gamja Flower',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 20),
                          ),
                    Container(
                      height: 65,
                      color: Colors.black.withOpacity(0.5),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 5, top: 5, bottom: 5),
                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: 40,
                          height: 40,
//                          child: Image(
//                            image: serviceplace == "مشغل"
//                                ? AssetImage('assets/images/coiffure.png')
//                                : serviceplace == "كوافير"
//                                    ? AssetImage('assets/images/employee.png')
//                                    : AssetImage('assets/images/cof_emp.png'),
//                          ),
                        ),
                        onTap: () {
                          Toast.show(
                              "  هذا المشغل يقبل الخدمات في  $cnocars ",
                              context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                        },
                      ),

//                    new Checkbox(
//                      activeColor: Color(0xffF1AB37),
//                      tristate: true,
//                      value: true,
//                      onChanged: (bool newValue){
//                        setState(() {
//
//                        });
//                      },
//
//                    ),
//                    new Icon(
//                      Icons.favorite_border,
//                      color: const Color(0xffF1AB37),
//                      size: 40,
//                    ),
                      SizedBox(
                        width: 20,
                      ),
                      Stack(
                        alignment: Alignment.topRight,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              new Text(
                                " $cCategory / $cnocars ",
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              new Icon(
                                Icons.location_on,
                                color: const Color(0xffFF008B),
                                size: 20,
                              ),
                            ],
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
