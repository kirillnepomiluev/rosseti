import 'package:flutter/cupertino.dart';
import 'package:rosseti/themes/colors.dart';
import 'package:flutter/material.dart';

Widget myGradientButton(BuildContext context,
    {String btnText = " ",
    void Function() funk,
    double width,
    double radiusCorner = 5.0,
    Icon icon}) {
  return Container(
    width: width,
    child: RaisedButton(
      color:Theme.of(context).textTheme.headline6.color,
      onPressed: funk,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusCorner)),
      padding: const EdgeInsets.all(0),
      child: Ink(
        color: Theme.of(context).textTheme.headline6.color,
        child: Container(
          height: 54,
          padding:  EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              icon == null ? Container() :
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: icon,
              ),
              Text(btnText,
                  textAlign: icon == null ? TextAlign.center : TextAlign.start,
                  style: Theme.of(context).textTheme.headline5)
            ],
          ),
        ),
      ),
    ),
  );
}

Widget myGradientButtonWhite(BuildContext context,
    {String btnText = " ",
    void Function() funk,
    double width,
    double radiusCorner = 5.0,
    Icon icon}) {
  return Container(
    width: width,
    child: RaisedButton(
      onPressed: funk,
      padding: const EdgeInsets.all(0.0),
      color: Theme.of(context).appBarTheme.color,
      child: Container(
        height: 54,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: icon,
            ),
            Text(btnText,
                textAlign: icon == null ? TextAlign.center : TextAlign.start,
                style: Theme.of(context).textTheme.headline6)
          ],
        ),
      ),
    ),
  );
}

Widget myGradientButtonOrange(BuildContext context,
    {String btnText = " ",
      double radiusCorner = 5.0,
      void Function() funk}) {
  return RaisedButton(
    onPressed: funk,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusCorner)),
    padding: const EdgeInsets.all(0.0),
    child: Ink(
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: <Color>[maingazpromorange, Colors.red]),
      ),
      child: Container(
        padding: EdgeInsets.all(14),
//        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0, maxWidth: 123),
        // min sizes for Material buttons
        alignment: Alignment.center,
        child: Text(btnText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3),
      ),
    ),
  );
}

Widget myGradientButtonNoRadius(BuildContext context,
    {String btnText = " ", void Function() funk}) {
  return Ink(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          colors: <Color>[btngradientstartlight, btngradientendlight]),
//        borderRadius: BorderRadius.all(Radius.circular(80.0)),
    ),
    child: Container(
      padding: EdgeInsets.all(14),
//        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0, maxWidth: 123),
      // min sizes for Material buttons
      alignment: Alignment.center,
      child: Text(
        btnText,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  );
}

Widget answerButton(BuildContext context,
    {String btnText = " ", void Function() funk}) {
  return RaisedButton(
    onPressed: funk,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    padding: const EdgeInsets.all(0.0),
    child: Ink(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.2,
//        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0, maxWidth: 123),
        // min sizes for Material buttons
        alignment: Alignment.center,
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
      ),
    ),
  );
}
