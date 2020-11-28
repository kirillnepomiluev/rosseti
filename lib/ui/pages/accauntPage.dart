

import 'package:flutter/material.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/ui/widgets/RaisedGradientButton.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class AccauntPage extends StatefulWidget {
  @override
  _AccauntPageState createState() => _AccauntPageState();
}

class _AccauntPageState extends State<AccauntPage> {
  bool isAdmin = false;
  @override
  void initState() {
    if(curUser != null &&curUser.isNotEmpty) {
      isAdmin = curUser["role"] == "admin";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildMyScaffold(context, Center(
      child: Container(
        height: 210,
        child:
        Column ( mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center( child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text( "Текущий аккаунт: ${curUser["name"]}"),
            ),),

            myGradientButton(context, btnText: "Выйти",
                width: 280 ,
                funk: () {
                  prefs.setString("user", null);
                  Navigator.pushReplacementNamed(context, "/login");
                }),

          ],)
        ,),
    ), "Аккаунт");
  }
}