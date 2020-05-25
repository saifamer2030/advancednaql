import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:toast/toast.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _formKey = GlobalKey<FormState>();
  final double _minimumPadding = 5.0;


  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  var _initpassword = '';
  var _initpasswordconf = '';
  bool _load2 = false;
  final userdatabaseReference =
  FirebaseDatabase.instance.reference().child("userdata");
//  GoogleSignIn googleAuth = new GoogleSignIn();

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.subtitle;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
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
                  padding: EdgeInsets.only(top:_minimumPadding * 20,bottom: _minimumPadding * 2, right: _minimumPadding * 2,left: _minimumPadding * 2),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      //getImageAsset(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: Center(
                          child: Text(
                            "إنشاء حساب جديد",
                            style: TextStyle(
                                color: const Color(0xff41a0cb),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
                              controller: _nameController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'برجاء ادخال الإسم بالكامل';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'الاسم بالكامل',
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
                              controller: _emailController,
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
                                labelText: 'البريد الإلكترونى',
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
                              keyboardType: TextInputType.number,
                              style: textStyle,
                              //textDirection: TextDirection.rtl,
                              controller: _phoneController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'برجاء إدخال رقم الهاتف';
                                }
                                if (value.length < 10) {
                                  return ' رقم الهاتف غير صحيح';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'رقم الهاتف',
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
                              obscureText: true,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.text,
                              style: textStyle,
                              //textDirection: TextDirection.rtl,
                              controller: _passwordController,
                              validator: (String value) {
                                _initpassword = value;
                                if (value.isEmpty) {
                                  return 'برجاء إدخال كلمة السر';
                                }
                                if (value.length < 6) {
                                  return ' كلمة السر لا تقل عن 6';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'كلمة السر',
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
                              obscureText: true,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.text,
                              style: textStyle,
                              //textDirection: TextDirection.rtl,
                              controller: _confirmpasswordController,
                              validator: (String value) {
                                _initpasswordconf = value;
                                if (value.isEmpty) {
                                  return 'برجاء إدخال تأكيد لكلمة السر';
                                }
                                if (value.length < 6) {
                                  return ' كلمة السر لا تقل عن 6';
                                }
                                if (_initpasswordconf != _initpassword) {
                                  return 'لا تساوى كلمة المرور';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'تأكيد كلمة السر',
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
                        child: Center(
                          child: Text(
                            "بالضغط على زر التسجيل انت توافق على الشروط و الاأحكام",
                            style: TextStyle(
                                color: const Color(0xff000000),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),


                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Padding(
                              padding: EdgeInsets.all(_minimumPadding),

                              child: Container(
                                height: 50.0,
                                width: 150,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: const Color(0xffbdbdbd),
                                  color: const Color(0xffbdbdbd),
                                  elevation: 3.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed('/login');
                                    },
                                    child: Center(
                                      child: Text(
                                        'تخطى الدخول',
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
                            Padding(
                              padding: EdgeInsets.all(_minimumPadding),

                              child: Container(
                                height: 50.0,
                                width: 150,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: const Color(0xff41a0cb),
                                  color: const Color(0xff41a0cb),
                                  elevation: 3.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState.validate()) {

                                        //loginUserphone(_phoneController.text.trim(), context);
                                        _uploaddataemail();
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _minimumPadding,
                        width: _minimumPadding,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: Center(
                          child: FlatButton(
                            child: Text(
                              " ...تسجيل الدخول اذا كان لديك حساب مسبق",
                              style: TextStyle(
                                  color: const Color(0xff41a0cb),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/login');

                            },
                          ),
                        ),
                      ),
                      // ),

                    ],
                  )),
            ),
           // new Align(child: loadingIndicator,alignment: FractionalOffset.center,),

          ],
        ),
      ),
    );
  }
  Future<bool> loginUserphone(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: "+2$phone",
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);
          createRecord(result.user.uid);

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
                        createRecord(result.user.uid);
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

  void _uploaddataemail() {

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ).then((signedInUser) {
      //Toast.show("${signedInUser.user.uid}",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

      createRecord(signedInUser.user.uid);
    }).catchError((e) {
      Toast.show(e,context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
      // print(e);
    });


  }

  void createRecord( signedInUserid) {

    userdatabaseReference.child(signedInUserid).set({
      'cId': signedInUserid,
      'cName': _nameController.text,
      'cEmail': _emailController.text,
      'cPhone': _phoneController.text,
      'cType': "مستخدم",

      //'published': false,
    }).whenComplete(() {
      Toast.show("تم تسجيل الدخول بنجاح",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

    });

    setState(() {
      _load2 = false;
    });
    Navigator.of(context).pushReplacementNamed('/fragmentnaql');
  }


//  Widget _getImageAsset() {
//    AssetImage assetImage = AssetImage("assets/images/twitter-icon.png");
//    Image image = Image(
//      image: assetImage,
//      width: 50,
//      height: 50,
//    );
//
//    return Container(
//      child: image,
//
//    );
//  }
//  Future<FirebaseUser> _handleSignIn() async {
//    GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
//    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );
//    final FirebaseUser user = await FirebaseAuth.instance.signInWithCredential(credential);
//    print("signed in " + user.displayName);
//    return user;
//  }


}