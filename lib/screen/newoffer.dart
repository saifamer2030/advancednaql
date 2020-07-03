import 'package:advancednaql/classes/CityClass.dart';
import 'package:advancednaql/translation/app_localizations.dart';
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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';

class NewOffer extends StatefulWidget {
  String dep;
  int index;
  NewOffer(this.dep, this.index);

  @override
  _newoffer createState() => _newoffer();
}

@override
class _newoffer extends State<NewOffer> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final double _minimumPadding = 5.0;
  String _userId;
  File sampleImage1;
  File sampleImage2;
  File sampleImage3;
  File sampleImage11;
  File sampleImage12;
  File sampleImage13;
  File sampleImage14;
  int picno=0;
  bool photoselected11=false;
  bool photoselected12=false;
  bool photoselected13=false;
  bool photoselected14=false;
  List<String> urlList = [];
  String city1;
  String city2;
  String city3;

 bool _travelcheck = false;
  bool Agrcheck=false;
  bool _advcheck=false;
  bool _nocheck = false;

  bool _load2 = false;
  final orderdatabaseReference =
  FirebaseDatabase.instance.reference().child("orderdata");

  bool isSwitched = true;
  var _Categoryarray = [
    'نقل خفيف',
    'نقل متوسط',
    'نقل ثقيل',
    'معدات ثقيلة',
    'معدات زراعية',
    'نقل ركاب',
    'أخرى'
  ];
  var _Payloadarray = [
    '100-200 كيلو',
    '200-300 كيلو',
    '400-500 كيلو',
    '600-700 كيلو',
    '800-900 كيلو'
  ];
  var _cityarray = ['جدة', 'الرياض', 'مكة', 'المدينة'];
  var _advarray = ['تشغيل', 'أيجار'];
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
    "حدد",
  ];
  TextEditingController _noController = TextEditingController();
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
//        for( var i = 0 ; i > _Categoryarray.length; i++ ) {
//      if(_Categoryarray[i]== widget.dep){
//        setState(() {
//          _CategorycurrentItemSelected = _Categoryarray[i];
//        });
//  }
//}
    _PayloadcurrentItemSelected = _Payloadarray[0];
    __advarraycurrentItemSelected= _advarray[0];
    __noarraycurrentItemSelected = _noarray[0];
    _citycurrentItemSelected = _cityarray[0];

    _CategorycurrentItemSelected = _Categoryarray[widget.index];

    //  setState(() {
       // this._CategorycurrentItemSelected = newValueSelected;
        if (_CategorycurrentItemSelected == 'نقل ركاب') {
          setState(() {
            _travelcheck = true;
            Agrcheck=false;

          });
        } else if(_CategorycurrentItemSelected == 'معدات زراعية'){
          setState(() {
            _travelcheck = false;
            Agrcheck=true;
          });
        }else{
          _travelcheck = false;
          Agrcheck=false;

        }
     // });
   // }

  }
  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _load2
        ? new Container(
      child: SpinKitCircle(color: Colors.blue),
    )
        : new Container();
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(children: <Widget>[
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

        Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: _minimumPadding * 22,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),

                children: <Widget>[
                  Center(
                    child: new InkWell(
                      onTap: (){
                        if(picno==0){
                          getImage1();
                        }else if (picno==1){
                          getImage2();
                        }else if (picno==2){
                          getImage3();
                        }else{
                Toast.show(Translations.of(context).translate('the_maximum_number_is_three'),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

                        }

                        },
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
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0,left: 160.0),
                                  child: (picno>0)?
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: new BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle),
                                          child: Center(
                                            child: Text(
                                            "$picno",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      :null,
                                ),

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
                                return Translations.of(context).translate('please_enter_the_ad_title');
                              }
                            },

                            onChanged: (value) {},
                            //  controller: controller,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                                labelText: Translations.of(context).translate('ad_title'),
                                hintText: Translations.of(context).translate('ad_title'),

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
                                            return Translations.of(context).translate('please_enter_the_model');
                                            }
                                            },
                                        decoration:  InputDecoration(
                                        border: InputBorder.none,
                                        labelText:Translations.of(context).translate('model'),
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
                                      Translations.of(context).translate('model'),
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
                                          return Translations.of(context).translate('please_enter_the_brand_name');
                                        }
                                      },
                                      textDirection:
                                      TextDirection.rtl,
                                      controller: _companyController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: Translations.of(context).translate('brand'),
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
                                      Translations.of(context).translate('brand'),
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
                                          return Translations.of(context).translate('please_enter_the_owners_name');
                                        }
                                      },
                                      textDirection:
                                      TextDirection.rtl,
                                      controller: _ownerController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText:Translations.of(context).translate('the_owners_name'),
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
                                      Translations.of(context).translate('the_owners_name'),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12),
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
                        (_advcheck==true||Agrcheck==true)?Text(""):Container(
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
                              Text(Translations.of(context).translate('with_the_driver'),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12),),
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
                  _nocheck == true
                      ? Padding(
                      padding: EdgeInsets.only(
                        right:20 ,left: 20,
                          top: _minimumPadding,
                          bottom: _minimumPadding),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          //textDirection: TextDirection.rtl,
                          controller: _noController,
                          validator: (String value) {
                            if ((_nocheck) && (value.isEmpty)) {
                              return Translations.of(context).translate('please_enter_the_number_of_trucks');
                            }
                          },
                          decoration: InputDecoration(
                            labelText: Translations.of(context).translate('number_of_trucks'),
                            //hintText: 'Name',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.red, fontSize: 15.0),
                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                          ),
                        ),
                      ))
                      : Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _travelcheck==true?Text(""): Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

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
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Container(
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
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Container(

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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Container(
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
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                          color: const Color(0xff43A2CC),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 48,
                                color: const Color(0xff43A2CC),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          showDialog(
                                              context: context,
                                              builder: (context) => MyForm2("",
                                                  onSubmit2: onSubmit2));
                                        });
//showBottomSheet();
                                      },
                                      child: Text(
                                       "مدينتك",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                 SizedBox(
                    height: 2*_minimumPadding,
                    width: _minimumPadding,
                  ) ,
                  (Agrcheck==true)?Text(""):Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 40,
                            color: const Color(0xffe7e7e7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (context) => MyForm4("",
                                              onSubmit4: onSubmit4));
                                    });
