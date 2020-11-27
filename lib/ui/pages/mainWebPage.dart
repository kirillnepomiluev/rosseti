import 'package:flutter/material.dart';
import 'package:rosseti/ui/widgets/myAppBar.dart';

class MainWebPage extends StatefulWidget {
  @override
  _MainWebPageState createState() => _MainWebPageState();
}

class _MainWebPageState extends State<MainWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar ( title: MyAppBar(title: "Главная",),),

    );
  }
}