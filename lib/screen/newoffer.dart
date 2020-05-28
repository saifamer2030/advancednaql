import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewOffer extends StatefulWidget {
  @override
  _newoffer createState() => _newoffer();
}

@override
class _newoffer extends State<NewOffer> {
  final double _minimumPadding = 5.0;
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
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: _minimumPadding * 18,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 150,
                        color: const Color(0xffEDEBEB),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                ))
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: <Widget>[
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
                                    child: TextField(
                                      textAlign: TextAlign.right,
                                      keyboardType: TextInputType.text,
                                      textDirection: TextDirection.rtl,
                                      controller: _titleController,
                                      onChanged: (value) {},
                                      //  controller: controller,
                                      decoration: InputDecoration(
                                          labelText: "عنوان الإعلان",
                                          hintText: "عنوان الإعلان",
//                                prefixIcon: Icon(
//                                  Icons.phone_iphone,
//                                  color: Colors.pinkAccent,
//                                ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)))),
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
                                          width: 300,
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
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: "الموديل",
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  errorStyle: TextStyle(
                                                      color: Colors.black,
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
                                          width: 300,
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: TextFormField(
                                                // textAlign: TextAlign.right,
                                                keyboardType:
                                                    TextInputType.text,

                                                textDirection:
                                                    TextDirection.rtl,
                                                controller: _companyController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: "الشركة",
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  errorStyle: TextStyle(
                                                      color: Colors.black,
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
                                          width: 300,
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: TextFormField(
                                                // textAlign: TextAlign.right,
                                                keyboardType:
                                                    TextInputType.text,

                                                textDirection:
                                                    TextDirection.rtl,
                                                controller: _ownerController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: "اسم المالك",
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  errorStyle: TextStyle(
                                                      color: Colors.black,
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
                                          MainAxisAlignment.center,
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
                                    width: 100,
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
                                  width: 100,
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
                                  width: 100,
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
                                  width: 100,
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
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    maxLines: null,
                                    controller: _shortController,
                                    textDirection: TextDirection.rtl,
                                    onChanged: (value) {},
                                    //  controller: controller,
                                    decoration: InputDecoration(
                                        labelText: "   وصف مختصر: ",
                                        hintText: " وصف مختصر ",
                                        hintStyle: TextStyle(fontSize: 10.0),
                                        labelStyle: TextStyle(fontSize: 10.0),
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
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    maxLines: null,
                                    controller: _detailController,
                                    textDirection: TextDirection.rtl,
                                    onChanged: (value) {},
                                    //  controller: controller,
                                    decoration: InputDecoration(
                                        labelText: "   تفاصيل إضافية :",
                                        hintText: "    تفاصيل إضافية :",
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
                                  onPressed: () {},
//
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0)),
                                ),
                              ),
                            ),
//                                Container(
//                                  width: 300,
//                                  height: 70,
//                                  child: Padding(
//                                    padding: const EdgeInsets.all(5.0),
//                                    child: Card(
//                                      elevation: 0.0,
//                                      color: Colors.white,
//                                      shape: RoundedRectangleBorder(
//                                        borderRadius: BorderRadius.circular(5),
//                                      ),
//                                      child: Directionality(
//                                        textDirection: TextDirection.rtl,
//                                        child: TextField(
//                                          textAlign: TextAlign.right,
//                                          keyboardType: TextInputType.text,
//                                          textDirection: TextDirection.rtl,
//                                          controller: null,
//                                          onChanged: (value) {},
//                                          //  controller: controller,
//                                          decoration: InputDecoration(
//                                              labelText: "عنوان الإعلان",
//                                              hintText: "عنوان الإعلان",
////                                prefixIcon: Icon(
////                                  Icons.phone_iphone,
////                                  color: Colors.pinkAccent,
////                                ),
//                                              border: OutlineInputBorder(
//                                                  borderRadius:
//                                                      BorderRadius.all(
//                                                          Radius.circular(
//                                                              5.0)))),
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ),
                          ],
                        ),
                      ),
                    ],
                  )
//                  Container(
//                    width: 200,
//                    height: 200,
//                    color: const Color(0xffEDEBEB),
//                  ),
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

}