//showBottomSheet();
                                  },
                                  child: Text(
                                    Translations.of(context).translate('place_of_delivery'),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: const Color(0xff4fc3f7),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage(
                                            'assets/images/ic_location.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _minimumPadding,
                            width: _minimumPadding,
                          ),
                          Container(
                            width: 150,
                            height: 40,
                            color: const Color(0xffe7e7e7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (context) => MyForm3("",
                                              onSubmit3: onSubmit3));
                                    });
//showBottomSheet();
                                  },
                                  child: Text(
                                    Translations.of(context).translate('download_place'),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: const Color(0xff4fc3f7),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage(
                                            'assets/images/ic_location2.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 2*_minimumPadding,
                    width: _minimumPadding,
                  ) ,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Container(
                          height: 40,
                          child: new RaisedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Text(Translations.of(context).translate('copy_of_the_car_form'),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color:const Color(0xff1891C7),
                                  ),),
                                photoselected11?Icon(Icons.check,color: Colors.green,):Icon(Icons.add,color: Colors.black54,),
                              ],
                            ),
                            textColor: Colors.black54,
                            color: Colors.grey[300],
                            onPressed: () {
                              getImage11();
                            },
//
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          ),
                        ),
                      ),
                      (_advcheck==true||Agrcheck==true)?Text(""): Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Container(
                          width: 150 /*MediaQuery.of(context).size.width*/,
                          height: 40,
                          child: new RaisedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Text(Translations.of(context).translate('iD_photo'),
                                  style: TextStyle(
                                    color:const Color(0xff1891C7),
                                    fontSize: 10,
                                  ),),
                                photoselected12?Icon(Icons.check,color: Colors.green,):Icon(Icons.add,color: Colors.black54,),
                              ],
                            ),
                            textColor: Colors.black54,
                            color: Colors.grey[300],
                            onPressed: () {
                              getImage12();
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
                                new Text(Translations.of(context).translate('equipment_image'),
                                  style: TextStyle(
                                    color:const Color(0xff1891C7),
                                    fontSize: 10,
                                  ),),
                                photoselected13?Icon(Icons.check,color: Colors.green,):Icon(Icons.add,color: Colors.black54,),
                              ],
                            ),
                            textColor: Colors.black54,
                            color: Colors.grey[300],
                            onPressed: () {
                              getImage13();
                            },
