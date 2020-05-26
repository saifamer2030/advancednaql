
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
  var _Payloadarray =  ['100-200 كيلو', '200-300 كيلو', '400-500 كيلو''600-700 كيلو', '800-900 كيلو'];
  var _timearray =  ['حالا', 'خلال 6 ساعات', 'خلال 24 ساعة'];
  var _noarray=["1","2","3"];

  TextEditingController _timeController = TextEditingController();
  TextEditingController _noController = TextEditingController();


  var _CategorycurrentItemSelected = '';
  var _PayloadcurrentItemSelected = '';
  var _timecurrentItemSelected = '';
  var __noarraycurrentItemSelected = '';


  bool _load2 = false;
  final userdatabaseReference =
  FirebaseDatabase.instance.reference().child("coiffuredata");

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
                offset: Offset(0.0, -270.0),
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

            Form(
              key: _formKey,
              child: Padding(
                  padding: EdgeInsets.all(_minimumPadding * 2),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      //getImageAsset(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: Center(
                          child: Container(
                            color: const Color(0xffF1AB37),
                            width: 400,height: 50,

                          ),
                        ),
                      ),
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),

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
                                if (value.isEmpty) {
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
                          )),
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),
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
                                if (value.isEmpty) {
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
                          )),
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "الدولة",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: const Color(0xffF1AB37),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: Container(
                          height: 40.0,
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
                                          style: TextStyle(
                                              color: const Color(0xffF1AB37),
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
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "المدينة",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: const Color(0xffF1AB37),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: Container(
                          height: 40.0,
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
                                          style: TextStyle(
                                              color: const Color(0xffF1AB37),
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
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "الحي",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: const Color(0xffF1AB37),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: Container(
                          height: 40.0,
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
                                          style: TextStyle(
                                              color: const Color(0xffF1AB37),
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
                                          style: TextStyle(
                                              color: const Color(0xffF1AB37),
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
                          height: 50.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: const Color(0xffFCC201),
                            color: const Color(0xffF1AB37),
                            elevation: 3.0,
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                 // _uploaddata();
                                  setState(() {
                                    _load2 = true;
                                  });
                                } else
                                  print('correct');
                              },
                              child: Center(
                                child: Text(
                                  'تسجيل',
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
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding, bottom: _minimumPadding),
                              child:Text(
                                "ــــــــــــــــــــ",
                                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding, bottom: _minimumPadding),
                              child:Text(
                                "أو",
                                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding, bottom: _minimumPadding),
                              child:Text(
                                "ــــــــــــــــــــ",
                                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ),
                        Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
/**
                            Padding(
                                padding: EdgeInsets.only(
                                    top: _minimumPadding, bottom: _minimumPadding),
                                child: FloatingActionButton(
                                  heroTag: "unique1",
                                  onPressed: () {

                                  },
                                  child:  _getImageAsset(),
                                  backgroundColor: Colors.blue,
                                ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding, bottom: _minimumPadding),
                              child:FloatingActionButton(
                                heroTag: "unique3",
                                onPressed: () {
                                  setState(() {
                                    _load2 = true;
                                  });
                                  //Toast.show("google",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
                                  _handleSignIn()
                                      .then((FirebaseUser user) => createRecordgoogle(user))
                                      .catchError((e) =>
                                      Toast.show(e,context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM));
                                },
                                child:Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                backgroundColor: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding, bottom: _minimumPadding),
                              child:FloatingActionButton(
                                heroTag: "unique2",
                                onPressed: () {
                                  Toast.show("phone",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

                                },
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                backgroundColor: Colors.purple,
                              ),
                            ),**/
                          ],
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

/**
  void _uploaddata() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
        .then((signedInUser) {
      createRecord(signedInUser);
    }).catchError((e) {
      Toast.show(e,context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
     // print(e);
    });


  }

  void createRecord(FirebaseUser signedInUser) {
    userdatabaseReference.child(signedInUser.uid).set({
      'cId': signedInUser.uid,
      'cName': _nameController.text,
      'cEmail': _emailController.text,
      'cPhone': _phoneController.text,
      'cType': "مستخدم",
      'cCountry': _countrycurrentItemSelected,
      'ccity': _citycurrentItemSelected,
      'cquarter':_regioncurrentItemSelected,
      'VIP': false,
      'published': false,
    }).whenComplete(() {
      Toast.show("تم تسجيل الدخول بنجاح",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

    });

    setState(() {
      _load2 = false;
    });
    Navigator.of(context).pushReplacementNamed('/userhome');
  }
**/

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
  void _onDropDownItemSelectedtime(String newValueSelected) {
    setState(() {
      this._timecurrentItemSelected = newValueSelected;
    });
  }
  /**void _onDropDownItemSelectedCity(String newValueSelected) async{
    //_selectedCityNib.clear();
    setState(() {
      switch (newValueSelected) {

        case "الرياض":
          {
            _selectedCityNib = SelectedCityNib.curListRiyad;
            this._regioncurrentItemSelected = _selectedCityNib[0];
            this._citycurrentItemSelected = newValueSelected;
          }
          break;

//      case "مكه":
//        {
//          _selectedCityNib = SelectedCityNib.curListMaka;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "جده":
//        {
//          _selectedCityNib = SelectedCityNib.curListJaddah;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//      case "الدمام":
//        {
//          _selectedCityNib = SelectedCityNib.curListDammam;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "الخميس":
//        {
//          _selectedCityNib = SelectedCityNib.curListElkhamis;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "جازان":
//        {
//          _selectedCityNib = SelectedCityNib.curListGazan;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "الطائف":
//        {
//          _selectedCityNib = SelectedCityNib.curListEltaaf;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "المدينة المنورة":
//        {
//          _selectedCityNib = SelectedCityNib.curListElmadina;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "تبوك":
//        {
//          _selectedCityNib = SelectedCityNib.curListTabook;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "حائل":
//        {
//          _selectedCityNib = SelectedCityNib.curListHaael;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "الباحة":
//        {
//          _selectedCityNib = SelectedCityNib.curListElbaha;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "سكاكا":
//        {
//          _selectedCityNib = SelectedCityNib.curListSakaka;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "بريدة":
//        {
//          _selectedCityNib = SelectedCityNib.curListBarida;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "طريف":
//        {
//          _selectedCityNib = SelectedCityNib.curListTrif;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "نجران":
//        {
//          _selectedCityNib = SelectedCityNib.curListNagran;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "بيشة":
//        {
//          _selectedCityNib = SelectedCityNib.curListBisha;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "الجبيل":
//        {
//          _selectedCityNib = SelectedCityNib.curListEljabil;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "الظهران":
//        {
//          _selectedCityNib = SelectedCityNib.curListElzahran;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//
//      case "الخرج":
//        {
//          _selectedCityNib = SelectedCityNib.curListElkharg;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;
//
//      case "الخبر":
//        {
//          _selectedCityNib = SelectedCityNib.curListElkhabar;
//          this._regioncurrentItemSelected = _selectedCityNib[0];
//          this._citycurrentItemSelected = newValueSelected;
//        }
//        break;

        default:
          {
            _selectedCityNib = SelectedCityNib.curListRiyad;
            this._regioncurrentItemSelected = _selectedCityNib[0];
            this._citycurrentItemSelected = newValueSelected;
          }
          break;
      }
    });
  }**/
}