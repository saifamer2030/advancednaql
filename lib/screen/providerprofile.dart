import 'dart:io';

import 'package:advancednaql/classes/OrderClass.dart';
import 'package:advancednaql/classes/OrderDetailClass.dart';
import 'package:advancednaql/translation/app_localizations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//import 'package:simple_slider/simple_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';
class providerProlile  extends StatefulWidget {
  String cId;
  String cName;
  String cDateID;
  providerProlile(this.cId, this.cDateID, this.cName);
  @override
  _providerProlileState createState() => _providerProlileState();
}

class _providerProlileState extends State<providerProlile> {

  var _formKey1 = GlobalKey<FormState>();
  //List<OrderDetailClass> orderlist = [];
  OrderDetailClass orderclass;
  final double _minimumPadding = 5.0;
  bool _load=false;
  TextEditingController _commentController = TextEditingController();
  List<String> _imageUrls;
  final _imageUrls1 = [
    "https://firebasestorage.googleapis.com/v0/b/advancednaql.appspot.com/o/myimage%2F2020-05-29%2002%3A03%3A17.653603.jpg?alt=media&token=2cfa5706-8c12-4a21-be95-71c1a4cd4631",
    "https://firebasestorage.googleapis.com/v0/b/advancednaql.appspot.com/o/myimage%2F2020-05-29%2002%3A03%3A17.653603.jpg?alt=media&token=2cfa5706-8c12-4a21-be95-71c1a4cd4631",
    "https://firebasestorage.googleapis.com/v0/b/advancednaql.appspot.com/o/myimage%2F2020-05-29%2002%3A03%3A17.653603.jpg?alt=media&token=2cfa5706-8c12-4a21-be95-71c1a4cd4631",
  ];

  @override
  void initState() {
    super.initState();
    //Toast.show(widget.cId+widget.cDateID,context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
    FirebaseAuth.instance.currentUser().then((user) => user == null
        ? null
        : setState(() {
     // _userId = user.uid;
      final orderdatabaseReference =
      FirebaseDatabase.instance.reference().child("orderdata");
//      orderdatabaseReference.once().then((DataSnapshot data) {
//        var uuId = data.value.keys;

       // orderlist.clear();
print("kkkkkk+"+widget.cId+widget.cDateID);
orderdatabaseReference
              .child(widget.cId).child(widget.cDateID)
              .once()
              .then((DataSnapshot data1) {
            var DATA = data1.value;
setState(() {
   orderclass = new OrderDetailClass(
    DATA['cId'],
    DATA['cdate'],
    DATA['clat1'],
    DATA['clong1'],
    DATA['clat2'],
    DATA['clong2'],
    DATA['cType'],
    DATA['cCategory'],
    DATA['cpayload'],
    DATA['cnocars'],
    DATA['ctime'],
    DATA['cpublished'],
    DATA['cstarttraveltime'],
    DATA['curi'],
     ////
     DATA['ccity'],
     DATA['cadv'],
     DATA['ctitle'],
     DATA['ccompany'],
     DATA['cowner'],
     DATA['cmodel'],
     DATA['cdriver'],
     DATA['cshort'],
     DATA['cdetail'],
    DATA['curilist'],
  );
   _imageUrls=DATA['curilist'].replaceAll(" ", "").replaceAll("[", "").replaceAll("]", "").split(",");

});
              //String  cName;
           // Toast.show(widget.cId+widget.cDateID,context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

       //     print("kkkkkkk${orderclass.cnocars}");

            //}
          });
       // }
    //  });
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
                          width: 300,height: 200,
                       child: _imageUrls==null?
                       SpinKitThreeBounce(
                         size: 35,
                         color: Colors.blue,
                       ):Swiper(
                         loop: false,
                         duration: 1000,
                         autoplay: true,
                         autoplayDelay: 15000,
                         itemCount: _imageUrls.length,
                         pagination:
                         new SwiperPagination(
                           margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                             builder: new DotSwiperPaginationBuilder(
                                 color: Colors.grey,
                                 activeColor: Colors.blue,
                                 size: 8.0,
                                 activeSize: 8.0),
                         ),

                         control: new SwiperControl(),
                         viewportFraction: 1,
                         scale: 0.1,
                         outer: true,
                         itemBuilder:
                             (BuildContext context,
                             int index) {
                           return  Image.network(_imageUrls[index],
                               fit: BoxFit.fill, loadingBuilder: (BuildContext context,
                                   Widget child, ImageChunkEvent loadingProgress) {
                                 if (loadingProgress == null) return child;
                                 return SpinKitThreeBounce(
                                   color: Colors.blue,
                                   size: 35,
                                 );
                               });
                         },
                       )


                      ),
                      Card(

                        shape: new RoundedRectangleBorder(
                            side: new BorderSide(color: const Color(0xff4fc3f7), width: 3.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        //borderOnForeground: true,
                        elevation: 10.0,
                        margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
                        child: Container(
                            height: 200,
                            color: Colors.grey[200],
                            padding: EdgeInsets.all(0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: orderclass==null?Text(""):Text(
                                      "شاحنة ${orderclass.cCategory} حمولة ${orderclass.cpayload}",
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
                                    child: Row(
                                      children: <Widget>[

                                        orderclass==null?Text(""):
                                             Padding(
                                               padding: const EdgeInsets.only(top:8.0),
                                               child: Text("المالك: ${ widget.cName}",
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
                                Positioned(
                                  top: 40,
                                  right: 0,
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
                                ),
                                Positioned(
                                  top: 60,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[

                                        orderclass==null?Text(""):
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0),
                                          child: Text("الموديل: ${ orderclass.cmodel}",
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


}
