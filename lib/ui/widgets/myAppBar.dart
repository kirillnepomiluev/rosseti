import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rosseti/ui/pages/FillingForm.dart';

import '../../main.dart';
import 'RaisedGradientButton.dart';

class MyAppBar extends StatefulWidget {
  final String title;

  MyAppBar({Key key, this.title}) : super(key: key);
  var state = MyAppBar2State();

  @override
  MyAppBar2State createState() => state;
}

class MyAppBar2State extends State<MyAppBar> {
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.color,
      centerTitle: false,
      title: Container(
        height: 54,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: (currentNumber == 1)
                  ? myGradientButton(context,
                      btnText: "Предложения",
                      icon: Icon(Icons.list_alt,
                          color: Theme.of(context).textTheme.headline5.color),
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 1;
                      });
                      currentData = Map();
                    })
                  : myGradientButtonWhite(context,
                      icon: Icon(Icons.list_alt,
                          color: Theme.of(context).textTheme.headline6.color),
                      btnText: "Предложения",
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 1;
                      });
                      currentData = Map();
                    }),
            ),
            Expanded(
              child: (currentNumber == 4)
                  ? myGradientButton(context,
                      btnText: "Мои предожения",
                      icon: Icon(Icons.work_rounded,
                          color: Theme.of(context).textTheme.headline5.color),
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 4;
                      });
                      currentData = Map();
                    })
                  : myGradientButtonWhite(context,
                      btnText: "Мои предожения",
                      icon: Icon(Icons.work_rounded,
                          color: Theme.of(context).textTheme.headline6.color),
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 4;
                      });
                      currentData = Map();
                    }),
            ),
            Expanded(
              child: (currentNumber == 5)
                  ? myGradientButton(context,
                      btnText: "Обсуждения",
                      icon: Icon(Icons.messenger,
                          color: Theme.of(context).textTheme.headline5.color),
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 5;
                      });
                      currentData = Map();
                    })
                  : myGradientButtonWhite(context,
                      btnText: "Обсуждения",
                      icon: Icon(Icons.messenger,
                          color: Theme.of(context).textTheme.headline6.color),
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 5;
                      });
                      currentData = Map();
                    }),
            ),
            Expanded(
              child: (currentNumber == 3)
                  ? myGradientButton(context,
                      btnText: "Справочники",
                      icon: Icon(Icons.local_parking,
                          color: Theme.of(context).textTheme.headline5.color),
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 3;
                      });
                      currentData = Map();
                    })
                  : myGradientButtonWhite(context,
                      btnText: "Справочники",
                      icon: Icon(Icons.local_parking,
                          color: Theme.of(context).textTheme.headline6.color),
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 3;
                      });
                      currentData = Map();
                    }),
            ),
            Expanded(
              child: (currentNumber == 6)
                  ? myGradientButton(context,
                      btnText: "Добавить",
                      icon: Icon(Icons.add_circle_outline,
                          color: Theme.of(context).textTheme.headline5.color),
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 6;
                      });
                      currentData = Map();
                      showDialog(
                        child: Dialog(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: FillingForm(),
                          ),
                        ),
                        context: context,
                      );


                    })
                  : myGradientButtonWhite(context,
                      btnText: "Добавить",
                      icon: Icon(Icons.add_circle,
                          color: Theme.of(context).textTheme.headline6.color),
                      radiusCorner: 0.0, funk: () {
                      setState(() {
                        currentNumber = 6;
                      });
                      currentData = Map();
                      showDialog(
                        child: Dialog(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: FillingForm(),
                          ),
                        ),
                        context: context,
                      );
                    }),
            ),
            Expanded(flex: 1, child: myLogo(context))
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Icon(
            Icons.show_chart,
            color: Theme.of(context).textTheme.headline6.color,
          ),
        ),
        FlatButton(
          onPressed: () {
            setState(() {
              isViewTypeBig = !isViewTypeBig;
            });
          },
          child: Icon(
            isViewTypeBig ? Icons.format_align_justify : Icons.dns,
            color: Theme.of(context).textTheme.headline6.color,
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Icon(
            Icons.account_circle,
            color: Theme.of(context).textTheme.headline6.color,
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Icon(Icons.settings,
              color: Theme.of(context).textTheme.headline6.color),
        ),
      ],
    );
  }
}

Widget myLogo(BuildContext context) {
  return Container(
    height: 40,
    padding: EdgeInsets.all(8.0),
    width: 400,
    color: Colors.white,
    child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/logo2rosseti.png"),
                fit: BoxFit.fitHeight,
                alignment: AlignmentDirectional.center))),
  );
}





