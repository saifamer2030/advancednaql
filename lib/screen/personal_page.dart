import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

class PersonalPage extends StatefulWidget {
  @override
  __PersonalPageState createState() => __PersonalPageState();
}

final mDatabase = FirebaseDatabase.instance.reference();

@override
class __PersonalPageState extends State<PersonalPage> {
  final double _minimumPadding = 5.0;
  TextEditingController phoneController;
  TextEditingController nameController;
  TextEditingController emailController;

  FirebaseAuth _firebaseAuth;
  String _cName = "";
  String _cEmail = "";
  String _cMobile = "";
  String _csex = "";

  String _userId;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _firebaseAuth = FirebaseAuth.instance;
    FirebaseAuth.instance.currentUser().then((user) => user == null
        ? null
        : setState(() {
            _userId = user.uid;
            final userdatabaseReference =FirebaseDatabase.instance.reference().child("userdata");
            userdatabaseReference
                .child(_userId)
                .child("cPhone")
                .once()
                .then((DataSnapshot snapshot5) {
              setState(() {
                if (snapshot5.value != null) {
                  setState(() {
                    _cMobile=snapshot5.value;
                  });
                }else{
                  setState(() {
                    _cMobile="رقم هاتف غير معلوم";
                  });
                }

              });
            });
            //////////////////////////
            userdatabaseReference
                .child(_userId)
                .child("cName")
                .once()
                .then((DataSnapshot snapshot5) {
              setState(() {
                if (snapshot5.value != null) {
                  setState(() {
                    _cName=snapshot5.value;
                  });
                }else{
                  setState(() {
                    _cName="اسم غير معلوم";
                  });
                }

              });
            });         //////////////////////////
            userdatabaseReference
                .child(_userId)
                .child("cEmail")
                .once()
                .then((DataSnapshot snapshot5) {
              setState(() {
                if (snapshot5.value != null) {
                  setState(() {
                    _cEmail=snapshot5.value;
                  });
                }else{
                  setState(() {
                    _cEmail="ايميل غير معلوم";
                  });
                }

              });
            });

      ////////////////////////
            userdatabaseReference
                .child(_userId)
                .child("cSex")
                .once()
                .then((DataSnapshot snapshot5) {
              setState(() {
                if (snapshot5.value != null) {
                  setState(() {
                    _csex=snapshot5.value;
                  });
                }else{
                  setState(() {
                    _csex="نوع غير معلوم";
                  });
                }

              });
            });

      ////////////////////////
    }));
    setState(() {
      nameController = TextEditingController(text: _cName);
     emailController = TextEditingController(text: _cEmail);
      phoneController = TextEditingController(text: _cMobile);

    });

