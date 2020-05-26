
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:toast/toast.dart';


class newOrder extends StatefulWidget {
  @override
  _newOrderState createState() => _newOrderState();
}

class _newOrderState extends State<newOrder> {
  var _formKey = GlobalKey<FormState>();
  final double _minimumPadding = 5.0;
  var _Categoryarray = ['نقل خفيف', 'نقل متوسط', 'نقل ثقيل','معدات ثقيلة', 'معدات زراعية', 'نقل ركاب'];
  var _Payloadarray =  ['100-200 كيلو', '200-300 كيلو', '400-500 كيلو','600-700 كيلو', '800-900 كيلو'];
  var _timearray =  [ 'خلال 6 ساعات', 'خلال 24 ساعة','حالا', 'حدد'];
  var _noarray=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","حدد"];

  TextEditingController _timeController = TextEditingController();
  TextEditingController _noController = TextEditingController();


  var _CategorycurrentItemSelected = '';
  var _PayloadcurrentItemSelected = '';
  var _timecurrentItemSelected = '';
  var __noarraycurrentItemSelected = '';
  String _userId;
  bool _timecheck = false;
  bool _nocheck = false;

  bool _load2 = false;
  final orderdatabaseReference =
  FirebaseDatabase.instance.reference().child("orderdata");

