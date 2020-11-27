 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

 bool requestDialog(BuildContext context, Map<String, dynamic> requestData, {String message ="Сохранено"}) {
   bool statusOK = requestData['status']==1;
   showDialog(
       context: context,
       builder: (context) {
         return  Dialog(
           backgroundColor: statusOK? Theme.of(context).accentColor: Theme.of(context).dialogBackgroundColor,
           child: Container(
             height: 300,
             width: 300,
             child: Center(
               child: Text(
                 statusOK? "$message успешно": "Ошибка: ${requestData["errors"].toString()}",
                 style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center,
               ),
             ),
           ),

         );
       });
   return statusOK;
 }
 String timeFromSeconds (int time) {
  if (time == null ) {
    return "Не назначенно";
  }
  DateTime date =  DateTime.fromMillisecondsSinceEpoch((time) *1000);
  return DateFormat('dd.MM.yyyy HH:mm', 'Europe/Moscow').format(date);
 }