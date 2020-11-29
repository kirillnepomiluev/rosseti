

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/ui/pages/FillingForm.dart';
import 'package:rosseti/ui/pages/TopicsPage.dart';
import 'package:rosseti/ui/pages/accauntPage.dart';
import 'package:rosseti/ui/pages/loginPage.dart';
import 'package:rosseti/ui/pages/mainWebPage.dart';
import 'package:rosseti/ui/pages/mySuggectionsPage.dart';
import 'package:rosseti/ui/pages/settingsPage.dart';
import 'package:rosseti/ui/pages/steps/step1Page.dart';
import 'package:rosseti/ui/pages/steps/step2Page.dart';
import 'package:rosseti/ui/pages/steps/step3Page.dart';
import 'package:rosseti/ui/pages/steps/step4Page.dart';
import 'package:rosseti/ui/pages/steps/step5Page.dart';
import 'package:rosseti/ui/pages/steps/step6Page.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        if (kIsWeb) {
           return MaterialPageRoute(builder: (_) => MainWebPage());
         }
           return MaterialPageRoute(builder: (_) => MainWebPage());
      case '/topics':
           return MaterialPageRoute(builder: (_) => Topics());
      case '/add':
           return MaterialPageRoute(builder: (_) => FillingForm());
      case '/topic':
        return MaterialPageRoute(builder: (_) => Topic());
      case '/setting':
        return MaterialPageRoute(builder: (_) => SettingPage());

      case '/my':
        return MaterialPageRoute(builder: (_) => MyMainWebPage());

       case '/login':
           return MaterialPageRoute(builder: (_) => LoginPage());

       case '/account':
           return MaterialPageRoute(builder: (_) => AccauntPage());

           case '/StepOne':
           return MaterialPageRoute(builder: (_) => StepOne());
           case '/StepTwo':
           return MaterialPageRoute(builder: (_) => StepTwo());
           case '/StepThree':
           return MaterialPageRoute(builder: (_) => StepThree());
           case '/StepFour':
           return MaterialPageRoute(builder: (_) => StepFour());
           case '/StepFive':
           return MaterialPageRoute(builder: (_) => StepFive());
           case '/StepSix':
           return MaterialPageRoute(builder: (_) => StepSix());





      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
