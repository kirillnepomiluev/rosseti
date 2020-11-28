import 'dart:core';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class Suggetioninfo extends StatefulWidget {
   String suggetionId;
   Suggetioninfo ({this.suggetionId});
  @override
  _SuggetioninfoState createState() => _SuggetioninfoState();
}

class _SuggetioninfoState extends State<Suggetioninfo> {
  @override
  Widget build(BuildContext context) {

      if (kIsWeb) {
        return  buildBody();
      }
      return buildMyScaffold(context, buildBody (), "Информация о  предложении");

  }
  Widget buildBody () {
    return Container(child:  widget.suggetionId == null?   Container(child: Text("Предложение не выбранно")
    )
        :
    StreamBuilder(
      stream: store.collection("suggestions").doc(widget.suggetionId).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          DocumentSnapshot documentSnapshot = snapshot.data;
          Map<String, dynamic> data =          documentSnapshot.data();

          return Container(padding: EdgeInsets.all(24), child: ListView(
            shrinkWrap: true,
            children: [
            Container( padding:  EdgeInsets.all(20), child: buildBody2(context ,data ),),


          ],) , );


        } else if (snapshot.hasError) {
          return Container (child: Text("Ошибка"),);

        }
        return Container(child: CircularProgressIndicator(), );
      },)
    );
  }
  Widget buildBody2 (BuildContext context, Map<String, dynamic> data){
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: VanColumn(context, data)),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
  Widget VanColumn (BuildContext context, Map<String, dynamic> data){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(18),
              margin: EdgeInsets.fromLTRB(0, 5, 0, 40),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 7),
                      height:30,
                      width: 30,
                      child: Image.asset('assets/forPageMainWeb.png')),
                  Text(data['name'])
                ]
              ),
            ),
            Row(children: [
              InkWell(child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFF0F4F8)
                ),
                height: 32,
                width: 170,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10,left: 12),
                        height: 14,
                        width: 14,
                        child: Image.asset('assets/IconEdit.png')),
                    Text('Редактирование')
                  ],
                ),
              ),),
              InkWell(child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFF0F4F8)
                ),
                height: 32,
                width: 215,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 10,left: 12),
                        height: 14,
                        width: 14,
                        child: Image.asset('assets/IconMessage.png')),
                    Text('Написать комментарий')
                  ],
                ),
              ),),InkWell(child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFF0F4F8)
                ),
                height: 32,
                width: 170,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 10,left: 12),
                        height: 14,
                        width: 14,
                        child: Image.asset('assets/starIcon.png')),
                    Text('Рассмотреть')
                  ],
                ),
              ),)
            ],),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 2,child: Container(margin: EdgeInsets.only(left: 15),child: ColumnName(context,data))),
                  Expanded(flex: 2,child: ColumnTwo(context,data)),
                  Expanded(flex: 2,child: ColumnThree(context,data)),
                  Expanded(flex: 2,child: ColumnFo(context,data))
                ],
              ),
            )
          ],
      ),
    );
  }

  Widget ColumnName (BuildContext context,Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(margin: EdgeInsets.only(top: 10),child: Text(
          'Статус'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Смены статуса'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Категория'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Приоритет'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Экономический эффект'
        ),),
      ],
    );
  }
  Widget ColumnTwo (BuildContext context,Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            data['status'],maxLines: 1,
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            '12/12/20'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            data['category']
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            '155'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            data['effect']
        ),),
      ],
    );
  }
  Widget ColumnThree (BuildContext context,Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Рег номер'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Дата регистрации'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'ДЗО'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Наименование филиала'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Автор'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Должность'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Наблюдатели'
        ),)
      ],
    );
  }
  Widget ColumnFo (BuildContext context,Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            '2020-10-123'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            data['createDate'].toString()
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Россети'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            data['branch']
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Иванов Иван'
        ),),
        Container(margin: EdgeInsets.only(top: 10),child: Text(
            'Архиьтектор вселенной'
        ),),
      ],
    );
  }





}