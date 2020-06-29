import 'package:advancednaql/classes/OrderClass.dart';
import 'package:advancednaql/classes/OrderDetailClass.dart';
import 'package:advancednaql/classes/OrderDetailsNameClass.dart';
import 'package:advancednaql/classes/OrderNameClass.dart';
import 'package:advancednaql/classes/OrderPhotoDetailClass.dart';
import 'package:advancednaql/classes/UserRateClass.dart';
import 'package:advancednaql/screen/orderprofile.dart';
import 'package:advancednaql/screen/providerprofile.dart';
import 'package:advancednaql/translation/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

import 'editoffer.dart';
import 'editorder.dart';

class MyAdvertisement extends StatefulWidget {
  @override
  _MyAdvertisementState createState() => _MyAdvertisementState();
}

class _MyAdvertisementState extends State<MyAdvertisement> {
  List<OrderDetailsNameClass> orderlist = [];
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

  List<OrderDetailsNameClass> SearchList = [];
  List<OrderDetailsNameClass> costantList = [];

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
        List<OrderDetailsNameClass> ListData = [];
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
    FirebaseAuth.instance.currentUser().then((user) => user == null
        ? null
        : setState(() {
            _userId = user.uid;
            final orderdatabaseReference =
                FirebaseDatabase.instance.reference().child("orderdata");
//            orderdatabaseReference.once().then((DataSnapshot data) {
//              var uuId = data.value.keys;


           //   for (var id in uuId) {
                orderdatabaseReference
                    .child(_userId)
                    .once()
                    .then((DataSnapshot data1) {
                  var DATA = data1.value;
                  var keys = data1.value.keys;
                  orderlist.clear();
                  namelist.clear();
                  for (var individualkey in keys) {
                    OrderPhotoDetailClass orderclass = new OrderPhotoDetailClass(
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
//////////
                      DATA[individualkey]['curi11'],
                      DATA[individualkey]['curi12'],
                      DATA[individualkey]['curi14'],

                      DATA[individualkey]['ccity'],
                      DATA[individualkey]['cadv'],
                      DATA[individualkey]['ctitle'],
                      DATA[individualkey]['ccompany'],
                      DATA[individualkey]['cowner'],
                      DATA[individualkey]['cmodel'],
                      DATA[individualkey]['cdriver'],
                      DATA[individualkey]['cshort'],
                      DATA[individualkey]['cdetail'],
                      DATA[individualkey]['curilist'],

                    );
                    /////////////////////////////////////
                    final userdatabaseReference =
                    FirebaseDatabase.instance.reference().child("userdata");
                    userdatabaseReference
                        .child( DATA[individualkey]['cId'])
                        .once()
                        .then((DataSnapshot data1) {
                      var DATA5= data1.value;
                      setState(() {
                        UserRateClass userrating = new UserRateClass(
                          DATA5['cName'],
                          DATA5['rating'],
                          DATA5['custRate'],

                        );
                        setState(() {
                          //namelist.add(snapshot5.value);
                          OrderDetailsNameClass ordernameclass = new OrderDetailsNameClass(
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
                            DATA[individualkey]['curi11'],
                            DATA[individualkey]['curi12'],
                            DATA[individualkey]['curi14'],



                            DATA[individualkey]['ccity'],
                            DATA[individualkey]['cadv'],
                            DATA[individualkey]['ctitle'],
                            DATA[individualkey]['ccompany'],
                            DATA[individualkey]['cowner'],
                            DATA[individualkey]['cmodel'],
                            DATA[individualkey]['cdriver'],
                            DATA[individualkey]['cshort'],
                            DATA[individualkey]['cdetail'],
                            DATA[individualkey]['curilist'],

                            DATA5['cName'],
                            DATA5['rating'],
                            DATA5['custRate'],
                            individualkey,
                          );
                          orderlist.add(ordernameclass);
                          costantList.add(ordernameclass);
                        });
                      });
                    });
                    //////////////////////////////////////////

                  }
                });
             // }
          //  });
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

          /** Container(
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
          ),**/
          Expanded(
              child: orderlist.length == 0
                  ? Center(
                      child:  loadingIndicator,)
                  : new ListView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: _controller,
                      itemCount: orderlist.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Slidable(
                            actionPane: SlidableDrawerDismissal(),
                            child:   firebasedata(
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
                              orderlist[index].rating,
                              orderlist[index].custRate,
                              orderlist[index].cDateID,
                            ),
                            actions: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: IconSlideAction(
                                  caption: 'Edit',
                                  color: Colors.green,
                                  icon: Icons.edit,
                                  onTap: () {
                                    if(orderlist[index].cType=="طلب"){
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new EditOrder(
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
                                            )),
                                      );

                                    }else{
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new EditOffer(
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

                                              orderlist[index].curi11,
                                              orderlist[index].curi12,
                                              orderlist[index].curi14,

                                              orderlist[index].cName,
                                              orderlist[index].cDateID,

                                              orderlist[index].ccity,
                                              orderlist[index].cadv,
                                              orderlist[index].ctitle,
                                              orderlist[index].ccompany,
                                              orderlist[index].cowner,
                                              orderlist[index].cmodel,
                                              orderlist[index].cdriver,
                                              orderlist[index].cshort,
                                              orderlist[index].cdetail,
                                              orderlist[index].curilist,
                                            )),
                                      );

                                    }
                                  },
                                ),
                              )
                            ],
                            secondaryActions: <Widget>[
                              Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: IconSlideAction(
                                    caption: 'Delete',
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                        new CupertinoAlertDialog(
                                          title: new Text(Translations.of(context).translate('warning')),
                                          content: new Text(Translations.of(context).translate('delete_your_ad')),
                                          actions: [
                                            CupertinoDialogAction(
                                                isDefaultAction: false,
                                                child: new FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      FirebaseDatabase.instance.reference()
                                                          .child("orderdata").child(_userId).child(orderlist[index].cDateID)
                                                          .remove().whenComplete(() =>
                                                          Toast.show(Translations.of(context).translate('deleted_from_favorites'), context,
                                                              duration: Toast.LENGTH_SHORT,
                                                              gravity: Toast.BOTTOM));
                                                      setState(() {
                                                        orderlist.removeAt(index);
                                                        Navigator.pop(context);
                                                      });
                                                    });

                                                  }
                                                  ,
                                                  child: Text(Translations.of(context).translate('oK')),
                                                )),
                                            CupertinoDialogAction(
                                                isDefaultAction: false,
                                                child: new FlatButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text(Translations.of(context).translate('no')),
                                                )),
                                          ],
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          );

                        /**Dismissible(
                          key: Key(orderlist[index].cDateID),
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
                              FirebaseDatabase.instance.reference()
                                  .child("orderdata").child(_userId).child(orderlist[index].cDateID)
                                  .remove().whenComplete(() =>
                                  Toast.show("تم الحذف فى المفضلة", context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.BOTTOM));
setState(() {
  orderlist.removeAt(index);
});
                            });
                          },

                          child: InkWell(
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
                                orderlist[index].rating,
                                orderlist[index].custRate,
                                orderlist[index].cDateID,
                              ),
                              onTap: () {}),
                        );**/
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
      rating,
      custRate,
      String cDateID,
      ) {
    var cRate = 0.0;
    if (custRate > 0) {
      cRate = double.parse(rating) / custRate;
    }
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
              if (cType == "عرض") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            providerProlile(cId, cDateID, cname)));
                //Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (context) => providerProlile(cId, cDateID, cname), maintainState: false));

              } else if (cType == "طلب") {
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
              } else {}
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
                    width: 250,
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: cType == "طلب" ? Colors.green : Colors.red,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,top: 5),
                              child: Text(
                                cType,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Gamja Flower',
                                    fontSize: 10,
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
                                  fontSize: 13.0,
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
                            child: cRate > 0.0
                                ? SmoothStarRating(
                                allowHalfRating: true,
                                onRated: (v) {},
                                starCount: 5,
                                rating: cRate,
                                isReadOnly: true,
                                //not changed
                                //setting value
                                size: 20.0,
                                color: Colors.amber,
                                borderColor: Colors.amber,
                                spacing: 0.0)
                                : new Text(
                              Translations.of(context).translate('newly_joined'),
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontFamily: 'Gamja Flower',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.normal),
                            ),
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
                                (clat1 == "" || clat1 == null)
                                    ? Text("")
                                    : Text(
                                  "$clat1",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'Gamja Flower',
                                      fontSize: 10.0,
                                      fontStyle: FontStyle.normal),
                                ),
                                (clat1 == "" || clat1 == null)
                                    ? Text("")
                                    : new Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                                SizedBox(
                                  height: _minimumPadding,
                                  width: _minimumPadding * 4,
                                ),
                                (clat2 == "" || clat2 == null)
                                    ? Text("")
                                    : Text(
                                  "الواجهة:$clat2",
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
      filterSearchResults("طلب");
    } else if (newValueSelected == 'عروض') {
      filterSearchResults("عرض");
    } else if (newValueSelected == 'الكل') {
      filterSearchResults('');
    }
  }
}
