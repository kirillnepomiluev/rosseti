import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:rosseti/funcs/dbfuncs.dart';


import '../../data.dart';
import '../../main.dart';
import '../widgets/MyTexts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginTexController = new MaskedTextController(mask: '+0(000)0000000');
  final TextEditingController passwordTexController = TextEditingController();
  bool exception = false;

  @override
  void initState() {
    passwordTexController.addListener(() {
      setState(() {
        exception = false;
      });
    });

    loginTexController.addListener(() {
      setState(() {
        exception = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(
      child: Container(
        width: 500,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Text(" Вход")),
            ),
            buildTextForm(loginTexController, label: "номер телефона"),
            buildTextForm(passwordTexController, label: "Пароль", obscureText: true),
            Container(padding: EdgeInsets.all(2),
                margin: EdgeInsets.all(12),
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 3.0,
                        color: Colors.grey,
                      )
                    ]
                ),
                child:
                ListTile(
                  title: Text("Войти", style: Theme
                      .of(context)
                      .textTheme
                      .headline3,),
                  leading: Icon(Icons.input),
                  onTap: () {
                    login();
                  },
                )
            ),
            !exception? Container() :  Padding(padding: EdgeInsets.all(10),
              child: Text("Ошибка, возможно логин или пароль не верные"),
            )
          ],
        ),
      ),

    ),);
  }

  Future<void> login() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode(
            '${loginTexController.text}:${passwordTexController.text}'));
    print(basicAuth);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': basicAuth
    };
    String userId;
    String passworddb;
    store.collection("users").where("login", isEqualTo: loginTexController.text).get().then((value) {
      if (value.docs.isNotEmpty) {
        passworddb = value.docs.first.data()["password"];
        if (passworddb == passwordTexController.text) {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Theme
                      .of(context)
                      .dialogBackgroundColor,
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Center(
                      child: Text(
                        "Авторизация прошла успешно",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6, textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                );
              });
          tohomepage(context, value.docs.first.data() );

        } else {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Theme
                      .of(context)
                      .accentColor,
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Center(
                      child: Text(
                        "Неверный пароль",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6, textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              });
        }
      }  else {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Theme
                    .of(context)
                    .accentColor,
                child: Container(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Text(
                      "Нет такого пользователя",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6, textAlign: TextAlign.center,
                    ),
                  ),
                ),

              );
            });
      }

    });



    // Map<String, dynamic> loginData = {"password":passwordTexController.text, "phoneNumber":loginTexController.text};



//     http.Response r = await http.post('https://$dbURL/inner/tza/app.php?cmd=admin/login',
//         body: json.encode(loginData)
// //        headers: headers,
//     );
//
//     print(r.statusCode);
//     print(r.body);
//     if (r.statusCode == 200) {
//
//       bool isOk =  requestDialog(context,json.decode(r.body), message:'Авторизация прошла успешно');
//       if (isOk ) tohomepage (context,json.decode(r.body));
//       else setState(() {
//         exception = true;
//       });
//     } else {
//       setState(() {
//         exception = true;
//       });
//     }
  }

  void tohomepage(BuildContext context, Map<String, dynamic> data, ) {
    curUser = data;

    Navigator.of(context).pushReplacementNamed("/");
  }

}