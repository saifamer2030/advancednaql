import 'dart:io';

import 'package:advancednaql/translation/app_localizations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';

class LoginScreen2  extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {

  var connectivityResult =  (Connectivity().checkConnectivity());
  bool _authtype = false;

  bool _load = false;
  var _formKey1 = GlobalKey<FormState>();

  final double _minimumPadding = 5.0;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

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
      body: Container(
        child: Stack(
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



            Form(
              key: _formKey1,
              child: Padding(
                  padding: EdgeInsets.only(top:_minimumPadding * 20,bottom: _minimumPadding * 2, right: _minimumPadding * 2,left: _minimumPadding * 2),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      //getImageAsset(),
                      Padding(
                        padding: EdgeInsets.only(bottom: _minimumPadding),
                        child: Text(
                          " تسجيل الدخول",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: _minimumPadding, bottom: _minimumPadding),
                          child: Container(
                            width: 250,
                            child: Material(
                                elevation: 5.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Theme.of(context).accentColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0)),
                                      ),
                                      width: 250,
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.text,
                                          style: textStyle,
                                          textDirection: TextDirection.rtl,
                                          controller: _emailController,
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return 'برجاء إدخال البريد الإلكترونى';
                                            }

                                            Pattern pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                            Pattern pattern1 =r'^(?:[+0]10)?[0-9]{11}$';//10,11 for 11 no
                                                                //(?:[+0]n)?[0-9]{n+1}$'
                                            RegExp regex = new RegExp(pattern);
                                            RegExp regex1 = new RegExp(pattern1);
                                            if ((regex.hasMatch(value))|| (regex1.hasMatch(value))) {
                                              if (regex.hasMatch(value)) {
                                                setState(() {
                                                  _authtype=false;
                                                });

                                              }else if (regex1.hasMatch(value)) {
                                                setState(() {
                                                  _authtype=true;
                                                });
                                              }
                                            }else{
                                              return Translations.of(context).translate('email_phone_error');

                                            }
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: Translations.of(context).translate('email_phone'),
                                            fillColor: Colors.white,
                                            filled: true,
                                            errorStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              top: _minimumPadding, bottom: _minimumPadding),
                          child: Container(
                            width: 250,
                            child: Material(
                                elevation: 5.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Theme.of(context).accentColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0)),
                                      ),
                                      width: 250,
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: TextFormField(
                                          // textAlign: TextAlign.right,
                                          obscureText: true,
                                          keyboardType: TextInputType.text,
                                          style: textStyle,
                                          textDirection: TextDirection.ltr,
                                          controller: _passwordController,
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return 'برجاء إدخال كلمة السر';
                                            }
                                            if (value.length < 6) {
                                              return ' كلمة السر لا تقل عن 6';
                                            }
                                          },

                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'كلمة السر',
                                            fillColor: Colors.white,
                                            filled: true,
                                            errorStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              top: _minimumPadding, bottom: _minimumPadding),
                          child: FlatButton(
                            onPressed: () {
                              ResetPasswordDialog();
                              //FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);
                            },
                            child: Text(
                              "هل نسيت كلمة السر؟",
                              textDirection: TextDirection.ltr,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: Container(
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(50),
//                              border: Border.all(color: Colors.black, width: 4)),
                          height: 50.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: const Color(0xffF4E41E),
                            color: Theme.of(context).accentColor,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () async {
                                if (_formKey1.currentState.validate()) {
                                  try {
                                    final result = await InternetAddress.lookup('google.com');
                                    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                    //  print('connected');
                                      if(_authtype){signinphone();}else{_uploaddata();}

                                      //signinphone();
                                      setState(() {
                                        _load = true;
                                      });
                                    }
                                  } on SocketException catch (_) {
                                  //  print('not connected');
                  Toast.show("برجاء مراجعة الاتصال بالشبكة",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

                                  }

                                }
                              },
                              child: Center(
                                child: Text(
                                  'تسجيل الدخول',
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
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: Text(
                                "ــــــــــــــــــــ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: Text(
                                "أو",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: Text(
                                "ــــــــــــــــــــ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/signup');
                                },
                                child: Text(
                                  "حساب جديد",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                top: _minimumPadding, bottom: _minimumPadding),
                            child: Text(
                              "ليس لديك حساب؟",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            new Align(
              child: loadingIndicator,
              alignment: FractionalOffset.center,
            ),

          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("assets/images/logo_circle.png");
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 5),
    );
  }

  void signinphone(){
    List<String> phonenoList = [];
    final userdatabaseReference =
    FirebaseDatabase.instance.reference().child("userdata");
    userdatabaseReference.once().then((DataSnapshot snapshot) {
      var KEYS = snapshot.value.keys;
      var DATA = snapshot.value;

      phonenoList.clear();
      for (var individualkey in KEYS) {
        phonenoList.add(DATA[individualkey]["cPhone"]);
    }
    if(phonenoList.contains(_emailController.text)){
    loginUserphone(_emailController.text.trim(), context);

    }else{
      Toast.show("تم التسجيل من قبل",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

    }
        });

  }
  Future<bool> loginUserphone(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: "+2$phone",
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);
          //createRecord(result.user.uid);

          //FirebaseUser user = result.user;
          Navigator.of(context).pushReplacementNamed('/fragmentnaql');

//          if(user != null){
//            Navigator.push(context, MaterialPageRoute(
//                builder: (context) => HomeScreen(user: user,)
//            ));
//          }else{
//            print("Error");
//          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async{
                        final code = _codeController.text.trim();
                        AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);

                        AuthResult result = await _auth.signInWithCredential(credential);

                        //FirebaseUser user = result.user;
                      //  createRecord(result.user.uid);
                        Navigator.of(context).pushReplacementNamed('/fragmentnaql');

//                        if(user != null){
//                          Navigator.push(context, MaterialPageRoute(
//                              builder: (context) => HomeScreen(user: user,)
//                          ));
//                        }else{
//                          print("Error");
//                        }
                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }

  void _uploaddata() {
//    print("a");
//    Toast.show("a",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((signedInUser) {

      Navigator.of(context).pushReplacementNamed('/fragmentnaql');
      setState(() {
        _load = false;
      });
    }).catchError((e) {
          Toast.show(e,context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
          setState(() {
            _load = false;
          });
        });
    // print(_emailController.text+"////");
  }

////////////**********ResetPassword**************************
  ResetPasswordDialog() {
    var _resetKey1 = GlobalKey<FormState>();
    TextEditingController _textFieldController = TextEditingController();
    var alertDialog = AlertDialog(
      title: Text('تغير كلمة السر'),
      content: Form(
        key: _resetKey1,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          //style: textStyle,textDirection: TextDirection.ltr,
          controller: _textFieldController,
          //decoration: InputDecoration(hintText: "البريد الإلكترونى"),
          validator: (String value) {
            if (value.isEmpty) {
              return 'برجاء إدخال البريد الإلكترونى';
            }
            Pattern pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(value)) {
              return 'بريد إلكترونى غير صحيح';
            }
          },

          decoration: InputDecoration(
            hintText: 'البريد الإالكترونى',
            fillColor: Colors.white,
            filled: true,
            errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
          ),
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('إلغاء'),
        ),
        new FlatButton(
          onPressed: () async {
            if (_resetKey1.currentState.validate()) {
              try {
                final result = await InternetAddress.lookup('google.com');
                if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _textFieldController.text);
                  //Form.of(context).save();
                  Navigator.pop(context);
                  Toast.show("برجاء مراجعة بريدك الإلكترونى", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                }
              } on SocketException catch (_) {
                //  print('not connected');
                Toast.show(Translations.of(context).translate('please_see_network_connection'),context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

              }

            }
          },
          child: new Text('تأكيد'),
        ),
      ],
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
