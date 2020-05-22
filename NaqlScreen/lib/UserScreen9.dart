import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import './StatusBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './Screen23.dart';
import './Screen22.dart';
import './Screen21.dart';
import './UserScreen15.dart';
import './Screen11.dart';
import './UserScreen10.dart';

class UserScreen9 extends StatelessWidget {
  UserScreen9({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 115.0),
            child:
                // Adobe XD layer: '22' (shape)
                Container(
              width: 414.0,
              height: 790.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
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
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xff4fc3f7),
              ),
            ),
          ),
          // Adobe XD layer: 'TopBar' (shape)
          Container(
            width: 414.0,
            height: 86.0,
            decoration: BoxDecoration(
              color: const Color(0xff4fc3f7),
            ),
          ),
          // Adobe XD layer: 'Status Bar' (component)
          StatusBar(),
          Transform.translate(
            offset: Offset(3.85, 807.83),
            child:
                // Adobe XD layer: 'BottomBar' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-3.85, -13.83),
                  child:
                      // Adobe XD layer: 'BottomBar-BG' (shape)
                      Container(
                    width: 414.0,
                    height: 102.0,
                    decoration: BoxDecoration(
                      color: const Color(0xffeaeaea),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(17.15, 45.5),
                  child: SizedBox(
                    width: 36.0,
                    child: Text(
                      'المزيد',
                      style: TextStyle(
                        fontFamily: 'GESSTwoMedium-Medium',
                        fontSize: 12,
                        color: const Color(0xff727272),
                        height: 1.1666666666666667,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(18.15, 20.68),
                  child:
                      // Adobe XD layer: 'Icon-more' (group)
                      SvgPicture.string(
                    _shapeSVG_531f57342d144bb784440c84b4d336f9,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Transform.translate(
                  offset: Offset(1.15, 0.17),
                  child:
                      // Adobe XD layer: 'More-act' (shape)
                      Container(
                    width: 64.0,
                    height: 75.0,
                    decoration: BoxDecoration(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(88.15, 45.5),
                  child: SizedBox(
                    width: 51.0,
                    child: Text(
                      'التنبيهات',
                      style: TextStyle(
                        fontFamily: 'GESSTwoMedium-Medium',
                        fontSize: 12,
                        color: const Color(0xff727272),
                        height: 1.1666666666666667,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(93.25, 9.17),
                  child:
                      // Adobe XD layer: 'Notification-icon' (component)
                      Container(),
                ),
                Transform.translate(
                  offset: Offset(75.15, 0.17),
                  child:
                      // Adobe XD layer: 'Notifs-act' (shape)
                      Container(
                    width: 64.0,
                    height: 75.0,
                    decoration: BoxDecoration(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(175.15, 45.5),
                  child: SizedBox(
                    width: 50.0,
                    child: Text(
                      'المفضلة',
                      style: TextStyle(
                        fontFamily: 'GESSTwoMedium-Medium',
                        fontSize: 12,
                        color: const Color(0xff727272),
                        height: 1.1666666666666667,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(188.25, 13.41),
                  child:
                      // Adobe XD layer: 'Icon material-favor…' (shape)
                      SvgPicture.string(
                    _shapeSVG_0e3cb0952d0d421dae653f4c4d5867ba,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Transform.translate(
                  offset: Offset(171.15, 0.17),
                  child:
                      // Adobe XD layer: 'Me-act' (shape)
                      Container(
                    width: 64.0,
                    height: 75.0,
                    decoration: BoxDecoration(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(263.15, 45.5),
                  child: SizedBox(
                    width: 44.0,
                    child: Text(
                      'طلباتي ',
                      style: TextStyle(
                        fontFamily: 'GESSTwoMedium-Medium',
                        fontSize: 12,
                        color: const Color(0xff41a0cb),
                        height: 1.1666666666666667,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(264.15, 11.17),
                  child:
                      // Adobe XD layer: 'Truck-icon' (component)
                      Container(),
                ),
                Transform.translate(
                  offset: Offset(262.15, 0.17),
                  child:
                      // Adobe XD layer: 'orders-act' (shape)
                      Container(
                    width: 64.0,
                    height: 75.0,
                    decoration: BoxDecoration(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(346.15, 47.5),
                  child: SizedBox(
                    width: 45.0,
                    child: Text(
                      'الرئيسية',
                      style: TextStyle(
                        fontFamily: 'GESSTwoMedium-Medium',
                        fontSize: 12,
                        color: const Color(0xff727272),
                        height: 1.1666666666666667,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(349.76, 9.17),
                  child:
                      // Adobe XD layer: 'Iconl-home' (shape)
                      SvgPicture.string(
                    _shapeSVG_204388421a3b40729977ba82ce0a994c,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Transform.translate(
                  offset: Offset(341.15, 0.17),
                  child:
                      // Adobe XD layer: 'Me-act' (shape)
                      Container(
                    width: 64.0,
                    height: 75.0,
                    decoration: BoxDecoration(),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 106.0),
            child: Container(
              width: 168.0,
              height: 50.0,
              decoration: BoxDecoration(),
            ),
          ),
          Transform.translate(
            offset: Offset(251.0, 108.0),
            child:
                // Adobe XD layer: 'clode-deal' (shape)
                Container(
              width: 163.0,
              height: 57.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(152.0, 41.42),
            child:
                // Adobe XD layer: 'logo' (component)
                Container(),
          ),
        ],
      ),
    );
  }
}

const String _shapeSVG_531f57342d144bb784440c84b4d336f9 =
    '<svg viewBox="18.1 20.7 40.7 10.0" ><g transform="translate(9.65, 5.35)"><path transform="translate(8.53, 0.0)" d="M 20.29527473449707 15.32812690734863 C 17.54250144958496 15.32812690734863 15.31406402587891 17.55656623840332 15.31406402587891 20.30934143066406 C 15.31406402587891 23.06211280822754 17.54250144958496 25.29055213928223 20.29527473449707 25.29055213928223 C 23.04805374145508 25.29055213928223 25.27648735046387 23.06211280822754 25.27648735046387 20.30934143066406 C 25.27648735046387 17.55656623840332 23.04805374145508 15.32812690734863 20.29527473449707 15.32812690734863 L 20.29527473449707 15.32812690734863 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(4.0, 0.0)" d="M 9.48121166229248 15.32812690734863 C 6.728436946868896 15.32812690734863 4.500000953674316 17.55656623840332 4.500000953674316 20.30934143066406 C 4.500000953674316 23.06211280822754 6.728436946868896 25.29055213928223 9.48121166229248 25.29055213928223 C 12.23398590087891 25.29055213928223 14.46242332458496 23.06211280822754 14.46242332458496 20.30934143066406 C 14.46242332458496 17.55656623840332 12.23398590087891 15.32812690734863 9.48121166229248 15.32812690734863 L 9.48121166229248 15.32812690734863 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(13.09, 0.0)" d="M 31.1374626159668 15.32812690734863 C 28.38468933105469 15.32812690734863 26.15625 17.55656623840332 26.15625 20.30934143066406 C 26.15625 23.06211280822754 28.38468933105469 25.29055213928223 31.1374626159668 25.29055213928223 C 33.89023971557617 25.29055213928223 36.11867523193359 23.06211280822754 36.11867523193359 20.30934143066406 C 36.11867523193359 17.55656623840332 33.89023971557617 15.32812690734863 31.1374626159668 15.32812690734863 L 31.1374626159668 15.32812690734863 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';
const String _shapeSVG_0e3cb0952d0d421dae653f4c4d5867ba =
    '<svg viewBox="188.2 13.4 30.0 27.5" ><path transform="translate(185.25, 8.91)" d="M 18 32.02500152587891 L 15.82499980926514 30.04500198364258 C 8.100000381469727 23.04000091552734 3 18.42000007629395 3 12.75 C 3 8.130000114440918 6.630000114440918 4.5 11.25 4.5 C 13.85999965667725 4.5 16.36499977111816 5.715000152587891 18 7.635000228881836 C 19.63500022888184 5.715000152587891 22.13999938964844 4.5 24.75 4.5 C 29.3700008392334 4.5 33 8.130000114440918 33 12.75 C 33 18.42000007629395 27.89999961853027 23.04000091552734 20.17499923706055 30.05999946594238 L 18 32.02500152587891 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _shapeSVG_204388421a3b40729977ba82ce0a994c =
    '<svg viewBox="349.8 9.2 39.7 33.7" ><path transform="translate(346.76, 4.67)" d="M 18.88235092163086 38.24999618530273 L 18.88235092163086 26.33823585510254 L 26.82352828979492 26.33823585510254 L 26.82352828979492 38.24999618530273 L 36.75 38.24999618530273 L 36.75 22.36764526367188 L 42.70588302612305 22.36764526367188 L 22.85293960571289 4.499999523162842 L 3 22.36764526367188 L 8.955881118774414 22.36764526367188 L 8.955881118774414 38.24999618530273 L 18.88235092163086 38.24999618530273 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
