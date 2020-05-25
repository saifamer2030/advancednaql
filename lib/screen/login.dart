import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

class LoginScreen2  extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final userdatabaseReference =
      FirebaseDatabase.instance.reference().child("coiffuredata");

  bool _load = false;
  var _formKey1 = GlobalKey<FormState>();

  final double _minimumPadding = 5.0;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: 414.0,
              height: 86.0,
              decoration: BoxDecoration(
                color: const Color(0xff4fc3f7),
              ),
            ),
            Transform.translate(
              offset: Offset(0.0, -250.0),
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


            Form(
              key: _formKey1,
              child: Padding(
                  padding: EdgeInsets.only(top:_minimumPadding * 0,bottom: _minimumPadding * 2, right: _minimumPadding * 2,left: _minimumPadding * 2),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      getImageAsset(),
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
                                      width: 300,
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: textStyle,
                                          textDirection: TextDirection.ltr,
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
                                            border: InputBorder.none,
                                            hintText: 'البريد الإالكترونى',
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
                                      width: 300,
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
                              onTap: () {
                                if (_formKey1.currentState.validate()) {
                                  _uploaddata();
                                  setState(() {
                                    _load = true;
                                  });
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
//            new Align(
//              child: loadingIndicator,
//              alignment: FractionalOffset.center,
//            ),
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

  void _uploaddata() {
//    print("a");
//    Toast.show("a",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((signedInUser) {

      Navigator.of(context).pushReplacementNamed('/fragmentnaql');

    }).catchError((e) {
          Toast.show(e,context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
          // print(e);
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
          onPressed: () {
            if (_resetKey1.currentState.validate()) {
              FirebaseAuth.instance
                  .sendPasswordResetEmail(email: _textFieldController.text);
              //Form.of(context).save();
              Navigator.pop(context);
              Toast.show("برجاء مراجعة بريدك الإلكترونى", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
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
