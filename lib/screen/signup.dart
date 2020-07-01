import 'dart:io';

import 'package:advancednaql/translation/app_localizations.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  bool _load = false;
  final userdatabaseReference =
  FirebaseDatabase.instance.reference().child("userdata");

  @override
  void initState() {
    super.initState();

  }
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
                            Translations.of(context).translate('create_new_account'),
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
                                  return Translations.of(context).translate('please_enter_the_full_name');
                                }
                              },
                              decoration: InputDecoration(
                                labelText: Translations.of(context).translate('full_name'),
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
                                  return Translations.of(context).translate('please_enter_your_email');
                                }
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value)) {
                                  return Translations.of(context).translate('invalid_email');
                                }
                              },
                              decoration: InputDecoration(
                                labelText: Translations.of(context).translate('email'),
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
                                  return Translations.of(context).translate('please_enter_the_phone_number');
                                }
                                if (value.length < 10) {
                                  return Translations.of(context).translate('phone_number_is_incorrect');
                                }
                              },
                              decoration: InputDecoration(
                                labelText: Translations.of(context).translate('telephone_number'),
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
                                  return Translations.of(context).translate('please_enter_the_password');
                                }
                                if (value.length < 6) {
                                  return Translations.of(context).translate('the_password_is_not_less_than');
                                }
                              },
                              decoration: InputDecoration(
                                labelText: Translations.of(context).translate('password'),
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
                                  return Translations.of(context).translate('please_enter_a_password_confirmation');
                                }
                                if (value.length < 6) {
                                  return Translations.of(context).translate('the_password_is_not_less_than');
                                }
                                if (_initpasswordconf != _initpassword) {
                                  return Translations.of(context).translate('password_is_not_equal');
                                }
                              },
                              decoration: InputDecoration(
                                labelText: Translations.of(context).translate('password_is_not_equal'),
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
                            Translations.of(context).translate('by_clicking_on_the_register_button_you_agree_to_the_terms_and_conditions'),
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
                                  shadowColor: const Color(0xff41a0cb),
                                  color: const Color(0xff41a0cb),
                                  elevation: 3.0,
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (_formKey.currentState.validate()) {
                                        try {
                                          final result = await InternetAddress.lookup('google.com');
                                          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                            //  print('connected');
                                            _uploaddataemail();
                                            setState(() {
                                              _load = true;
                                            });
                                          }
                                        } on SocketException catch (_) {
                                          //  print('not connected');
                                          Toast.show(Translations.of(context).translate('please_see_network_connection'),context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

                                        }
                                        //loginUserphone(_phoneController.text.trim(), context);

                                      } else
                                        print('correct');
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: <Widget>[
                                        Text(
                                          Translations.of(context).translate('sign_up'),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat'),
                                        ),
                                        Icon(
                                          Icons.email,
                                          color: Colors.white,
                                        ),
                                      ],
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
                                    onTap: () async {
                                      if (_formKey.currentState.validate()) {
                                        try {
                                          final result = await InternetAddress.lookup('google.com');
                                          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                            //  print('connected');
                                            loginUserphone(_phoneController.text.trim(), context);
                                            setState(() {
                                              _load = true;
                                            });
                                          }
                                        } on SocketException catch (_) {
                                          //  print('not connected');
                                          Toast.show(Translations.of(context).translate('please_see_network_connection'),context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

                                        }

                                      } else
                                        print('correct');
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: <Widget>[
                                        Text(
                                          Translations.of(context).translate('sign_up'),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat'),
                                        ),
                                        Icon(
                                          Icons.phone_android,
                                          color: Colors.white,
                                        ),
                                      ],
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
                                Navigator.of(context).pushNamed('/fragmentnaql');
                              },
                              child: Center(
                                child: Text(
                                  Translations.of(context).translate('skip_entry'),
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
                              Translations.of(context).translate('log_in_if_you_already_have_an_account'),
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
            new Align(
              child: loadingIndicator,
              alignment: FractionalOffset.center,
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
         // Navigator.of(context).pushReplacementNamed('/fragmentnaql');

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
      setState(() {
        _load = false;
      });
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
      Toast.show(Translations.of(context).translate('sign_in_successful'),context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

    });

    setState(() {
      _load = false;
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