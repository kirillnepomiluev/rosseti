

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/ui/pages/FillingForm.dart';
import 'package:rosseti/ui/pages/TopicsPage.dart';
import 'package:rosseti/ui/pages/loginPage.dart';
import 'package:rosseti/ui/pages/mainWebPage.dart';


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

      case '/my':
        return MaterialPageRoute(builder: (_) => Topic());

       case '/login':
           return MaterialPageRoute(builder: (_) => LoginPage());





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
