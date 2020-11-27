

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:tzawebapp/themes/colors.dart';

Widget myBodyTextSmall(String text) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: new Text(text,
      style: new TextStyle(fontSize:14.0,
//          color: const Color(0xFF000000),
//          fontWeight: FontWeight.w300,
          fontFamily: "Roboto"),
    ),
  );
}

Widget myMenuText(String text, BuildContext context ,{Icon icon}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Row(
      children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(6.0),
        child: icon==null? Container() :
            icon,
      ),
      new Text(text,
      style: Theme.of(context).textTheme.headline5,
    ),],)

  );
}

Padding buildBodyTextMedium(String text) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: new Text(text,
      style: new TextStyle(fontSize:16.0,
//          color: const Color(0xFF000000),
//          fontWeight: FontWeight.w400,
          fontFamily: "Roboto"),
    ),
  );
}

Widget buildTextForm(TextEditingController controller, {String hint, String label = "",  Function onTap, double height, bool onlyNumbers = false, FocusNode focusNode, bool obscureText = false } ) {
  return Container(
    height: height,
    padding: const EdgeInsets.all(8.0),
    child: onlyNumbers? TextFormField(
      obscureText: obscureText,
      keyboardType: TextInputType.number,
      inputFormatters: [
      WhitelistingTextInputFormatter.digitsOnly],
      expands: height!=null,
      maxLines: height!=null? null: 1,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
          border: OutlineInputBorder(),
          hintText: hint),
      style: new TextStyle(

          fontSize: 14.0,
          color: maingazprombiryze,
          fontWeight: FontWeight.w200,
          fontFamily: "DinPro"),
    ) : TextFormField(
      obscureText: obscureText,
      expands: height!=null,
      maxLines: height!=null? null: 1,
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          hintText: hint),
      style: new TextStyle(

          fontSize: 14.0,
          color: maingazprombiryze,
          fontWeight: FontWeight.w200,
          fontFamily: "DinPro"),
    ),
  );
}

Widget miniText(BuildContext context, text) {
  return Text(text, style: Theme.of(context).textTheme.bodyText1,
    maxLines: 1,
  );
}