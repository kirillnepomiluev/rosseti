import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class FillingForm extends StatefulWidget{
  @override
  _FillingFormState createState() => _FillingFormState();
}

class _FillingFormState extends State<FillingForm> {
  @override
  Widget build(BuildContext context) {
    return buildMyScaffold(context, Filing(context), "Форма заполнения",
        bottomItemIndex: 3,
        isAppbar: true,
        IconAppBar: IconButton(
          icon: Icon(Icons.shopping_basket_outlined),
          onPressed: () {
            Navigator.pushNamed(context, '/basketPage');
          },
        ));
  }
  Widget Filing (BuildContext context){
    return Container();
  }
}