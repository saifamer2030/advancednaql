import 'package:flutter/material.dart';
import 'helper_func.dart';
import 'app_localizations.dart';
import 'applic.dart';

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                  applic.onLocaleChanged(new Locale('en', 'US'));
                  HelperFunc.updateDefLang('en', 'US');
                  HelperFunc.reopenMoreInfo(context);
                },
              ),
              SizedBox(height: 15.0,),
              RaisedButton(
                child: Text(Translations.of(context).translate('language_ar')),
                onPressed: (){
                  applic.onLocaleChanged(new Locale('ar', 'EG'));
                  HelperFunc.updateDefLang('ar', 'EG');
                  HelperFunc.reopenMoreInfo(context);
                },
              ),
            ],
          ),
        )

    );
  }
}


