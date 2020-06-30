import 'package:advancednaql/translation/app_localizations.dart';
import 'package:flutter/material.dart';

import 'newoffer.dart';
import 'neworder.dart';

class Department extends StatefulWidget {
  String user;
  Department(this.user);

  @override
  _DepartmentState createState() => _DepartmentState();
}
class _DepartmentState extends State<Department> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
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
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                     if(widget.user == "user"){
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => newOrder('نقل متوسط',1)),
                       );
                     }else{
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => NewOffer('نقل متوسط',1)),
                       );
                     }
                      },
                      child: Container(
                        width: 155.2,
                        height: 162.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xfff7f7f7),
                          border: Border.all(
                              width: 1.0, color: const Color(0xffdddddd)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                width: 50.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage(
                                        'assets/images/ic_average_transfer.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Text(
                                Translations.of(context).translate('average_transfer'),
                                style: TextStyle(
                                  fontFamily: 'DroidArabicKufi',
                                  fontSize: 18,
                                  color: const Color(0xff41a0cb),
                                  height: 1.2222222222222223,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: SizedBox(
                                width: 33.0,
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'DroidArabicKufi',
                                      fontSize: 10,
                                      color: const Color(0xff606060),
                                      height: 1.1578947368421053,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: Translations.of(context).translate('1_7_tons'),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(widget.user == "user"){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => newOrder('نقل خفيف',0)),
                          );
                        }else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewOffer('نقل خفيف',0)),
                          );
                        }
                      },
                      child: Container(
                        width: 155.2,
                        height: 162.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xfff7f7f7),
                          border: Border.all(
                              width: 1.0, color: const Color(0xffdddddd)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                width: 50.0,
                                height: 21.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage(
                                        'assets/images/ic_light_transmission.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: SizedBox(
                                width: 74.0,
                                child: Text(
                                  Translations.of(context).translate('light_transmission'),
                                  style: TextStyle(
                                    fontFamily: 'DroidArabicKufi',
                                    fontSize: 18,
                                    color: const Color(0xff41a0cb),
                                    height: 1.2222222222222223,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: SizedBox(
                                width: 33.0,
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'DroidArabicKufi',
                                      fontSize: 10,
                                      color: const Color(0xff606060),
                                      height: 1.1578947368421053,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: Translations.of(context).translate('1_ton'),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if(widget.user == "user"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => newOrder('معدات ثقيلة',3)),
                            );
                          }else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewOffer('معدات ثقيلة',3)),
                            );
                          }
                        },
                        child: Container(
                          width: 155.2,
                          height: 162.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xfff7f7f7),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffdddddd)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  width: 50.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(
                                          'assets/images/ic_agricultural_equipment.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Text(
                                  Translations.of(context).translate('heavy_equipment'),
                                  style: TextStyle(
                                    fontFamily: 'DroidArabicKufi',
                                    fontSize: 18,
                                    color: const Color(0xff41a0cb),
                                    height: 1.2222222222222223,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if(widget.user == "user"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => newOrder('نقل ثقيل',2)),
                            );
                          }else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewOffer('نقل ثقيل',2)),
                            );
                          }
                        },
                        child: Container(
                          width: 155.2,
                          height: 162.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xfff7f7f7),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffdddddd)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  width: 50.0,
                                  height: 21.5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(
                                          'assets/images/ic_heavy_transport.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: SizedBox(
                                  width: 74.0,
                                  child: Text(
                                    Translations.of(context).translate('heavy_transport'),
                                    style: TextStyle(
                                      fontFamily: 'DroidArabicKufi',
                                      fontSize: 18,
                                      color: const Color(0xff41a0cb),
                                      height: 1.2222222222222223,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'DroidArabicKufi',
                                      fontSize: 10,
                                      color: const Color(0xff606060),
                                      height: 1.1578947368421053,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: Translations.of(context).translate('7_tons_and_more'),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if(widget.user == "user"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => newOrder('نقل ركاب',5)),
                            );
                          }else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewOffer('نقل ركاب',5)),
                            );
                          }
                        },
                        child: Container(
                          width: 155.2,
                          height: 162.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xfff7f7f7),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffdddddd)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  width: 50.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(
                                          'assets/images/ic_passenger_transport.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Text(
                                  Translations.of(context).translate('passenger_transport'),
                                  style: TextStyle(
                                    fontFamily: 'DroidArabicKufi',
                                    fontSize: 18,
                                    color: const Color(0xff41a0cb),
                                    height: 1.2222222222222223,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if(widget.user == "user"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => newOrder('معدات زراعية',4)),
                            );
                          }else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewOffer('معدات زراعية',4)),
                            );
                          }
                        },
                        child: Container(
                          width: 155.2,
                          height: 162.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xfff7f7f7),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffdddddd)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  width: 50.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(
                                          'assets/images/ic_heavy_Equipment.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Text(
                                  Translations.of(context).translate('agricultural_equipment'),
                                  style: TextStyle(
                                    fontFamily: 'DroidArabicKufi',
                                    fontSize: 18,
                                    color: const Color(0xff41a0cb),
                                    height: 1.2222222222222223,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      if(widget.user == "user"){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newOrder('أخرى',6)),
                        );
                      }else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewOffer('أخرى',6)),
                        );
                      }
                    },
                    child: Container(
                      height: 65.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xfff7f7f7),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffdddddd)),
                      ),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'DroidArabicKufi',
                              fontSize: 16,
                              color: const Color(0xff41a0cb),
                              height: 1.1875,
                            ),
                            children: [
                              TextSpan(
                                text: Translations.of(context).translate('other'),
                              ),
                              TextSpan(
                                text: '...',
                                style: TextStyle(
                                  fontFamily: 'MyriadArabic-Regular',
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
