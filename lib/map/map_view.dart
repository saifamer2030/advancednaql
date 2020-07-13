import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screen/orderprofile.dart';
import '../screen/providerprofile.dart';
import 'orders_locations.dart';
import 'orders_locations_name.dart';

var mapKey = 'AIzaSyASpc8HqIa7OPmBeSJu7szAStFHeKpbC2U';

class MapViewNaql extends StatefulWidget {
  @override
  _MapViewNaqlState createState() => _MapViewNaqlState();
}

// final cofRef = FirebaseDatabase.instance.reference();

class _MapViewNaqlState extends State<MapViewNaql> {
  Map<String, String> categoriesList;
  List<OrdersLocationsName> orderlist = [];

  Completer<GoogleMapController> _controller = Completer();
  double zoomVal = 0.5;
  String _cName;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      final userdatabaseReference =FirebaseDatabase.instance.reference().child("userdata");
      final orderdatabaseReference =
          FirebaseDatabase.instance.reference().child("orderdata");
      orderdatabaseReference.once().then((DataSnapshot data) {
        var uuId = data.value.keys;

        orderlist.clear();
        // namelist.clear();
        for (var id in uuId) {
          orderdatabaseReference.child(id).once().then((DataSnapshot data1) {
            var DATA = data1.value;
            var keys = data1.value.keys;

            for (var individualkey in keys) {
              if (DATA[individualkey]['fromPLat'] != null &&
                  DATA[individualkey]['toPLat'] != null) {
                OrdersLocations orderclass = new OrdersLocations(
                    DATA[individualkey]['cId'],
                    DATA[individualkey]['ctitle'],
                    individualkey,
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
                    DATA[individualkey]['fromPLat'],
                    DATA[individualkey]['fromPLng'],
                    DATA[individualkey]['toPLat'],
                    DATA[individualkey]['toPLng']);
                userdatabaseReference
                    .child( DATA[individualkey]['cId'])
                    .child("cName")
                    .once()
                    .then((DataSnapshot snapshot5) {
                  setState(() {
                    if (snapshot5.value != null) {
                      setState(() {
                        _cName=snapshot5.value;
                        OrdersLocationsName orderclassname = new OrdersLocationsName(
                            DATA[individualkey]['cId'],
                            DATA[individualkey]['ctitle'],
                            individualkey,
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
                            DATA[individualkey]['fromPLat'],
                            DATA[individualkey]['fromPLng'],
                            DATA[individualkey]['toPLat'],
                            DATA[individualkey]['toPLng'],
                            _cName
                        );
                        orderlist.add(orderclassname);
                        setMarkers();

                      });
                    }else{
                      setState(() {
                        _cName="اسم غير معلوم";
                        OrdersLocationsName orderclassname = new OrdersLocationsName(
                            DATA[individualkey]['cId'],
                            DATA[individualkey]['ctitle'],
                            individualkey,
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
                            DATA[individualkey]['fromPLat'],
                            DATA[individualkey]['fromPLng'],
                            DATA[individualkey]['toPLat'],
                            DATA[individualkey]['toPLng'],
                            _cName
                        );
                        orderlist.add(orderclassname);
                        setMarkers();

                      });
                    }

                  });
                });         //////////////////////////

                print("MAPPPPPPPPPPPPPP>>>>>>>>{$individualkey}>>>" +
                    DATA[individualkey]['fromPLat'] +
                    "\n\n\n\n");
              }
            }
          });
        }
      });
    });
  }

  //close database
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Map View - All Requests"),
//        centerTitle: true,
//      ),
      body: Stack(
        children: <Widget>[
          _googleMap(context),
          Column(
            children: <Widget>[
              Container(
                width:  MediaQuery.of(context).size.width,
                height: 86.0,
                child: InkWell(
                  onTap: () => Navigator.pop(context),

                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 50,
                    height: 50,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0,top:20),
                          child: Icon(Icons.arrow_back,color: Colors.white,),
                        )
                    ),
                  ),
                ),
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
              ),
            ],
          ),
          // _zoomInFunction(),
          // _zoomOutFunction(),
          // _buildContainer(context),
        ],
      ),
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(24.774265, 46.738586), zoom: 8),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
      ),
    );
  }

  _onFindCoifAddMarker(String lat, String lng, String name, String snippet,
      OrdersLocationsName order) async {
    LatLng newLatLng = LatLng(double.parse(lat), double.parse(lng));

     BitmapDescriptor icon ;
    if (snippet == "طلب") {
      icon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(116, 116)), 'assets/images/ic_green.png');
    } else {
      icon =  await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(116, 116)), 'assets/images/ic_red.png');
    }

    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(newLatLng.toString()),
          position: newLatLng,
          infoWindow: InfoWindow(title: name, snippet: snippet,
              onTap: () {
                //this is what you're looking for!
                if (snippet == "طلب") {
                  //order
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => orderProfile(
                            order.cId,
                            order.cdate,
                            order.clat1,
                            order.clong1,
                            order.clat2,
                            order.clong2,
                            order.cType,
                            order.cCategory,
                            order.cpayload,
                            order.cnocars,
                            order.ctime,
                            order.cpublished,
                            order.cstarttraveltime,
                            order.curi,
                            order.cName,
                            order.cDateId,
                          order.fromPLat,
                          order.fromPLng,
                          order.toPLat,
                          order.toPLng,
                        )),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => providerProlile(
                            order.cId, order.cDateId, order.cName)),
                  );
                }
              }
          ),
          icon: icon,
          // BitmapDescriptor.defaultMarkerWithHue(
          //     BitmapDescriptor.hueViolet),
          onTap: () {
//            //this is what you're looking for!
//            if (snippet == "طلب") {
//              //order
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => orderProfile(
//                        order.cId,
//                        order.cdate,
//                        order.clat1,
//                        order.clong1,
//                        order.clat2,
//                        order.clong2,
//                        order.cType,
//                        order.cCategory,
//                        order.cpayload,
//                        order.cnocars,
//                        order.ctime,
//                        order.cpublished,
//                        order.cstarttraveltime,
//                        order.curi,
//                        order.ctitle,
//                        order.cDateId)),
//              );
//            } else {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => providerProlile(
//                        order.cId, order.ctitle, order.cDateId)),
//              );
//            }
          }
          ));
    });
  }

  void setMarkers() {
    for (var order in orderlist) {
      _onFindCoifAddMarker(order.fromPLat, order.fromPLng, order.cCategory, order.cType, order);
      print("Marker>>>>>MAPPPPPPPPPPPPPP>>>>>>>>>>>" +
          order.fromPLat +
          "\n\n\n\n");
    }
  }

  //current loc
  // _goToCofLocation() async {
  //   final GoogleMapController controller = await _controller.future;

  //   LatLng _myLoc =
  //       LatLng(double.parse(widget.mlat), double.parse(widget.mLng));
  //   controller.animateCamera(CameraUpdate.newCameraPosition(
  //     CameraPosition(
  //         target: LatLng(_myLoc.latitude, _myLoc.longitude), zoom: 15.0),
  //   ));
  // }

  // Widget _buildContainer(BuildContext context) {
  //   return Align(
  //       alignment: Alignment.bottomLeft,
  //       child: Container(
  //           margin: EdgeInsets.symmetric(vertical: 20.0),
  //           height: MediaQuery.of(context).size.height / 3,
  //           child: StreamBuilder(
  //               stream: _query.onValue,
  //               builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
  //                 if (orderlist != null) {
  //                   if (orderlist.length > 0) {
  //                     // HelperFunc.showToast("length: ${cofList.length}", Colors.red);
  //                     return ListView.builder(
  //                         scrollDirection: Axis.horizontal,
  //                         itemCount: orderlist.length,
  //                         itemBuilder: (context, postion) {
  //                           //HelperFunc.showToast('cofList.lat ${cofList[postion].lat}', Colors.red);
  //                           return Padding(
  //                             padding: EdgeInsets.all(8.0),
  //                             child: _boxes(
  //                                 'assets/logo.png',
  //                                 double.parse(orderlist[postion].fromPLng),
  //                                 double.parse(orderlist[postion].fromPLat),
  //                                 double.parse(orderlist[postion].toPLng),
  //                                 double.parse(orderlist[postion].toPLat),
  //                                 "Naql",
  //                                 "Jaddah",
  //                                 "test",
  //                                 context),
  //                           );
  //                         });
  //                   } else {
  //                     return Container(
  //                       child: Center(
  //                         child: Text("No Data found!"),
  //                       ),
  //                     );
  //                   }
  //                 } else {
  //                   return Container(
  //                     child: Center(
  //                       child: CircularProgressIndicator(),
  //                     ),
  //                   );
  //                 }
  //               })));
  // }

  // Widget _boxes(
  //     String img,
  //     double fromLng,
  //     double fromLat,
  //     double toLng,
  //     double toLat,
  //     String name,
  //     String snippet,
  //     String area,
  //     BuildContext context) {
  //   TextStyle textStyle = Theme.of(context).textTheme.title;

  //   return GestureDetector(
  //     onTap: () {
  //       _goToLocation(fromLat, fromLng, name, snippet);
  //     },
  //     child: Container(
  //       child: FittedBox(
  //         child: Material(
  //           color: Colors.white,
  //           elevation: 14.0,
  //           borderRadius: BorderRadius.circular(24.0),
  //           shadowColor: Color(0x802196f3),
  //           child: Row(
  //             children: <Widget>[
  //               Container(
  //                   width: MediaQuery.of(context).size.width / 2,
  //                   height: 200,
  //                   child: ClipRRect(
  //                     borderRadius: BorderRadius.circular(24.0),
  //                     child:
  //                         FadeInImage.assetNetwork(
  //                       placeholder: 'assets/images/logo_circle.png',
  //                       image: img,
  //                       fit: BoxFit.fill,
  //                     ),
  //                   )),
  //               Container(
  //                 width: MediaQuery.of(context).size.width / 2,
  //                 alignment: Alignment.center,
  //                 height: 200,
  //                 child: Padding(
  //                   padding: EdgeInsets.all(8.0),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       Text(
  //                         name,
  //                         style: textStyle,
  //                       ),
  //                       Text(
  //                         snippet,
  //                         style: textStyle,
  //                       ),
  //                       area != null
  //                           ? Text(
  //                               area,
  //                               style: textStyle,
  //                             )
  //                           : null,
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _zoomInFunction() {
  //   return Align(
  //     alignment: Alignment.topLeft,
  //     child: IconButton(
  //       icon: Icon(
  //         FontAwesomeIcons.searchMinus,
  //         color: Colors.black54,
  //       ),
  //       onPressed: () {
  //         zoomVal--;
  //         _minus(zoomVal);
  //       },
  //     ),
  //   );
  // }

  // Widget _zoomOutFunction() {
  //   return Align(
  //     alignment: Alignment.topRight,
  //     child: IconButton(
  //       icon: Icon(
  //         FontAwesomeIcons.searchPlus,
  //         color: Colors.black54,
  //       ),
  //       onPressed: () {
  //         zoomVal++;
  //         _minus(zoomVal);
  //       },
  //     ),
  //   );
  // }

  // Future<void> _minus(double zoom) async {
  //   final GoogleMapController contr = await _controller.future;
  //   contr.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //       target: LatLng(24.774265, 46.738586),
  //       zoom: zoom,
  //       tilt: 50.0,
  //       bearing: 45.0)));
  // }

  // Future<void> _goToLocation(
  //     double lat, double lng, String name, String snippet) async {
  //   //_onFindCoifAddMarker(lat.toString() ,lng.toString() ,name , snippet);
  //   final GoogleMapController contr = await _controller.future;
  //   contr.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //       target: LatLng(lat, lng), zoom: 15, tilt: 50.0, bearing: 45.0)));
  // }

}