  @override
  void initState() {
    super.initState();
     _CategorycurrentItemSelected = _Categoryarray[0];
     _PayloadcurrentItemSelected = _Payloadarray[0];
     _timecurrentItemSelected = _timearray[0];
     __noarraycurrentItemSelected = _noarray[0];

  }
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 86.0,
              decoration: BoxDecoration(
                color: const Color(0xff4fc3f7),
              ),
            ),
            Container(
              child: Transform.translate(
                offset: Offset(0.0, -220.0),
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
            ),
            Container(
              child: Transform.translate(
                offset: Offset(0.0, -150.0),
                child:
                // Adobe XD layer: 'logoBox' (shape)
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff4fc3f7),
                    ),
                  ),
                ),
              ),
            ),


            Form(
              key: _formKey,
              child: Padding(
                  padding: EdgeInsets.only(top:_minimumPadding * 35,bottom: _minimumPadding * 2,right: _minimumPadding * 2,left: _minimumPadding * 2),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      //getImageAsset(),
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 150,
                              height: 40,
                              child: RaisedButton(
                                color: const Color(0xffe7e7e7),
                                onPressed:  () {
//
                                },
                                child:Text(
                                  "مكان التوصيل",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: const Color(0xff4fc3f7),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                               ,
                              ),
                            ),
                            SizedBox(
                              height: _minimumPadding,
                              width: _minimumPadding,
                            ),
                            Container(
                              width: 150,
                              height: 40,
                              child: RaisedButton(
                                color: const Color(0xffe7e7e7),
                                onPressed:  () {
//
                                },
                                child:Text(
                                  "مكان التحميل",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: const Color(0xff4fc3f7),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                                ,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10*_minimumPadding,
                        width: _minimumPadding,
                      ),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding, bottom: _minimumPadding),
                              child: Container(
                                height: 40.0,
                                width: 150,
                                child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: const Color(0xffdddddd),
                                    color: const Color(0xffe7e7e7),
                                    elevation: 2.0,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButton<String>(
                                        items: _timearray.map((String value) {
                                          return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                textDirection: TextDirection.rtl,
                                                style: TextStyle(
                                                    color: const Color(0xff4fc3f7),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ));
                                        }).toList(),
                                        value: _timecurrentItemSelected,
                                        onChanged: (String newValueSelected) {
                                          // Your code to execute, when a menu item is selected from dropdown
                                          _onDropDownItemSelectedtime(
                                              newValueSelected);
                                        },
                                      ),
                                    )),
                              ),
                            ),

                            SizedBox(
                              height: _minimumPadding,
                              width: _minimumPadding,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding, bottom: _minimumPadding),
                              child: Container(
                                height: 40.0,
                                width: 150,
                                child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: const Color(0xffdddddd),
                                    color: const Color(0xffe7e7e7),
                                    elevation: 2.0,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButton<String>(
                                        items: _Categoryarray.map((String value) {
                                          return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                textDirection: TextDirection.rtl,
                                                style: TextStyle(
                                                    color: const Color(0xff4fc3f7),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ));
                                        }).toList(),
                                        value: _CategorycurrentItemSelected,
                                        onChanged: (String newValueSelected) {
                                          // Your code to execute, when a menu item is selected from dropdown
                                          _onDropDownItemSelectedcat(
                                              newValueSelected);
                                        },
                                      ),
                                    )),
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding, bottom: _minimumPadding),
                              child: Container(
                                height: 40.0,
                                width: 150,

                                child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: const Color(0xffdddddd),
                                    color: const Color(0xffe7e7e7),
                                    elevation: 2.0,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButton<String>(
                                        items: _noarray.map((String value) {
                                          return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                textDirection: TextDirection.rtl,

                                                style: TextStyle(
                                                    color: const Color(0xff4fc3f7),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ));
                                        }).toList(),
                                        value: __noarraycurrentItemSelected,
                                        onChanged: (String newValueSelected) {
                                          // Your code to execute, when a menu item is selected from dropdown
                                          _onDropDownItemSelectedno(
                                              newValueSelected);
                                        },
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: _minimumPadding,
                              width: _minimumPadding,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding, bottom: _minimumPadding),
                              child: Container(
                                height: 40.0,
                                width: 150,

                                child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: const Color(0xffdddddd),
                                    color: const Color(0xffe7e7e7),
                                    elevation: 2.0,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButton<String>(
                                        items: _Payloadarray.map((String value) {
                                          return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                textDirection: TextDirection.rtl,

                                                style: TextStyle(
                                                    color: const Color(0xff4fc3f7),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ));
                                        }).toList(),
                                        value: _PayloadcurrentItemSelected,
                                        onChanged: (String newValueSelected) {
                                          // Your code to execute, when a menu item is selected from dropdown
                                          _onDropDownItemSelectedpay(
                                              newValueSelected);
                                        },
                                      ),
                                    )),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),
                      _nocheck==true?
                      Padding(
                          padding: EdgeInsets.only(
                              top: _minimumPadding, bottom: _minimumPadding),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.text,
                              style: textStyle,
                              //textDirection: TextDirection.rtl,
                              controller: _noController,
                              validator: (String value) {
                                if ((_nocheck)&&(value.isEmpty)) {
                                  return 'برجاء ادخال عدد الشاحنات';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'عدد الشاحنات',
                                //hintText: 'Name',
                                labelStyle: textStyle,
                                errorStyle: TextStyle(
                                    color: Colors.red, fontSize: 15.0),
                                // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                              ),
                            ),
                          ))
                          :Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),
                      _timecheck==true?
                      Padding(
                          padding: EdgeInsets.only(
                              top: _minimumPadding, bottom: _minimumPadding),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.emailAddress,
                              style: textStyle,
                              //textDirection: TextDirection.rtl,
                              controller: _timeController,
                              validator: (String value) {
                                if ((_timecheck)&&(value.isEmpty)) {
                                  return 'برجاء إدخال وقت الطلب';
                                }

                              },
                              decoration: InputDecoration(
                                labelText: 'وقت الطلب',
                                //hintText: 'Name',
                                labelStyle: textStyle,
                                errorStyle: TextStyle(
                                    color: Colors.red, fontSize: 15.0),
                                // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                              ),
                            ),
                          ))
                      :Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),


                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: Container(
                          height: 50.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: const Color(0xff4fc3f7),
                            color: const Color(0xff4fc3f7),
                            elevation: 3.0,
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  createRecord();
                                  setState(() {
                                    _load2 = true;
                                  });
                                } else
                                  print('correct');
                              },
                              child: Center(
                                child: Text(
                                  'طلب',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )),
            ),
            //new Align(child: loadingIndicator,alignment: FractionalOffset.center,),

          ],
        ),
      ),
    );
  }




  void createRecord() {
    FirebaseAuth.instance.currentUser().then((user) => user == null
        ?null
        :setState(() {
          _userId = user.uid;
          DateTime now = DateTime.now();
String date1 ='${now.year}-${now.month}-${now.day}';// ${now.hour}:${now.minute}:00.000';
String date ='${now.year}-${now.month}-${now.day}-${now.hour}-${now.minute}-00-000';

          orderdatabaseReference.child(_userId).child(date).set({
      'cId': _userId,
      'date': date1,
      'lat1':"31",
      'long1':"31",
       'lat2': "30",
       'long2': "30",
      'cType': "order",
      'Category': _CategorycurrentItemSelected,
      'payload': _PayloadcurrentItemSelected,
      'nocars':_nocheck?_noController.text:__noarraycurrentItemSelected,
      'time':_timecheck?_timeController.text:_timecurrentItemSelected,
      'published': false,
    }).whenComplete(() {
      Toast.show(date1+"تم ارسال طلبك بنجاح",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

    });
        })
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
      if(newValueSelected=="حدد"){setState(() {
        _nocheck=true;
      });}else{setState(() {
        _nocheck=false;
      });}
    });
  }
  void _onDropDownItemSelectedtime(String newValueSelected) {
    setState(() {
      this._timecurrentItemSelected = newValueSelected;
      if(newValueSelected=="حدد"){setState(() {
        _timecheck=true;
      });}else{setState(() {
        _timecheck=false;
      });}
    });
  }

}