import 'package:advancednaql/classes/OrderClass.dart';
import 'package:advancednaql/classes/OrderNameClass.dart';
import 'package:advancednaql/screen/orderprofile.dart';
import 'package:advancednaql/screen/providerprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:toast/toast.dart';

class AllOrder extends StatefulWidget {
  @override
  _AllOrderState createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {
  List<OrderNameClass> orderlist = [];
  List<String> namelist = [];
  bool _load = false;
  var _typearray = [
    'الكل',
    'طلبات',
    'عروض',
  ];
  var _typecurrentItemSelected = '';
  String _userId;
  final orderdatabaseReference =
      FirebaseDatabase.instance.reference().child("orderdata");
  bool isSearch = false;
  String filtter = '';
  TextEditingController searchcontroller = TextEditingController();

  List<OrderNameClass> SearchList = [];
  List<OrderNameClass> costantList = [];

  void filterSearchResults(String filtter) {
    SearchList.clear();
    SearchList.addAll(orderlist);
    if (filtter == '') {
      setState(() {
        orderlist.clear();
        orderlist.addAll(costantList);
      });
      return;
    } else {
      setState(() {
        List<OrderNameClass> ListData = [];
        SearchList.forEach((item) {
          if ((item.cCategory.toString().contains(filtter)) ||
              (item.cName.toString().contains(filtter)) ||
              (item.cnocars.toString().contains(filtter)) ||
              (item.cpayload.toString().contains(filtter)) ||
              (item.cType.toString().contains(filtter)) ||
              (item.cdate.toString().contains(filtter))) {
            ListData.add(item);
          }
        });
        setState(() {
          orderlist.clear();
          orderlist.addAll(ListData);
        });
        return;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _load = true;
    });
    _typecurrentItemSelected = _typearray[0];
    searchcontroller.addListener(() {
      if (searchcontroller.text == '') {
        setState(() {

          filtter = '';
        });
      } else {
        setState(() {
          filtter = searchcontroller.text;
        });
      }
    });
//    FirebaseAuth.instance.currentUser().then((user) => user == null
//        ? null
//        :
    setState(() {
        //    _userId = user.uid;
            final orderdatabaseReference =
                FirebaseDatabase.instance.reference().child("orderdata");
            orderdatabaseReference.once().then((DataSnapshot data) {
              var uuId = data.value.keys;

              orderlist.clear();
              namelist.clear();
              for (var id in uuId) {
                orderdatabaseReference
                    .child(id)
                    .once()
                    .then((DataSnapshot data1) {
                  var DATA = data1.value;
                  var keys = data1.value.keys;

                  for (var individualkey in keys) {
                    OrderClass orderclass = new OrderClass(
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
                        .child(
                          DATA[individualkey]['cId'],
                        )
                        .child("cName")
                        .once()
                        .then((DataSnapshot snapshot5) {
                      setState(() {
                        if (snapshot5.value != null) {
                          setState(() {
                            //namelist.add(snapshot5.value);
                            OrderNameClass ordernameclass = new OrderNameClass(
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
                              snapshot5.value,
                              individualkey,
                            );
                            orderlist.add(ordernameclass);
                            costantList.add(ordernameclass);
                          });
                        }
                        else {
                          setState(() {
                            OrderNameClass ordernameclass = new OrderNameClass(
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
                              "no name",
                              individualkey,
                            );
                            orderlist.add(ordernameclass);
                            costantList.add(ordernameclass);
                          });
                        }
                      });
                    });
                  }
                });
              }
            });
          });
    //);
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

          Container(
            height: 40.0,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 40,
                    color: Colors.grey[500],
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        controller: searchcontroller,
                        // focusNode: focus,

                        decoration: InputDecoration(
                          labelText:
                              searchcontroller.text.isEmpty ? "بحث بالاسم" : '',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18.0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          suffixIcon: searchcontroller.text.isNotEmpty
                              ? IconButton(
                                  icon: Icon(Icons.cancel, color: Colors.black),
                                  onPressed: () {
                                    setState(() {
                                      searchcontroller.clear();
                                      filterSearchResults('');
                                    });
                                  },
                                )
                              : null,
                          errorStyle: TextStyle(color: Colors.blue),
                          enabled: true,
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    color: Colors.grey[500],
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        color: Colors.grey[500],
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "الخريطة",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 25.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 40,
                    color: const Color(0xff43A2CC),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DropdownButton<String>(
                        items: _typearray.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ));
                        }).toList(),
                        value: _typecurrentItemSelected,
                        onChanged: (String newValueSelected) {
                          // Your code to execute, when a menu item is selected from dropdown
                          _onDropDownItemSelectedtype(newValueSelected);
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
              child: orderlist.length == 0
                  ? Center(
                      child:  loadingIndicator,)
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
                              orderlist[index].cName,
                              orderlist[index].cDateID,
                            ),
                            onTap: () {});
                      })

          )
        ],
      ),
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
    String curi,
    String cname,
      String  cDateID,
  ) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)),
        //borderOnForeground: true,
        elevation: 10.0,
        margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
        child: InkWell(
          onTap: () {
          setState(() {
            if(cType=="عرض"){
              Navigator.push(context,MaterialPageRoute(builder: (context) => providerProlile(cId, cDateID, cname)));
              //Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (context) => providerProlile(cId, cDateID, cname), maintainState: false));


            }else if(cType=="طلب"){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => orderProfile(
                         cId,
                         cdate,
                         clat1,
                         clong1,
                         clat2,
                         clong2,
                         cType,
                         cCategory,
                         cpayload,
                         cnocars,
                         ctime,
                         cpublished,
                         cstarttraveltime,
                         curi,
                         cname,
                          cDateID,
                      )));
            }else {}

          });
          },
          child: Container(
              padding: EdgeInsets.all(0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.grey[100],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: curi == "a"
                            ? new Image.asset("assets/images/ic_bluecar.png",
                                fit: BoxFit.fill)
                            : new Image.network(
                                curi,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    width: 100,
                    height: 130,
                  ),
                  Container(
                    height: 130,
                    child: Stack(
                      //alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            height: 30,
                            width: 50,
                            color: cType == "طلب" ? Colors.green : Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                cType,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Gamja Flower',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "$cCategory حمولة  $cpayload",
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
                        Positioned(
                          top: 20,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: cname != null
                                ? Text(
                                    cname,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontFamily: 'Gamja Flower',
                                        fontStyle: FontStyle.normal),
                                  )
                                : Text(" "),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SmoothStarRating(
                                allowHalfRating: false,
                                starCount: 5,
                                rating: 5,
                                //setting value
                                size: 20.0,
                                color: Colors.amber,
                                borderColor: Colors.grey,
                                spacing: 0.0),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "الواجهة: ",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'Gamja Flower',
                                      fontSize: 10.0,
                                      fontStyle: FontStyle.normal),
                                ),
                                SizedBox(
                                  height: _minimumPadding,
                                  width: _minimumPadding,
                                ),
                                Text(
                                  "الواجهة: ",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'Gamja Flower',
                                      fontSize: 10.0,
                                      fontStyle: FontStyle.normal),
                                ),
                                SizedBox(
                                  height: _minimumPadding,
                                  width: _minimumPadding,
                                ),
                                Text(
                                  "وقت التحرك: ",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'Gamja Flower',
                                      fontSize: 10.0,
                                      fontStyle: FontStyle.normal),
                                ),
                                SizedBox(
                                  height: _minimumPadding,
                                  width: _minimumPadding,
                                ),
                                Text(
                                  "منذ: $cdate",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'Gamja Flower',
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
                              child: Text(
                                "                                                                    ",
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
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
      ),
    );
  }

  void _onDropDownItemSelectedtype(String newValueSelected) {
    setState(() {
      this._typecurrentItemSelected = newValueSelected;
    });
    if (newValueSelected == 'طلبات') {
      orderlist.clear();
      orderlist.addAll(costantList);
      filterSearchResults("طلب");
    } else if (newValueSelected == 'عروض') {
      orderlist.clear();
      orderlist.addAll(costantList);
      filterSearchResults("عرض");
    } else if (newValueSelected == 'الكل') {
      filterSearchResults('');
    }
  }
}
