import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

import 'SuggetionChatPage.dart';

class Suggetioninfo extends StatefulWidget {
  String suggetionId;

  Suggetioninfo({this.suggetionId});

  @override
  _SuggetioninfoState createState() => _SuggetioninfoState();
}

class _SuggetioninfoState extends State<Suggetioninfo> {
  TextEditingController controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return buildBody();
    }
    return buildMyScaffold(context, buildBody(), "Информация о  предложении");
  }

  Widget buildBody() {
    return Container(
        child: widget.suggetionId == null
            ? Container(child: Text("Предложение не выбранно"))
            : StreamBuilder(
                stream: store
                    .collection("suggestions")
                    .doc(widget.suggetionId)
                    .snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    DocumentSnapshot documentSnapshot = snapshot.data;
                    Map<String, dynamic> data = documentSnapshot.data();

                    return Container(
                      padding: EdgeInsets.all(24),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: kIsWeb
                                ? buildBody2(context, data, documentSnapshot)
                                : VanColumn(context, data),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Text("Ошибка"),
                    );
                  }
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                },
              ));
  }

  Widget buildBody2(BuildContext context, Map<String, dynamic> data,
      DocumentSnapshot documentSnapshot) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: VanColumn(context, data)),
          Expanded(
              child: kIsWeb
                  ? rightColumnWeb(context, data, documentSnapshot)
                  : Container())
        ],
      ),
    );
  }

  Widget VanColumn(BuildContext context, Map<String, dynamic> data) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(18),
            margin: EdgeInsets.fromLTRB(0, 5, 0, 40),
            child: Row(children: [
              Container(
                  margin: EdgeInsets.only(right: 7),
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/forPageMainWeb.png')),
              Text(data['name'])
            ]),
          ),
          Row(
            children: [
              (data["authorlogin"] == curUser["login"])
                  ? InkWell(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFF0F4F8)),
                        height: 32,
                        width: 170,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 10, left: 12),
                                height: 14,
                                width: 14,
                                child: Image.asset('assets/IconEdit.png')),
                            Text('Редактирование')
                          ],
                        ),
                      ),
                    )
                  : Container(),
            kIsWeb? Container() :
            InkWell(
              onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return SuggetionChat(suggetionId: widget.suggetionId,);
                  }));
              },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFF0F4F8)),
                  height: 32,
                  width: kIsWeb ? 215 : 130,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 10, left: 12),
                          height: 14,
                          width: 14,
                          child: Image.asset('assets/IconMessage.png')),
                      Text(kIsWeb ? 'Написать комментарий' : "Написать")
                    ],
                  ),
                ),
              ),
              kIsWeb? Container() : Container( height: 8.0,),
              (curUser["role"] == "expert" && kIsWeb)
                  ? InkWell(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFF0F4F8)),
                        height: 32,
                        width: 170,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 10, left: 12),
                                height: 14,
                                width: 14,
                                child: Image.asset('assets/starIcon.png')),
                            Text('Рассмотреть')
                          ],
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          ((curUser["role"] == "expert") && !kIsWeb)
              ? InkWell(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFF0F4F8)),
                    height: 32,
                    width: 170,
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10, left: 12),
                            height: 14,
                            width: 14,
                            child: Image.asset('assets/starIcon.png')),
                        Text('Рассмотреть')
                      ],
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Описание",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              data["solution"],
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Эффект",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              data["effect"],
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        margin: EdgeInsets.only(left: kIsWeb ? 15 : 0),
                        child: ColumnName(context, data))),
                Expanded(flex: 2, child: ColumnTwo(context, data)),
                kIsWeb
                    ? Expanded(flex: 2, child: ColumnThree(context, data))
                    : Container(),
                kIsWeb
                    ? Expanded(flex: 2, child: ColumnFo(context, data))
                    : Container()
              ],
            ),
          ),
          kIsWeb
              ? Container()
              : Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(flex: 2, child: ColumnThree(context, data)),
                      Expanded(flex: 2, child: ColumnFo(context, data))
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget ColumnName(BuildContext context, Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Статус'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Смены статуса'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Категория'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Приоритет'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Экономический эффект'),
        ),
      ],
    );
  }

  Widget ColumnTwo(BuildContext context, Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            data['status'],
            maxLines: 1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('12/12/20'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(data['category']),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('155'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(data['effect']),
        ),
      ],
    );
  }

  Widget ColumnThree(BuildContext context, Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Рег номер'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Дата регистрации'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('ДЗО'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Наименование филиала'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Автор'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Должность'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Наблюдатели'),
        )
      ],
    );
  }

  Widget ColumnFo(BuildContext context, Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('2020-10-123'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(data['createDate'].toString()),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Россети'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(data['branch']),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Иванов Иван'),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Архиьтектор вселенной'),
        ),
      ],
    );
  }

  Widget rightColumnWeb(BuildContext context, Map<String, dynamic> data,
      DocumentSnapshot documentSnapshot) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {},
              child: Text("СКАЧАТЬ ФОРМУ.DOC"),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            height: 2.0,
            color: Theme.of(context).textTheme.bodyText2.color,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {},
              child: Text("Обсуждение"),
            ),
          ),
          Container(
            height: 500.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: StreamBuilder(
                stream: store
                    .collection("suggestions")
                    .doc(widget.suggetionId)
                    .collection("chat").orderBy("time")
                    .snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot querySnapshot = snapshot.data;
                    return Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFD9E2EC), width: 2)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: querySnapshot.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map<String, dynamic> data =
                              querySnapshot.docs[index].data();
                          String id = querySnapshot.docs[index].id;
                          return Container(
                            margin:  EdgeInsets.all( 5),
                            decoration: BoxDecoration( color: (curUser["login"].toString() == data["aftorLogin"].toString())?Color(0xFFFFFF):
                            Color(0xFFD9E2EC),
                                border: Border.all(width: 2, color: Color(0xFFD9E2EC)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                            padding: EdgeInsets.all(8),
                            height: 90,
                            // height: 90,
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(data["text"],
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Color(0xFF102A43),
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          fontFamily: "PTRootUI",
                                        )),
                                  ),
                                  Expanded(
                                    child: Text(data["aftor"].toString(),
                                        maxLines: 2,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Color(0xFF102A43),
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          fontFamily: "PTRootUI",
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print(" firebaseError. " + snapshot.error.toString());
                    return Container(
                      child: Text("Ошибка"),
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            height: 80.0,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controllerMessage,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    store.collection("suggestions")
                        .doc(widget.suggetionId)
                        .collection("chat").add(
                      {
                        "text" : controllerMessage.text,
                        "aftor" : curUser["name"],
                        "aftorLogin" :curUser["login"],
                        "time" : DateTime.now().millisecondsSinceEpoch
                      }
                    ).then((value) {
                      controllerMessage.text = "";
                    });


                  },
                  child: Text("Отправить"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