    //getUser();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width:  MediaQuery.of(context).size.width,
                height: 86.0,
                child: InkWell(
                  onTap: () => Navigator.pop(context),

                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 50,
                    height: 50,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0,top:20),
                          child: Icon(Icons.arrow_back,color: Colors.white,),
                        )
                    ),
                  ),
                ),
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
            child: Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding * 23,
                  bottom: _minimumPadding * 2,
                  right: _minimumPadding * 2,
                  left: _minimumPadding * 2),
              child: ListView(
                physics: BouncingScrollPhysics(),

                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        matchTextDirection: true,
                        repeat: ImageRepeat.noRepeat,
                        image: AssetImage("assets/images/ic_person.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _cName != null ? _cName : "الاسم",style: TextStyle(
                                  color:  const Color(0xff1891C7),
                                ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(Icons.person,color:  const Color(0xff1891C7),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showAlertDialogname(context, _cName);
                                    });
                                  },
                                  child: Icon(Icons.mode_edit,color:  const Color(0xff1891C7),)),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _cEmail != null ? _cEmail : "الايميل",style: TextStyle(
                                  color:  const Color(0xff1891C7),
                                ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(Icons.email,color:  const Color(0xff1891C7),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showAlertDialogemail(context, _cEmail);
                                    });
                                  },
                                  child: Icon(Icons.mode_edit,color:  const Color(0xff1891C7),)),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _cMobile != null ? _cMobile : "رقم الجوال",style: TextStyle(
                                    color:  const Color(0xff1891C7),
                                  ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Icon(Icons.phone_iphone,color:  const Color(0xff1891C7),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        showAlertDialogphone(context, _cMobile);
                                      });
                                    },
                                    child: Icon(Icons.mode_edit,color:  const Color(0xff1891C7),)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _csex != null ? _csex : "النوع",style: TextStyle(
                                    color:  const Color(0xff1891C7),
                                  ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Icon(Icons.accessibility,color:  const Color(0xff1891C7),),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (context) => MyForm4(_csex, onSubmit4: onSubmit4));
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Icon(Icons.mode_edit,color:  const Color(0xff1891C7),),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
//                        Padding(
//                          padding: const EdgeInsets.all(5.0),
//                          child: Card(
//                            elevation: 0.0,
//                            color: Colors.white,
//                            shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(5),
//                            ),
//                            child: Directionality(
//                              textDirection: TextDirection.rtl,
//                              child: TextFormField(
//                                keyboardType: TextInputType.multiline,
//                                textInputAction: TextInputAction.newline,
//                                maxLines: null,
//                                controller: null,
//                                textDirection: TextDirection.rtl,
//                                maxLength: 100,
//                                onChanged: (value) {},
//                                //  controller: controller,
//                                validator: (String value) {
//                                  if ((value.isEmpty)) {
//                                    return "برجاء إضافة وصف";
//                                  }
//                                },
//                                decoration: InputDecoration(
//                                    labelText: "اضف وصف",
//                                    hintText: "اضف وصف",
//                                    errorStyle: TextStyle(
//                                        color: Colors.red,
//                                        fontSize: 15.0),
//                                    hintStyle: TextStyle(fontSize: 10.0),
//                                    labelStyle: TextStyle(fontSize: 10.0),
//                                    contentPadding: new EdgeInsets.symmetric(
//                                        vertical: 100.0),
//                                    border: OutlineInputBorder(
//                                        borderRadius: BorderRadius.all(
//                                            Radius.circular(5.0)))),
//                              ),
//                            ),
//                          ),
//                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  showAlertDialogname(BuildContext context, name) {
    nameController = TextEditingController(text: name);

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("إلغاء",style: TextStyle(color: Colors.black),),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("حفظ",style: TextStyle(color: Colors.black),),
      onPressed:  () {
        setState(() {
          if (_formKey.currentState.validate()) {
            final userdatabaseReference =
            FirebaseDatabase.instance.reference().child("userdata");
            userdatabaseReference.child(_userId).update({
              "cName":nameController.text,
            }).then((_) {
              setState(() {
                _cName=  nameController.text;
                Navigator.of(context).pop();
              });

            });
          }

        });

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("تأكيد"),
      content:
      Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.only(
                top: _minimumPadding, bottom: _minimumPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                textAlign: TextAlign.right,
                keyboardType:TextInputType.text,
                //style: textStyle,
                //textDirection: TextDirection.rtl,
                controller: nameController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'برجاء إدخال الاسم';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'الاسم',
                  //hintText: '$name',
                  //labelStyle: textStyle,
                  errorStyle:
                  TextStyle(color: Colors.red, fontSize: 15.0),
                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                ),
              ),
            )),
      ),

      actions: [
        cancelButton,
        continueButton,
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


  showAlertDialogemail(BuildContext context, mail) {
    emailController = TextEditingController(text: mail);

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("إلغاء",style: TextStyle(color: Colors.black),),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("حفظ",style: TextStyle(color: Colors.black),),
      onPressed:  () {
        setState(() {
          if (_formKey.currentState.validate()) {
            final userdatabaseReference =
            FirebaseDatabase.instance.reference().child("userdata");
            userdatabaseReference.child(_userId).update({
              "cEmail":emailController.text,
            }).then((_) {
              setState(() {
                _cEmail=  emailController.text;
                Navigator.of(context).pop();
              });

            });
          }

        });

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("تأكيد"),
      content:
      Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.only(
                top: _minimumPadding, bottom: _minimumPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                textAlign: TextAlign.right,
                keyboardType:TextInputType.text,
                //style: textStyle,
                //textDirection: TextDirection.rtl,
                controller: emailController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'برجاء إدخال الاسم';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'الاسم',
                  //hintText: '$name',
                  //labelStyle: textStyle,
                  errorStyle:
                  TextStyle(color: Colors.red, fontSize: 15.0),
                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                ),
              ),
            )),
      ),

      actions: [
        cancelButton,
        continueButton,
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




  showAlertDialogphone(BuildContext context, phone) {
    phoneController = TextEditingController(text: phone);

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("إلغاء",style: TextStyle(color: Colors.black),),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("حفظ",style: TextStyle(color: Colors.black),),
      onPressed:  () {
        setState(() {
          if (_formKey.currentState.validate()) {
            final userdatabaseReference =
            FirebaseDatabase.instance.reference().child("userdata");
            userdatabaseReference.child(_userId).update({
              "cPhone":phoneController.text,
            }).then((_) {
              setState(() {
                _cMobile=  phoneController.text;
                Navigator.of(context).pop();
              });

            });
          }

        });

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("تأكيد"),
      content:
      Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.only(
                top: _minimumPadding, bottom: _minimumPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                textAlign: TextAlign.right,
                keyboardType:TextInputType.number,
                //style: textStyle,
                //textDirection: TextDirection.rtl,
                controller: phoneController,
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
                  //hintText: '$name',
                  //labelStyle: textStyle,
                  errorStyle:
                  TextStyle(color: Colors.red, fontSize: 15.0),
                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                ),
              ),
            )),
      ),

      actions: [
        cancelButton,
        continueButton,
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

  void onSubmit4(String result) {
//    print(result);
//    Toast.show("${result}", context,
//        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    setState(() {
      final userdatabaseReference =
      FirebaseDatabase.instance.reference().child("userdata");
      userdatabaseReference.child(_userId).update({
        "cSex":result,
      }).then((_) {
        setState(() {
          _csex=  result;
       //   Navigator.of(context).pop();
        });

      });
    });
  }
}
///////////////////////////////////

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

  final _buttonOptions = [
    'ذكر',
    'انثي',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentValue = widget.quarter11;
  }

  @override
  Widget build(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("إلغاء",style: TextStyle(color: Colors.black),),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );
    Widget continueButton = FlatButton(
      child: Text("حفظ",style: TextStyle(color: Colors.black),),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
          widget.onSubmit4(_currentValue.toString());
        });
      },
    );
    return AlertDialog(
      title: Text(
        "النوع",
        style: TextStyle(fontWeight: FontWeight.bold),
        textDirection: TextDirection.rtl,
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buttonOptions
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
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}
