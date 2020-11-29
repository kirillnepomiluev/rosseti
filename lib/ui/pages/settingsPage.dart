import 'package:flutter/material.dart';
import 'package:rosseti/themes/custom_theme.dart';
import 'package:rosseti/themes/themes.dart';
import 'package:rosseti/ui/widgets/SettingsLineWiget.dart';

import '../../data.dart';
import '../../main.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController dbUrlController = TextEditingController();

  @override
  void initState() {
    dbUrlController.text = dbURL;
    super.initState();
  }

  void _changeTheme(BuildContext buildContext, {MyThemeKeys key}) {
    if (CustomTheme.instanceOf(buildContext).mythemeKey == MyThemeKeys.LIGHTFC)
      CustomTheme.instanceOf(buildContext).changeTheme(MyThemeKeys.DARKFC);
    else
      CustomTheme.instanceOf(buildContext).changeTheme(MyThemeKeys.LIGHTFC);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: BackButton(onPressed: (){Navigator.pop(context);},)),
          Expanded(
            child: Container(
              width: 400,
              child: ListView(
                children: <Widget>[
                  SettingListTile(
                    func: () {
                      _changeTheme(context);
                      prefs.setBool(
                          "isDarkTeme",
                          CustomTheme.instanceOf(context).mythemeKey ==
                              MyThemeKeys.DARKFC);
                      isDarkTheme = CustomTheme.instanceOf(context).mythemeKey ==
                          MyThemeKeys.DARKFC;
                    },
                    text: "Темная тема",
                    value: CustomTheme.instanceOf(context).mythemeKey ==
                        MyThemeKeys.DARKFC,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(18),
                  //   child: RaisedButton(onPressed: () {
                  //     showDialog(context: context, child:  Dialog(
                  //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  //       child: Container (child: Column(children: <Widget>[
                  //         Padding(padding: EdgeInsets.all(10),
                  //           child: Text("Адрес Сервера", style: Theme.of(context).textTheme.headline6,), ),
                  //
                  //         Padding(
                  //           padding: const EdgeInsets.all(20.0),
                  //           child: TextFormField( controller: dbUrlController,),
                  //         ),
                  //         RaisedButton(onPressed: () {
                  //           dbURL = dbUrlController.text;
                  //           prefs.setString("dbURL", dbUrlController.text).then((value) => showDialog(context: context,
                  //               child: Dialog(backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
                  //                 child: Container(child: Text("Адрес сервера изменен, чтобы изменения вступили в силу перезапустите приложение"),),
                  //               )));
                  //         }, child: Text("Сохранить"),)
                  //       ], ),),
                  //     ));
                  //   }, child: Text("Настройки адреса сервера"),),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
