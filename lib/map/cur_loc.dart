import 'dart:async';

import 'package:access_settings_menu/access_settings_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CurrentLocation2 extends StatefulWidget {

  // String _coifId;
  // String _coifImg;
  // String _coifName;

  // CurrentLocation2(this._coifId , this._coifImg,this._coifName);

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation2> {
  static  LatLng _center = const LatLng(24.774265, 46.738586);
  LatLng _lastMapPostion = _center;
  LatLng _myLoc;

  MapType _currentMapType = MapType.normal;
  final Set<Marker> _markers = {};

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  bool isLocationEnabled;
  BuildContext _context;

  Position _currentPosition;
  Position _geoPosition;
  String _currentAddress;

  Completer<GoogleMapController> _controller = Completer();
  double zoomVal = 0.5;

  @override
  void initState() {

    checkGPS('ACTION_LOCATION_SOURCE_SETTINGS');
    _getCurrentLocation();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Location"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                mapType: _currentMapType,
                initialCameraPosition:
                CameraPosition(target: _myLoc != null ? _myLoc :_center, zoom: 8.0),
                onMapCreated: _onMapCreated,
                markers: _markers,
                onCameraMove: _onCameraMove,
                myLocationEnabled: true,
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
              )),

//          Padding(
//            padding: EdgeInsets.all(16.0),
//            child: Align(
//                alignment: Alignment.topRight,
//                child: Column(
//                  children: <Widget>[
//                    actionBtn(Icons.map, _onMapTypePressed),
//                    SizedBox(
//                      height: 10.0,
//                    ),
//                    actionBtn(Icons.add_location, _onAddMarkerPressed),
//                    SizedBox(
//                      height: 10.0,
//                    ),
//                    actionBtn(Icons.location_searching, _goToPositionOne),
//                  ],
//                )),
//          ),

          new Align(
            alignment: Alignment.center,
            child: new Icon(FontAwesomeIcons.mapPin, size: 40.0),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(16.0),
            child: RaisedButton(
                color: Colors.amber,
                onPressed: () {
                 _onAddMarker(context);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Save Location",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Icon(Icons.save, color: Colors.white),
                    ),
//                    Text("Save Location", style: TextStyle(fontSize: 20.0, color: Colors.white),),
//                    SizedBox(width: 15.0,),
//                    Icon(Icons.save , color: Colors.white,)
                  ],
                )),
          )
        ],
      ),
    );
  }

  void _onAddMarker(BuildContext context) {
    Navigator.pop(context, _myLoc);
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPostion = position.target;
  }

  Widget actionBtn(IconData icon, Function function) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.amber,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  _onMapTypePressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerPressed() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPostion.toString()),
          position: _lastMapPostion,
          infoWindow:
          InfoWindow(title: "Ryadah - KSA", snippet: "this is snippet"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet)));
    });
  }

//  Future<void> _goToPositionOne() async {
//    final GoogleMapController controller = await _controller.future;
//    controller.animateCamera(CameraUpdate.newCameraPosition(_position));
//  }

  //current loc
  _getCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    _geoPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((po) {
      _myLoc = LatLng(po.latitude , po.longitude);
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(po.latitude , po.longitude), zoom: 15.0),
      ));
    });
  }

//   _saveMyLocation(BuildContext context)async{
//     if( _myLoc != null){
//       FirebaseDatabase.instance.reference()
//           .child(DefConstants().DB_COIFFURE_DATA).child(widget._coifId).update(
//           {"lat":_myLoc.latitude.toString()}
//       ).then((_) {
//         print('Transaction  committed.');
//       });
//       FirebaseDatabase.instance.reference()
//           .child(DefConstants().DB_COIFFURE_DATA).child(widget._coifId).update(
//           {"lng":_myLoc.longitude.toString()}
//       ).then((_) {
//         print('Transaction  committed.');
//       });
//       HelperFunc.showToast("Successfully saved", Colors.green);
//       //Navigator.pop(context);
// //      Navigator.pushReplacement(context,
// //          MaterialPageRoute(builder: (context) =>
// //              CoifProfileProlile(
// //                widget._coifId ,
// //                widget._coifImg,
// //                widget._coifName,
// //              )));
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) =>
//               CoiffureHome(selectPage:2 ,coiffureId:  widget._coifId ,
//                   coiffurecUri: widget._coifImg,
//                   coiffureName: widget._coifName )));

//     }else{
//       HelperFunc.showToast("Your Location not defined yet ,\n Make sure GPS enabled!", Colors.red);
//     }
//   }

  checkGPS(settingsName) async {
    isLocationEnabled = await Geolocator().isLocationServiceEnabled();
    if(!isLocationEnabled){
      _showDialog(_context , settingsName);
    }
  }

  void _showDialog(BuildContext context , String settingsName){
    showAlert(
      context: context,
      title: "Enable GPS ?",
      body: "Should enable GPS to define your location?",
      actions: [
        AlertAction(
          text: "enable",
          isDestructiveAction: true,
          onPressed: () {
            // TODO
            openSettingsMenu(settingsName);
          },
        ),
      ],
      cancelable: true,
    );
  }
  openSettingsMenu(settingsName) async {
    isLocationEnabled = await Geolocator().isLocationServiceEnabled();

    try {
      isLocationEnabled =
      await AccessSettingsMenu.openSettings(settingsType: settingsName);
    } catch (e) {
      isLocationEnabled = false;
    }
  }


}