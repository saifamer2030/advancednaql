import 'package:flutter/material.dart';
import 'helper_func.dart';
import 'app_localizations.dart';
import 'applic.dart';

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width:  MediaQuery.of(context).size.width,
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

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      // Translations.of(context).translate('select_language')
                        'Select Language أختار اللغة'
                    ),
                    SizedBox(height: 15.0,),
                    RaisedButton(
                      child: Text(Translations.of(context).translate('language_en')),
                      onPressed: (){
                        Navigator.pop(context);
                        applic.onLocaleChanged(new Locale('en', 'US'));
                        HelperFunc.updateDefLang('en', 'US');
                        HelperFunc.reopenMoreInfo(context);
                      },
                    ),
                    SizedBox(height: 15.0,),
                    RaisedButton(
                      child: Text(Translations.of(context).translate('language_ar')),
                      onPressed: (){
                        Navigator.pop(context);
                        HelperFunc.reopenMoreInfo(context);
                        applic.onLocaleChanged(new Locale('ar', 'EG'));
                        HelperFunc.updateDefLang('ar', 'EG');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        )

    );
  }
}