//
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          ),
                        ),
                      ),
                      (_advcheck==true||Agrcheck==true||isSwitched==false)?Text(""):Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Container(
                          width: 150 /*MediaQuery.of(context).size.width*/,
                          height: 40,
                          child: new RaisedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Text(Translations.of(context).translate('copy_of_the_drivers_license'),
                                  style: TextStyle(
                                      fontSize: 10,
                                    color:const Color(0xff1891C7),
                                      ),),
                                photoselected14?Icon(Icons.check,color: Colors.green,):Icon(Icons.add,color: Colors.black54,),
                              ],
                            ),
                            textColor: Colors.black54,
                            color: Colors.grey[300],
                            onPressed: () {
                              getImage14();
                            },
//
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          ),
                        ),
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
                          maxLength: 50,
                          controller: _shortController,
                          textDirection: TextDirection.rtl,
                          validator: (String value) {
                            if ((value.isEmpty)) {
                              return Translations.of(context).translate('please_enter_brief_description');
                            }
                          },
                          onChanged: (value) {},
                          //  controller: controller,
                          decoration: InputDecoration(
                              labelText:Translations.of(context).translate('brief_description'),
                              hintText:Translations.of(context).translate('brief_description'),
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
                          maxLength: 100,
                          onChanged: (value) {},
                          //  controller: controller,
                          validator: (String value) {
                            if ((value.isEmpty)) {
                              return Translations.of(context).translate('please_enter_additional_details');
                            }
                          },
                          decoration: InputDecoration(
                              labelText: Translations.of(context).translate('additional_details'),
                              hintText: Translations.of(context).translate('additional_details'),
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
                            new Text(Translations.of(context).translate('addition'),),
                            Icon(Icons.check,color: Colors.white,),
                          ],
                        ),
                        //_advcheck==true||Agrcheck==true||isSwitched==false
                        textColor: Colors.white,
                        color: const Color(0xff43A2CC),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (sampleImage11 != null && ((sampleImage12 != null)&&(!_advcheck||!Agrcheck))
                                && sampleImage13 != null && ((sampleImage14 != null)&&(!_advcheck||!Agrcheck||isSwitched))
                                && sampleImage1 != null) {
    if((((city1==""||city1==null)||(city2==""||city2==null))&&(!Agrcheck))||(city3==""||city3==null)){
    Toast.show("برجاء ادخال المدينة", context,
    duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

    }else {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          uploadpp11();

          setState(() {
            _load2 = true;
          });
        }
      } on SocketException catch (_) {
        //  print('not connected');
        Toast.show(
            Translations.of(context).translate('please_see_network_connection'),
            context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }
                            }else{
                            Toast.show(Translations.of(context).translate('please_add_the_required_images'),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

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
        new Align(
          child: loadingIndicator,
          alignment: FractionalOffset.center,
        ),
      ]),
    );
  }

  void _onDropDownItemSelectedcat(String newValueSelected) {
//    'نقل خفيف',
//    'نقل متوسط',
//    'نقل ثقيل',
//    'معدات ثقيلة',
//    'معدات زراعية',
//    'نقل ركاب'

    setState(() {
      this._CategorycurrentItemSelected = newValueSelected;
      if (newValueSelected == 'نقل ركاب') {
        setState(() {
          _travelcheck = true;
          Agrcheck=false;

        });
      } else if(newValueSelected == 'معدات زراعية'){
        setState(() {
          _travelcheck = false;
          Agrcheck=true;
        });
      }else{
        _travelcheck = false;
        Agrcheck=false;

      }
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
      if (newValueSelected == "حدد") {
        setState(() {
          _nocheck = true;
        });
      } else {
        setState(() {
          _nocheck = false;
        });
      }
    });
  }

  void _onDropDownItemSelectedadv(String newValueSelected) {
    setState(() {
      this.__advarraycurrentItemSelected = newValueSelected;
      if (newValueSelected == "أيجار") {
        setState(() {
          _advcheck = true;
        });
      } else {
        setState(() {
          _advcheck = false;
        });
      }
    });
  }
  void _onDropDownItemSelectedcity(String newValueSelected) {
    setState(() {
      this._citycurrentItemSelected = newValueSelected;
    });
  }
  void createRecord(url11,url12,url13,url14) {
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
        'clat1':city2,
        'clong1':date,
        'clat2': city1,
        'clong2': date,
        // 'cType': Translations.of(context).translate('show'),
        'cType': 'عرض',
        'cCategory': _CategorycurrentItemSelected,
        'cpayload':_travelcheck?"": _PayloadcurrentItemSelected,
        'cnocars':_nocheck?_noController.text:__noarraycurrentItemSelected,
        'ctime':"a",
        'cpublished': false,
        'cstarttraveltime': "",
        'curi': url13,
        //////////////////////////
        'ccity': city3,
        'cadv': __advarraycurrentItemSelected,
        'ctitle': _titleController.text,
        'ccompany': _companyController.text,
        'cowner': _ownerController.text,
        'cmodel': _modelController.text,
        'cdriver': isSwitched,
        'cshort': _shortController.text,
        'cdetail': _detailController.text,
        'curi11': url11,
        'curi12': url12,
        'curi14': url14,
        'curilist': urlList.toString(),

      }).whenComplete(() {
     //   Toast.show("تم إرسال طلبك للمراجعه بنجاح",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

        //showInSnackBar("تم إرسال طلبك للمراجعه بنجاح");
        setState(() {
          _load2 = false;
          isSwitched=false;
           photoselected11=false;
           photoselected12=false;
           photoselected13=false;
           photoselected14=false;
           _titleController.text = "";
          _modelController.text = "";
          _companyController.text = "";
          _ownerController.text = "";
          _ownerController.text = "";
          _shortController.text = "";
          _detailController.text = "";
          _CategorycurrentItemSelected = _Categoryarray[0];
          _PayloadcurrentItemSelected = _Payloadarray[0];
          __advarraycurrentItemSelected= _advarray[0];
          __noarraycurrentItemSelected = _noarray[0];
          _citycurrentItemSelected = _cityarray[0];
city2="";city1="";city3="";
_nocheck=false;
           _travelcheck = false;
           Agrcheck=false;
           _advcheck=false;
          urlList.clear();
        });
        showAlertDialog( context);
      }).catchError((e) {
        Toast.show(e,context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
        setState(() {
          _load2 = false;
        });
      });

    })
    );



  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("إلغاء"),
      onPressed: () { Navigator.pop(context); },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(Translations.of(context).translate('congratulations'),),
      content: Text(Translations.of(context).translate('your_request_has_been_sent_for_review_successfully'),),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
  Future uploadpp1(url11,url12,url13,url14) async {
   // Toast.show("22222",context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child('myimage');
    DateTime now = DateTime.now();

//    String currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute) as String;
    final StorageUploadTask uploadTask =
    storageRef.child('$now.jpg').putFile(sampleImage1);
    var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url1 = Imageurl.toString();
    //print('URL Is $url1');

    Toast.show(Translations.of(context).translate('Image_1uploaded'),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
    setState(() {
      urlList.add(url1);
       _load2 = false;
    });    if(picno>=2){
       uploadpp2(url11,url12,url13,url14);
    }else if(picno==1){
      createRecord(url11,url12,url13,url14);
    }
   // uploadpp1(url11,url12,url13,url14,url1);
    setState(() {
      _load2 = true;
    });
  }
  Future uploadpp2(url11,url12,url13,url14) async {

    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child('myimage');
    DateTime now = DateTime.now();

//    String currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute) as String;
    final StorageUploadTask uploadTask =
    storageRef.child('$now.jpg').putFile(sampleImage2);
    var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url2 = Imageurl.toString();
   // print('URL Is $url');
    setState(() {
      _load2= false;
    });
    Toast.show(Translations.of(context).translate('Image_2uploaded'),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
    // uploadwp(url);
    setState(() {
      urlList.add(url2);
      // _load1 = false;
    });    if(picno>=3){
      uploadpp3(url11,url12,url13,url14);
    }else if(picno==2){
      createRecord(url11,url12,url13,url14);
    }
    setState(() {
       _load2 = true;
    });
  }
  Future uploadpp3(url11,url12,url13,url14) async {
    // Toast.show("22222",context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child('myimage');
    DateTime now = DateTime.now();

//    String currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute) as String;
    final StorageUploadTask uploadTask =
    storageRef.child('$now.jpg').putFile(sampleImage3);
    var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url3 = Imageurl.toString();
    //print('URL Is $url3');
    setState(() {
      // _load1 = false;
    });
    Toast.show(Translations.of(context).translate('profile_photo_uploaded'),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
    // uploadwp(url);
    setState(() {
      urlList.add(url3);
       _load2 = false;
    });
      createRecord(url11,url12,url13,url14);

    setState(() {
      _load2 = true;
    });
  }
  Future uploadpp11() async {
    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child('myimage');
    DateTime now = DateTime.now();

//    String currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute) as String;
    final StorageUploadTask uploadTask =
    storageRef.child('$now.jpg').putFile(sampleImage11);
    var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url11 = Imageurl.toString();
    //print('URL Is $url');
    setState(() {
       _load2 = false;
    });
    Toast.show(Translations.of(context).translate('the_photo_has_been_uploaded_the_car_form'),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
    // uploadwp(url);
    uploadpp12(url11);
    setState(() {
       _load2 = true;
    });
  }
  Future uploadpp12(String url11) async {
    // Toast.show("22222",context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child('myimage');
    DateTime now = DateTime.now();

//    String currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute) as String;
    final StorageUploadTask uploadTask =
    storageRef.child('$now.jpg').putFile(sampleImage12);
    var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url12 = Imageurl.toString();
    //print('URL Is $url');
    setState(() {
       _load2 = false;
    });
    Toast.show(Translations.of(context).translate('id_photo_uploaded'),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
    // uploadwp(url);
    uploadpp13(url11,url12);
    setState(() {
       _load2 = true;
    });
  }
  Future uploadpp13(url11,url12) async {
    // Toast.show("22222",context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child('myimage');
    DateTime now = DateTime.now();

//    String currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute) as String;
    final StorageUploadTask uploadTask =
    storageRef.child('$now.jpg').putFile(sampleImage13);
    var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url13 = Imageurl.toString();
    //print('URL Is $url');
    setState(() {
       _load2 = false;
    });
    Toast.show(Translations.of(context).translate('equipment_image_uploaded'),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
    // uploadwp(url);
    uploadpp14(url11,url12,url13);
    setState(() {
      _load2 = true;
    });
  }
  Future uploadpp14(url11,url12,url13) async {
    // Toast.show("22222",context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child('myimage');
    DateTime now = DateTime.now();

//    String currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute) as String;
    final StorageUploadTask uploadTask =
    storageRef.child('$now.jpg').putFile(sampleImage14);
    var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url14 = Imageurl.toString();
    //print('URL Is $url');
    setState(() {
       _load2 = false;
    });
    Toast.show(Translations.of(context).translate('Photo_Drivers_license_uploaded'),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
    // uploadwp(url);
    uploadpp1(url11,url12,url13,url14);
    setState(() {
      _load2 = true;
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
      picno++;
     // Toast.show(sampleImage1.toString(),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    });
  }
  Future getImage2() async {
    var tempImage2 = await ImagePicker.pickImage(source: ImageSource.gallery);
    ///***************************************
    final tempDir2 =await getTemporaryDirectory();
    final path2 = tempDir2.path;

    int rand2= new Math.Random().nextInt(100000);

    Img.Image image2= Img.decodeImage(tempImage2.readAsBytesSync());
    Img.Image smallerImg2 = Img.copyResizeCropSquare(image2, 500);
    var compressImg2= new File("$path2/image2_$rand2.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg2, quality: 50));
    /// **********************************
    setState(() {
      sampleImage2 = compressImg2;
      picno++;
      // Toast.show(sampleImage1.toString(),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    });
  }
  Future getImage3() async {
    var tempImage3 = await ImagePicker.pickImage(source: ImageSource.gallery);
    ///***************************************
    final tempDir3 =await getTemporaryDirectory();
    final path3 = tempDir3.path;

    int rand3= new Math.Random().nextInt(100000);

    Img.Image image3= Img.decodeImage(tempImage3.readAsBytesSync());
    Img.Image smallerImg3 = Img.copyResizeCropSquare(image3, 500);
    var compressImg3= new File("$path3/image3_$rand3.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg3, quality: 50));
    /// **********************************
    setState(() {
      sampleImage3 = compressImg3;
      picno++;
      // Toast.show(sampleImage1.toString(),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    });
  }
  Future getImage11() async {
    var tempImage11 = await ImagePicker.pickImage(source: ImageSource.gallery);
    ///***************************************
    final tempDir11 =await getTemporaryDirectory();
    final path11 = tempDir11.path;

    int rand11= new Math.Random().nextInt(100000);

    Img.Image image11= Img.decodeImage(tempImage11.readAsBytesSync());
    Img.Image smallerImg11 = Img.copyResizeCropSquare(image11, 500);
    var compressImg11= new File("$path11/image11_$rand11.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg11, quality: 50));
    /// **********************************
    setState(() {
      sampleImage11 = compressImg11;
      photoselected11=true;
      //picno++;
      // Toast.show(sampleImage1.toString(),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    });
  }
  Future getImage12() async {
    var tempImage12 = await ImagePicker.pickImage(source: ImageSource.gallery);
    ///***************************************
    final tempDir12 =await getTemporaryDirectory();
    final path12 = tempDir12.path;

    int rand12= new Math.Random().nextInt(100000);

    Img.Image image12= Img.decodeImage(tempImage12.readAsBytesSync());
    Img.Image smallerImg12 = Img.copyResizeCropSquare(image12, 500);
    var compressImg12= new File("$path12/image12_$rand12.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg12, quality: 50));
    /// **********************************
    setState(() {
      sampleImage12 = compressImg12;
      photoselected12=true;

      //picno++;
      // Toast.show(sampleImage1.toString(),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    });
  }
  Future getImage13() async {
    var tempImage13 = await ImagePicker.pickImage(source: ImageSource.gallery);
    ///***************************************
    final tempDir13 =await getTemporaryDirectory();
    final path13 = tempDir13.path;

    int rand13= new Math.Random().nextInt(100000);

    Img.Image image13= Img.decodeImage(tempImage13.readAsBytesSync());
    Img.Image smallerImg13 = Img.copyResizeCropSquare(image13, 500);
    var compressImg13= new File("$path13/image13_$rand13.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg13, quality: 50));
    /// **********************************
    setState(() {
      sampleImage13 = compressImg13;
      photoselected13=true;

      //picno++;
      // Toast.show(sampleImage1.toString(),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    });
  }
  Future getImage14() async {
    var tempImage14 = await ImagePicker.pickImage(source: ImageSource.gallery);
    ///***************************************
    final tempDir14 =await getTemporaryDirectory();
    final path14 = tempDir14.path;

    int rand14= new Math.Random().nextInt(100000);

    Img.Image image14= Img.decodeImage(tempImage14.readAsBytesSync());
    Img.Image smallerImg14 = Img.copyResizeCropSquare(image14, 500);
    var compressImg14= new File("$path14/image14_$rand14.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg14, quality: 50));
    /// **********************************
    setState(() {
      sampleImage14 = compressImg14;
      photoselected14=true;

      //picno++;
      // Toast.show(sampleImage1.toString(),context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

    });
  }

  void onSubmit2(String result) {
    Toast.show("${result}", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    setState(() {
      city3=result;
    });
  }
  void onSubmit4(String result) {
    Toast.show("${result}", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    setState(() {
      city1=result;
    });
  }
  void onSubmit3(String result) {
    Toast.show("${result}", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    setState(() {
      city2=result;
    });
  }
}
//////////////////////////////////

typedef void MyFormCallback2(String result);

class MyForm2 extends StatefulWidget {
  final MyFormCallback2 onSubmit2;
  String quarter11;

  MyForm2(this.quarter11, {this.onSubmit2});

  @override
  _MyForm2State createState() => _MyForm2State();
}

class _MyForm2State extends State<MyForm2> {
  String _currentValue = '';
  List<CityClass> regionlist = [];



  @override
  void initState() {
    super.initState();
    _currentValue = widget.quarter11;

    final regiondatabaseReference =
    FirebaseDatabase.instance.reference().child("City");
    regiondatabaseReference.once().then((DataSnapshot snapshot) {
      var KEYS = snapshot.value.keys;
      var DATA = snapshot.value;
      //Toast.show("${snapshot.value.keys}",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
      regionlist.clear();
      for (var individualkey in KEYS) {
        CityClass regionclass =new CityClass(
          DATA[individualkey]['ccid'],
          DATA[individualkey]['ccity'],
          DATA[individualkey]['cregion'],

        );
        setState(() {
          regionlist.add(regionclass);
        });

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("إلغاء"),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );
    Widget continueButton = FlatButton(
      child: Text("حفظ"),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
          widget.onSubmit2(_currentValue.toString());
        });
      },
    );
    return AlertDialog(
      title: Text(
        "اختر المدينة:",
        style: TextStyle(fontWeight: FontWeight.bold),
        textDirection: TextDirection.rtl,
      ),
      content:new ListView.builder(
        itemCount: regionlist.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(regionlist[i].cregion, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            children: <Widget>[
              Column(
                // padding: EdgeInsets.all(8.0),
                children: regionlist[i].ccity.split(",")
                    .map((value) => RadioListTile(
                  groupValue: _currentValue,
                  title: Text(
                    value,
                    textDirection: TextDirection.rtl,
                  ),
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      debugPrint('VAL = $val');
                      _currentValue = val;
                    });
                  },
                ))
                    .toList(),
              ),

            ],
          );
        },
      ),

      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}




//////////////////////////////////

typedef void MyFormCallback4(String result);

class MyForm4 extends StatefulWidget {
  final MyFormCallback4 onSubmit4;
  String quarter11;

  MyForm4(this.quarter11, {this.onSubmit4});

  @override
  _MyForm4State createState() => _MyForm4State();
}

class _MyForm4State extends State<MyForm4> {
  String _currentValue = '';
  List<CityClass> regionlist = [];



  @override
  void initState() {
    super.initState();
    _currentValue = widget.quarter11;

    final regiondatabaseReference =
    FirebaseDatabase.instance.reference().child("City");
    regiondatabaseReference.once().then((DataSnapshot snapshot) {
      var KEYS = snapshot.value.keys;
      var DATA = snapshot.value;
      //Toast.show("${snapshot.value.keys}",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
      regionlist.clear();
      for (var individualkey in KEYS) {
        CityClass regionclass =new CityClass(
          DATA[individualkey]['ccid'],
          DATA[individualkey]['ccity'],
          DATA[individualkey]['cregion'],

        );
        setState(() {
          regionlist.add(regionclass);
        });

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("إلغاء"),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );
    Widget continueButton = FlatButton(
      child: Text("حفظ"),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
          widget.onSubmit4(_currentValue.toString());
        });
      },
    );
    return AlertDialog(
      title: Text(
        "اختر المدينة:",
        style: TextStyle(fontWeight: FontWeight.bold),
        textDirection: TextDirection.rtl,
      ),
      content:new ListView.builder(
        itemCount: regionlist.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(regionlist[i].cregion, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            children: <Widget>[
              Column(
                // padding: EdgeInsets.all(8.0),
                children: regionlist[i].ccity.split(",")
                    .map((value) => RadioListTile(
                  groupValue: _currentValue,
                  title: Text(
                    value,
                    textDirection: TextDirection.rtl,
                  ),
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      debugPrint('VAL = $val');
                      _currentValue = val;
                    });
                  },
                ))
                    .toList(),
              ),
//              new Column(
//                children:
//                _buildExpandableContent(regionlist[i]),
//              ),
            ],
          );
        },
      ),

      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}

//////////////////////////////////

typedef void MyFormCallback3(String result);

class MyForm3 extends StatefulWidget {
  final MyFormCallback3 onSubmit3;
  String quarter11;

  MyForm3(this.quarter11, {this.onSubmit3});

  @override
  _MyForm3State createState() => _MyForm3State();
}

class _MyForm3State extends State<MyForm3> {
  String _currentValue = '';
  List<CityClass> regionlist = [];



  @override
  void initState() {
    super.initState();
    _currentValue = widget.quarter11;

    final regiondatabaseReference =
    FirebaseDatabase.instance.reference().child("City");
    regiondatabaseReference.once().then((DataSnapshot snapshot) {
      var KEYS = snapshot.value.keys;
      var DATA = snapshot.value;
      //Toast.show("${snapshot.value.keys}",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
      regionlist.clear();
      for (var individualkey in KEYS) {
        CityClass regionclass =new CityClass(
          DATA[individualkey]['ccid'],
          DATA[individualkey]['ccity'],
          DATA[individualkey]['cregion'],

        );
        setState(() {
          regionlist.add(regionclass);
        });

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("إلغاء"),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );
    Widget continueButton = FlatButton(
      child: Text("حفظ"),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
          widget.onSubmit3(_currentValue.toString());
        });
      },
    );
    return AlertDialog(
      title: Text(
        "اختر المدينة:",
        style: TextStyle(fontWeight: FontWeight.bold),
        textDirection: TextDirection.rtl,
      ),
      content:new ListView.builder(
        itemCount: regionlist.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(regionlist[i].cregion, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            children: <Widget>[
              Column(
                // padding: EdgeInsets.all(8.0),
                children: regionlist[i].ccity.split(",")
                    .map((value) => RadioListTile(
                  groupValue: _currentValue,
                  title: Text(
                    value,
                    textDirection: TextDirection.rtl,
                  ),
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      debugPrint('VAL = $val');
                      _currentValue = val;
                    });
                  },
                ))
                    .toList(),
              ),
//              new Column(
//                children:
//                _buildExpandableContent(regionlist[i]),
//              ),
            ],
          );
        },
      ),

      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}
