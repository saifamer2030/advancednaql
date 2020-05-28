import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:toast/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as Img;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:io';

class NewOffer extends StatefulWidget {
  @override
  _newoffer createState() => _newoffer();
}

@override
class _newoffer extends State<NewOffer> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool photoselected1=false;
  bool photoselected2=false;

  final double _minimumPadding = 5.0;
  String _userId;
  File sampleImage1;
  bool _load2 = false;
  final orderdatabaseReference =
  FirebaseDatabase.instance.reference().child("orderdata");

  bool isSwitched = false;
  var _Categoryarray = [
    'نقل خفيف',
    'نقل متوسط',
    'نقل ثقيل',
    'معدات ثقيلة',
    'معدات زراعية',
    'نقل ركاب'
  ];
  var _Payloadarray = [
    '100-200 كيلو',
    '200-300 كيلو',
    '400-500 كيلو',
    '600-700 كيلو',
    '800-900 كيلو'
  ];
  var _cityarray = ['جدة', 'الرياض', 'مكة', 'المدينة'];
  var _advarray = ['اااااااااا', 'ةةةةةةةة', 'ووووووو', 'ءءءءءءءءء'];
  var _noarray = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
  ];

  TextEditingController _titleController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _ownerController = TextEditingController();
  TextEditingController _shortController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  var _CategorycurrentItemSelected = '';
  var _PayloadcurrentItemSelected = '';
  var _citycurrentItemSelected = '';
  var __noarraycurrentItemSelected = '';
  var __advarraycurrentItemSelected = '';
  @override
  void initState() {
    super.initState();
    _CategorycurrentItemSelected = _Categoryarray[0];
    _PayloadcurrentItemSelected = _Payloadarray[0];
    __advarraycurrentItemSelected= _advarray[0];
    __noarraycurrentItemSelected = _noarray[0];
    _citycurrentItemSelected = _cityarray[0];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(children: <Widget>[
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
        Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: _minimumPadding * 22,
              ),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: new InkWell(
                      onTap: (){getImage1();},
                      child: Container(
                        width: 200,
                        height: 150,
                        color: Colors.grey[300],
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top:25.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      alignment: Alignment.center,
                                      matchTextDirection: true,
                                      repeat: ImageRepeat.noRepeat,
                                      image: AssetImage(
                                          "assets/images/ic_bluecar.png"),
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 70,
                                    height: 70,
                                    child: Icon(
                                      Icons.add_circle,
                                      color: Colors.grey,
                                    )),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 380,
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
                            controller: _titleController,
                            validator: (String value) {
                              if ((value.isEmpty)) {
                                return 'برجاء ادخال عنوان الإعلان';
                              }
                            },

                            onChanged: (value) {},
                            //  controller: controller,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                                labelText: "عنوان الإعلان",
                                hintText: "عنوان الإعلان",

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

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                          elevation: 5.0,
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                          color: const Color(0xff43A2CC), //48B2E1
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
//                                              borderRadius: BorderRadius.only(
//                                                  topRight: Radius.circular(10.0),
//                                                  bottomRight: Radius.circular(10.0)),
                                ),
                                width: 250,
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      // textAlign: TextAlign.right,

                                      keyboardType: TextInputType.text,

                                      textDirection: TextDirection.rtl,
                                      controller: _modelController,
                                            validator: (String value) {
                                            if ((value.isEmpty)) {
                                            return 'برجاء ادخال الموديل';
                                            }
                                            },
                                        decoration:  InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "الموديل",
                                        fillColor: Colors.white,
                                        filled: true,
                                        errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "الموديل",
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          alignment: Alignment.center,
                                          matchTextDirection: true,
                                          repeat: ImageRepeat.noRepeat,
                                          image: AssetImage(
                                              "assets/images/ic_modelcar.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                          elevation: 5.0,
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                          color: const Color(0xff43A2CC), //48B2E1
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
//                                              borderRadius: BorderRadius.only(
//                                                  topRight: Radius.circular(10.0),
//                                                  bottomRight: Radius.circular(10.0)),
                                ),
                                width: 250,
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      // textAlign: TextAlign.right,
                                      keyboardType:
                                      TextInputType.text,
                                      validator: (String value) {
                                        if ((value.isEmpty)) {
                                          return 'برجاء ادخال اسم الشركة';
                                        }
                                      },
                                      textDirection:
                                      TextDirection.rtl,
                                      controller: _companyController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "الشركة",
                                        fillColor: Colors.white,
                                        filled: true,
                                        errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "الشركة",
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          alignment: Alignment.center,
                                          matchTextDirection: true,
                                          repeat:
                                          ImageRepeat.noRepeat,
                                          image: AssetImage(
                                              "assets/images/ic_compny.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all( 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                          elevation: 5.0,
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                          color: const Color(0xff43A2CC), //48B2E1
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
//                                              borderRadius: BorderRadius.only(
//                                                  topRight: Radius.circular(10.0),
//                                                  bottomRight: Radius.circular(10.0)),
                                ),
                                width: 250,
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      // textAlign: TextAlign.right,
                                      keyboardType:
                                      TextInputType.text,
                                      validator: (String value) {
                                        if ((value.isEmpty)) {
                                          return 'برجاء ادخال اسم المالك';
                                        }
                                      },
                                      textDirection:
                                      TextDirection.rtl,
                                      controller: _ownerController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "اسم المالك",
                                        fillColor: Colors.white,
                                        filled: true,
                                        errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "اسم المالك",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          alignment: Alignment.center,
                                          matchTextDirection: true,
                                          repeat:
                                          ImageRepeat.noRepeat,
                                          image: AssetImage(
                                              "assets/images/ic_mycar.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          color: const Color(0xffF4F4F4),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor:
                                const Color(0xff1891C7),
                                activeColor: Colors.lightBlueAccent,
                              ),
                              Text("مع السائق"),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    alignment: Alignment.center,
                                    matchTextDirection: true,
                                    repeat: ImageRepeat.noRepeat,
                                    image: AssetImage(
                                        "assets/images/ic_driver.png"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          color: const Color(0xff43A2CC),
                          child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  items: _noarray.map(
                                          (String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      }).toList(),
                                  value: __noarraycurrentItemSelected,
                                  onChanged:
                                      (String newValueSelected) {
                                    // Your code to execute, when a menu item is selected from dropdown
                                    _onDropDownItemSelectedno(
                                        newValueSelected);
                                  },
                                  style: new TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ),
                        Container(
                          width: 100,
                          color: const Color(0xff43A2CC),
                          child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  items: _advarray.map(
                                          (String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      }).toList(),
                                  value: __advarraycurrentItemSelected,
                                  onChanged:
                                      (String newValueSelected) {
                                    // Your code to execute, when a menu item is selected from dropdown
                                    _onDropDownItemSelectedadv(
                                        newValueSelected);
                                  },
                                  style: new TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 150,
                        color: const Color(0xff43A2CC),
                        child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: Row(
                                children: <Widget>[
                                  DropdownButton<String>(
                                    items: _Payloadarray.map(
                                            (String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                    value: _PayloadcurrentItemSelected,
                                    onChanged:
                                        (String newValueSelected) {
                                      // Your code to execute, when a menu item is selected from dropdown
                                      _onDropDownItemSelectedpay(
                                          newValueSelected);
                                    },
                                    style: new TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        alignment: Alignment.center,
                                        matchTextDirection: true,
                                        repeat:
                                        ImageRepeat.noRepeat,
                                        image: AssetImage(
                                            "assets/images/ic_wcar.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Container(
                        width: 150,
                        color: const Color(0xff43A2CC),
                        child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: Row(
                                children: <Widget>[
                                  DropdownButton<String>(
                                    items: _Categoryarray
                                        .map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    value: _CategorycurrentItemSelected,
                                    onChanged:
                                        (String newValueSelected) {
                                      // Your code to execute, when a menu item is selected from dropdown
                                      _onDropDownItemSelectedcat(
                                          newValueSelected);
                                    },
                                    style: new TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        alignment: Alignment.center,
                                        matchTextDirection: true,
                                        repeat:
                                        ImageRepeat.noRepeat,
                                        image: AssetImage(
                                            "assets/images/ic_wbcar.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Container(
                        width: 50,
                        color: const Color(0xff43A2CC),
                        child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: Row(
                                children: <Widget>[
                                  DropdownButton<String>(
                                    items: _cityarray
                                        .map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    value: _citycurrentItemSelected,
                                    onChanged:
                                        (String newValueSelected) {
                                      // Your code to execute, when a menu item is selected from dropdown
                                      _onDropDownItemSelectedcity(
                                          newValueSelected);
                                    },
                                    style: new TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        alignment: Alignment.center,
                                        matchTextDirection: true,
                                        repeat:
                                        ImageRepeat.noRepeat,
                                        image: AssetImage(
                                            "assets/images/ic_wlocation.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                  Padding(
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
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          maxLines: null,
                          controller: _shortController,
                          textDirection: TextDirection.rtl,
                          validator: (String value) {
                            if ((value.isEmpty)) {
                              return 'برجاء ادخال وصف مختصر';
                            }
                          },
                          onChanged: (value) {},
                          //  controller: controller,
                          decoration: InputDecoration(
                              labelText: "   وصف مختصر: ",
                              hintText: " وصف مختصر ",
                              hintStyle: TextStyle(fontSize: 10.0),
                              labelStyle: TextStyle(fontSize: 10.0),
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15.0),
                              contentPadding:
                              new EdgeInsets.symmetric(
                                  vertical: 20.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0)))),
                        ),
                      ),
                    ),
                  ),

                  Padding(
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
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          maxLines: null,
                          controller: _detailController,
                          textDirection: TextDirection.rtl,
                          onChanged: (value) {},
                          //  controller: controller,
                          validator: (String value) {
                            if ((value.isEmpty)) {
                              return 'برجاء ادخال التفاصيل إضافية';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "   تفاصيل إضافية :",
                              hintText: "    تفاصيل إضافية :",
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15.0),
                              hintStyle: TextStyle(fontSize: 10.0),
                              labelStyle: TextStyle(fontSize: 10.0),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 50.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0)))),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 300 /*MediaQuery.of(context).size.width*/,
                      height: 50,
                      child: new RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text("إضافة"),
                            Icon(Icons.check,color: Colors.white,),
                          ],
                        ),
                        textColor: Colors.white,
                        color: const Color(0xff43A2CC),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if(sampleImage1 != null){
                              uploadpp();

                              setState(() {
                                //  _load2 = true;
                              });
                            }else{
                              Toast.show("111111ا",context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

                            }

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
            ),
          ),
        ),
      ]),
    );
  }

  void _onDropDownItemSelectedcat(String newValueSelected) {
    setState(() {
      this._CategorycurrentItemSelected = newValueSelected;
    });
  }

  void _onDropDownItemSelectedpay(String newValueSelected) {
    setState(() {
      this._PayloadcurrentItemSelected = newValueSelected;
    });
  }
  void _onDropDownItemSelectedno(String newValueSelected) {
    setState(() {
      this.__noarraycurrentItemSelected = newValueSelected;
    });
  }

  void _onDropDownItemSelectedadv(String newValueSelected) {
    setState(() {
      this.__advarraycurrentItemSelected = newValueSelected;
    });
  }
  void _onDropDownItemSelectedcity(String newValueSelected) {
    setState(() {
      this._citycurrentItemSelected = newValueSelected;
    });
  }
  void createRecord(url) {
    FirebaseAuth.instance.currentUser().then((user) => user == null
        ?null
        :setState(() {
      _userId = user.uid;
      DateTime now = DateTime.now();
      String date1 ='${now.year}-${now.month}-${now.day}';// ${now.hour}:${now.minute}:00.000';
      String date ='${now.year}-${now.month}-${now.day}-${now.hour}-${now.minute}-00-000';

      orderdatabaseReference.child(_userId).child(date).set({
        'cId': _userId,
        'cdate': date1,
        'clat1':"a",
        'clong1':"a",
        'clat2': "a",
        'clong2': "a",
        'cType': "عرض",
        'cCategory': _CategorycurrentItemSelected,
        'cpayload': _PayloadcurrentItemSelected,
        'cnocars':__noarraycurrentItemSelected,
        'ctime':"a",
        'cpublished': false,
        'cstarttraveltime': "",
        'curi': url,
        //////////////////////////
        'ccity': _citycurrentItemSelected,
        'cadv': __advarraycurrentItemSelected,
        'ctitle': _titleController.text,
        'ccompany': _companyController.text,
        'cowner': _ownerController.text,
        'cmodel': _modelController.text,
        'cdriver': false,
        'cshort': _shortController.text,
        'cdetail': _detailController.text,

      }).whenComplete(() {
        showInSnackBar("تم إرسال طلبك للمراجعه بنجاح");
        setState(() {
          _load2 = false;
        });
      }).catchError((e) {
        Toast.show(e,context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
        setState(() {
          _load2 = false;
        });
      });

    })
    );



  }
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        style: TextStyle(color: const Color(0xff48B2E1)),
      ),
    ));
  }
  Future uploadpp() async {
    Toast.show("22222",context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child('myimage');
    DateTime now = DateTime.now();

//    String currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute) as String;
    final StorageUploadTask uploadTask =
    storageRef.child('$now.jpg').putFile(sampleImage1);
    var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url = Imageurl.toString();
    print('URL Is $url');
    setState(() {
     // _load1 = false;
    });
    Toast.show("تم تحميل الصورة الشخصية",context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
   // uploadwp(url);
    createRecord(url);
    setState(() {
     // _load1 = true;
    });
  }
  Future getImage1() async {
    var tempImage1 = await ImagePicker.pickImage(source: ImageSource.gallery);
    ///***************************************
    final tempDir1 =await getTemporaryDirectory();
    final path1 = tempDir1.path;

    int rand1= new Math.Random().nextInt(100000);

    Img.Image image1= Img.decodeImage(tempImage1.readAsBytesSync());
    Img.Image smallerImg1 = Img.copyResizeCropSquare(image1, 500);
    var compressImg1= new File("$path1/image1_$rand1.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg1, quality: 50));
    /// **********************************
    setState(() {
      sampleImage1 = compressImg1;
     // Toast.show(sampleImage1.toString(),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    });
  }

}
