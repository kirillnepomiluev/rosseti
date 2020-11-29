import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class SuggetionChat extends StatefulWidget {
  String suggetionId;

  SuggetionChat({this.suggetionId});

  @override
  _SuggetionChatState createState() => _SuggetionChatState();
}

class _SuggetionChatState extends State<SuggetionChat> {
  TextEditingController controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return buildMyScaffold(context, buildBody(), "Обсуждение предложения");
  }

  Widget buildBody() {
    return Container(
        child: widget.suggetionId == null
            ? Container(child: Text("Предложение не выбранно"))
            : Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child:                     Container(
                      height: 500.0,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: StreamBuilder(
                          stream: store
                              .collection("suggestions")
                              .doc(widget.suggetionId)
                              .collection("chat")
                              .orderBy("time")
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              QuerySnapshot querySnapshot = snapshot.data;
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFD9E2EC), width: 2)),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: querySnapshot.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Map<String, dynamic> data =
                                    querySnapshot.docs[index].data();
                                    String id = querySnapshot.docs[index].id;
                                    return Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: (curUser["login"].toString() ==
                                              data["aftorLogin"].toString())
                                              ? Color(0xFFFFFF)
                                              : Color(0xFFD9E2EC),
                                          border: Border.all(
                                              width: 2,
                                              color: Color(0xFFD9E2EC)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
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
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16,
                                                    fontFamily: "PTRootUI",
                                                  )),
                                            ),
                                            Expanded(
                                              child: Text(
                                                  data["aftor"].toString(),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    color: Color(0xFF102A43),
                                                    fontWeight:
                                                    FontWeight.normal,
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
                              print(" firebaseError. " +
                                  snapshot.error.toString());
                              return Container(
                                child: Text("Ошибка"),
                              );
                            }
                          },
                        ),
                      ),
                    ),)
,
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
                              store
                                  .collection("suggestions")
                                  .doc(widget.suggetionId)
                                  .collection("chat")
                                  .add({
                                "text": controllerMessage.text,
                                "aftor": curUser["name"],
                                "aftorLogin": curUser["login"],
                                "time": DateTime.now().millisecondsSinceEpoch
                              }).then((value) {
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
              ));
  }
}
