import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:rosseti/funcs/dbfuncs.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/themes/colors.dart';
import 'package:rosseti/ui/pages/choosDialog.dart';

import '../../data.dart';
import 'MyTexts.dart';

Card buildDeviceCard(
    {Map<String, Object> data = const {
      "id": " Ид Устройства",
      "name": "Имя не указанно",
      "time": " Время не указанно",
      "gps": " координаты не заданы",
      "status": true
    },
    void Function() onTapFunc}) {
  if (data["status"] is String) {
    data["status"] = (data["status"] == "true");
  }
  return Card(
    margin: EdgeInsets.all(8.0),
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        onTapFunc();
        print('Card tapped.');
      },
      child: Container(
          height: 100.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("ID: ${data["id"].toString()}"),
                  Text("Сотрудник: ${data["name"].toString()}"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("время:  ${data["time"].toString()}"),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  color: data["status"] ? maingazpromgreen : maingazpromorange,
                  child: Center(
                      child: Text(
                          "статус:" + (data["status"] ? "Свободно" : "Занято"),
                          style: TextStyle(
                              color: Colors.white, fontFamily: "DinPro")))),
            ],
          )),
    ),
  );
}

Card buildCustomerCard(
    {Map<String, Object> data = const {
      "phone": "нет номера телефона",
      "id": "устройства не привязанн",
      "name": "Имя не указанно",
      "time": " Время не указанно",
      "gps": " координаты не заданы",
      "status": true
    },
    void Function() onTapFunc}) {
  if (data["status"] is String) {
    data["status"] = (data["status"] == "true");
  }

  return Card(
    margin: EdgeInsets.all(8.0),
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        onTapFunc();
        print('Card tapped.');
      },
      child: Container(
          height: 90.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Сотрудник: ${data["name"].toString()}"),
                  Text("ID ТЗА: ${data["id"].toString()}"),
                  Text("телефон: ${data["phone"].toString()}"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("время: ${data["time"].toString()}"),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                      child: Text((data["status"] ? "Занят" : "Ждет задачи")))),
            ],
          )),
    ),
  );
}

Card buildAdminCard(
    {Map<String, Object> data = const {
      "name": "Имя не указанно",
      "phoneNumber": "нет номера телефона",
      "status": true
    },
    void Function() onTapFunc}) {
  if (data["status"] == null) data['status'] = true;
  if (data["status"] is String) {
    data["status"] = (data["status"] == "true");
  }
  return Card(
    margin: EdgeInsets.all(8.0),
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        onTapFunc();
        print('Card tapped.');
      },
      child: Container(
          height: 90.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("ФИО: ${data["name"].toString()}")),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("телефон: ${data["phoneNumber"].toString()}")),
                ],
              ),
              Container(
                  child: Center(
                      child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("право на управление администраторами:" +
                    (data["role"] == "admin" ? "Да" : "Нет")),
              ))),
            ],
          )),
    ),
  );
}

Widget buildCustomer222Card(BuildContext context,
    {Map<String, Object> data = const {
      "name": "Имя не указанно",
      "phoneNumber": "нет номера телефона",
      "status": true
    },
    void Function() onTapFunc}) {
  return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            new BoxShadow(
                color: Colors.grey, blurRadius: 6.0, spreadRadius: 1.5)
          ],
          border: Border.all(color: Colors.grey, width: 0.3),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 165,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(flex: 3, child: customersInfoContainer(data)),
          Expanded(flex: 3, child: castomersCurrentContainer(data, context)),
          Expanded(flex: 3, child: CustomersNextContainer(data, context)),
        ],
      ));
}

Widget buildAviacompanyCard(BuildContext context, bool selected,
    {Map<String, Object> data = const {
      "id": 1,
      "name": "Авиакомпания",
      "comment": " ",
    },
    void Function() onTapFunc}) {
  return Container(
      width: 200,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).accentColor
              : Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            new BoxShadow(
                color: Colors.grey, blurRadius: 6.0, spreadRadius: 1.5)
          ],
          border: Border.all(color: Colors.grey, width: 0.3),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: data["comment"] == null ? 60 : 100,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text(
                data["name"].toString(),
                style: selected
                    ? Theme.of(context).textTheme.headline3
                    : Theme.of(context).textTheme.bodyText2,
              )),
          data["comment"] == null
              ? Container()
              : Expanded(
                  flex: 2,
                  child: Text(data["comment"].toString(),
                      style: selected
                          ? Theme.of(context).textTheme.headline3
                          : Theme.of(context).textTheme.bodyText2))
        ],
      ));
}

Widget buildParkingCard(BuildContext context, bool selected,
    {Map<String, Object> data = const {
      "id": 1,
      "name": "Авиакомпания",
      "comment": " ",
    },
    void Function() onTapFunc}) {
  return Container(
      width: 200,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).accentColor
              : Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            new BoxShadow(
                color: Colors.grey, blurRadius: 6.0, spreadRadius: 1.5)
          ],
          border: Border.all(color: Colors.grey, width: 0.3),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: data["comment"] == null ? 60 : 100,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text(
                data["number"].toString(),
                style: selected
                    ? Theme.of(context).textTheme.headline3
                    : Theme.of(context).textTheme.bodyText2,
              )),
          data["comment"] == null
              ? Container()
              : Expanded(
                  flex: 2,
                  child: Text(data["comment"].toString(),
                      style: selected
                          ? Theme.of(context).textTheme.headline3
                          : Theme.of(context).textTheme.bodyText2))
        ],
      ));
}

Widget buildPlaneCard(BuildContext context,
    {Map<String, dynamic> data = const {
      "id": 1,
      "number_plane": "№",
      "comment": "",
      "model": "модель ",
    },
    void Function() onTapFunc}) {
  String aviacopmanyName = data["airline"]["name"];

  return Container(
      width: 200,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            new BoxShadow(
                color: Colors.grey, blurRadius: 6.0, spreadRadius: 1.5)
          ],
          border: Border.all(color: Colors.grey, width: 0.3),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: (data["comment"] == null || data["comment"] == "") ? 60 : 120,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text(data["plane"]["model"].toString() +
                  " №" +
                  data["number_plane"].toString() +
                  "   Авиакомпания: " +
                  aviacopmanyName)),
          (data["comment"] == null || data["comment"] == "")
              ? Container()
              : Expanded(flex: 2, child: Text(data["comment"].toString()))
        ],
      ));
}

Widget buildEventsCard(BuildContext context,
    {Map<String, dynamic> data = const {
      "idTZA": " ТЗА не назначен",
      "idEvent": " ТЗА не назначен",
      "nameEmployer": "Ответственный не назначен",
      "timeCreate": " Время не указанно",
      "statusEmployer": "В процессе выполенения данной задачи",
      "timeStartFact": " Время не указанно",
      "timeEndFact": " Время не указанно",
      "timeStartNeed": " Время не указанно",
      "timeEndNeed": " Время не указанно",
      "parkNumber": "1",
      "aviacompany": "Авиакомпания",
      "modelPlane": "Модель самолета",
      "numberPlane": "номер самолета",
      "statusFuelEnd": true,
      "statusStartFuel": false,
      "needTime": "30 минут",
      "qFuel": 100,
      "typeFuel": "Авиабензин"
    },
    void Function() onTapFunc}) {
  if (data["is_filled_valid"] is int) {
    data["is_filled_valid"] = (data["is_filled_valid"] == 1);
  }
  if (data["is_filled_valid"] is String) {
    data["is_filled_valid"] = (data["is_filled_valid"] == "true");
  }

  return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            new BoxShadow(
                color: Colors.grey, blurRadius: 6.0, spreadRadius: 1.5)
          ],
          border: Border.all(color: Colors.grey, width: 0.3),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: InkWell(
                  onDoubleTap: () {
                    currentData =data;

                  },
                  child: eventInfoContainer(data))),
          Expanded(flex: 6, child: employerInfoContainer(data, context)),
          Expanded(flex: 3, child: statusContainer(data, context)),
        ],
      ));
}

Widget statusContainer(Map<String, dynamic> data, BuildContext context) {
  bool statusNeedAddTask = data["refueling_required"] == "1";
  List<dynamic> taskList = data["tasks"];
  int doneTasks = 0;
  int foelDone = 0;
  int allTasks = 0;
  if (taskList != null) {
    taskList.forEach((element) {
      if (element["current_status"]["status"] != null) {
        String status = element["current_status"]["status"];
        if (status == "done") {
          doneTasks++;
          foelDone = foelDone + int.parse(element["fuel_amount"]);
        }
      }
    });
    allTasks = taskList.length;
  }

  return Container(
    decoration: BoxDecoration(
        color: !statusNeedAddTask
            ? Theme.of(context).scaffoldBackgroundColor
            : Colors.red,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            topRight: Radius.circular(10.0))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        ((doneTasks == allTasks && allTasks != 0)
                                ? statusNeedAddTask
                                    ? "Нужна подзадача на дозаправку!!!"
                                    : "Выполнена"
                                : doneTasks == 0 ? "Cоздана" : "В процессе") +
                            " $doneTasks из $allTasks",
                      ),

                      // Даты пока временно скрываем
                      /*   Text("Создания задачи: ${timeFromSeconds(data["created_at"])}",
                    style: Theme.of(context).textTheme.bodyText2),
                Text("начала выполнения: ${data["timeStartFact"]}",
                    style: Theme.of(context).textTheme.bodyText2),
                Text("завершения: ${data["timeEndFact"]}",
                    style: Theme.of(context).textTheme.bodyText2), */
                    )),
                Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        "Заправлено ${foelDone / 1000} из ${data["fuel_amount"]}  тонн",
                      ),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/tzafact.jpeg"),
                  fit: BoxFit.fitWidth),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
        )),
      ],
    ),
  );
}

Widget CustomersNextContainer(Map<String, Object> data, BuildContext context) {
  Map<String, dynamic> taskNext = data["task_created_next"];
  String id;
  String numberPlane;
  String numberParking;
  String tzaNumber;
  String flightCode;
  String flightTime;
  if (taskNext != null) {
    Map<String, dynamic> fueling = taskNext["fueling"];
    Map<String, dynamic> parking = fueling["parking"];
    Map<String, dynamic> refueller = taskNext["refueller"];
    id = "";
    if (fueling != null) {
      id = fueling["id"].toString();
      numberPlane = fueling["number_plane"].toString();
      flightCode = fueling["flight_code"].toString();
      flightTime = fueling["flight_time"] == null
          ? "Не назначенно"
          : DateFormat('HH:mm:ss dd.MM.yyyy', 'Europe/Moscow').format(
              DateTime.fromMillisecondsSinceEpoch(fueling["flight_time"] * 1000)
                  .subtract(Duration(hours: -3)));
    }
    if (refueller != null) {
      tzaNumber = refueller["number"].toString();
    }
    if (parking != null) {
      numberParking = parking["number"].toString();
    }
  }
  return Container(
    decoration: BoxDecoration(
      border: Border.symmetric(
        horizontal: BorderSide(color: Colors.grey),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: taskNext != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Следующая задача: $id"),
                        Divider(
                          height: 10,
                        ),
                        Text("Номер самолета:  $numberPlane"),
                        Text("Номер рейса:  $flightCode"),
                        Text("Время вылета:  $flightTime"),
                        Divider(
                          height: 10,
                        ),
                        Text("Стоянка №:  $numberParking"),
                        Text("ТЗА:  $tzaNumber"),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Text("Задача не назначена"),
                        ]),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                      onPressed: () {
                        showDialog(
                          child: Dialog(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ChooseDialog(
                                url:
                                    "https://$dbURL/inner/tza/app.php?cmd=fueling/list&api_token=" +
                                        apiToken,
                                data: data,
                                title: "Выберите задачу",
                                name: "id",
                                addButtomAdress: "eventInfo",
                                function: (value) {
                                  debugPrint("VALUE" + value.toString());
                                  Map<String, dynamic> body = {
                                    "fueling_id": value["id"],
                                    "operator_id": data["id"],
                                  };
                                  post(
                                          "https://$dbURL/inner/tza/app.php?cmd=fueling/assign_operator&api_token=" +
                                              apiToken,
                                          body: json.encode(body))
                                      .then((value) {
                                    print(value.statusCode);
                                    print(value.body);
                                    if (value.statusCode == 200) {
                                      requestDialog(
                                          context, json.decode(value.body),
                                          message: 'Сохранено');
                                    }
                                  });
                                },
                                searchParam: ["number"],
                              ),
                            ),
                          ),
                          context: context,
                        );
                      },
                      color: maingazprom,
                      child: Text(
                        "Назначить следующую задачу",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  )),
                  id != null
                      ? Expanded(
                          child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: RaisedButton(
                            onPressed: () {
                              showDialog(
                                child: Dialog(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: ChooseDialog(
                                      url:
                                          "https://$dbURL/inner/tza/app.php?cmd=refueller/list&api_token=" +
                                              apiToken,
                                      data: data,
                                      title: "Выберите ТЗА",
                                      name: "number",
                                      addButtomAdress: "deviceInfo",
                                      function: (value) {
                                        debugPrint("VALUE" + value.toString());
                                        Map<String, dynamic> body = {
                                          "task_id": int.parse(taskNext["id"]),
                                          "refueller_id":
                                              int.parse(value["id"]),
                                        };
                                        post(
                                                "https://$dbURL/inner/tza/app.php?cmd=task/use_refueller&api_token=" +
                                                    apiToken,
                                                body: json.encode(body))
                                            .then((value) {
                                          print(value.statusCode);
                                          print(value.body);
                                          if (value.statusCode == 200) {
                                            requestDialog(context,
                                                json.decode(value.body),
                                                message: 'Сохранено');
                                          }
                                        });
                                      },
                                      searchParam: ["number"],
                                    ),
                                  ),
                                ),
                                context: context,
                              );
                            },
                            color: maingazprom,
                            child: Text(
                              "Назначить ТЗА",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ))
                      : Container(),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget castomersCurrentContainer(
    Map<String, Object> data, BuildContext context) {
  Map<String, dynamic> taskProcess = data["task_process"];
  String id;
  String numberPlane;
  String numberParking;
  String tzaNumber;
  String flightCode;
  String flightTime;
  if (taskProcess != null) {
    Map<String, dynamic> fueling = taskProcess["fueling"];
    Map<String, dynamic> parking = taskProcess["parking"];
    Map<String, dynamic> refueller = taskProcess["refueller"];
    id = taskProcess["id"].toString();
    if (fueling != null) {
      numberPlane = fueling["number_plane"].toString();
      flightCode = fueling["flight_code"].toString();
      flightTime = fueling["flight_time"] == null
          ? "Не назначенно"
          : DateFormat('HH:mm:ss dd.MM.yyyy', 'Europe/Moscow').format(
              DateTime.fromMillisecondsSinceEpoch(fueling["flight_time"] * 1000)
                  .subtract(Duration(hours: -3)));
    }
    if (refueller != null) {
      tzaNumber = refueller["number"].toString();
    }
    if (parking != null) {
      numberParking = parking["number"].toString();
    }
  }

  return Container(
    decoration: BoxDecoration(
      border: Border.symmetric(
        horizontal: BorderSide(color: Colors.grey),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: taskProcess != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Текущая задача: $id"),
                        Divider(
                          height: 10,
                        ),
                        Text("Номер самолета:  $numberPlane"),
                        Text("Номер рейса:  $flightCode"),
                        Text("Время вылета:  $flightTime"),
                        Divider(
                          height: 10,
                        ),
                        Text("Стоянка №:  $numberParking"),
                        Text("ТЗА:  $tzaNumber"),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Text(" Нет задачи в процессе выполнения "),
                        ]),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget employerInfoContainer(Map<String, dynamic> data, BuildContext context) {
  Map<String, dynamic> operator = data["operator"];
  if (operator == null) {
    operator = Map();
    operator["name"] = "Не назначен";
  }
  Map<String, dynamic> refueller = data["refueller"];
  if (refueller == null) {
    refueller = Map();
    refueller["number"] = "Не назначен";
  }

  List<dynamic> taskList = data["tasks"];
  List<Widget> widgetTaskList = new List();

  taskList.forEach((element) {
    Map<String, dynamic> operator = element["operator"];
    Map<String, dynamic> refueller = element["refueller"];
    String fuel_amount = element["fuel_amount"];
    String name = operator == null || operator["name"] == null
        ? "Не назначен"
        : operator["name"];
    String number = (refueller == null || refueller["number"] == null)
        ? "Не назначен"
        : refueller["number"];

    String status = element["current_status"]["status"];

    Color taskColor;
    if (status != null) {
      switch (status) {
        case "done":
          taskColor = Colors.green;
          break;
        case "created":
          taskColor = Colors.white;
          break;
        default:
          taskColor = maingazpromorange;
      }
    } else {
      taskColor = maingazpromgrey;
    }

    widgetTaskList.add(Container(
      margin: EdgeInsets.only(right: 4.0),
      width: 140,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RaisedButton(
                color: taskColor,
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:
                              Text('Вы уверены что хотите удалить подзадачу ?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Отмена'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text('Удалить'),
                              onPressed: () {
                                Map<String, dynamic> body = {
                                  "id": int.parse(element["id"]),
                                };
                                post(
                                        "https://$dbURL/inner/tza/app.php?cmd=task/remove&api_token=" +
                                            apiToken,
                                        body: json.encode(body))
                                    .then((value) {
                                  print(value.statusCode);
                                  print(value.body);
                                  Navigator.of(context).pop();
                                  if (value.statusCode == 200) {
                                    requestDialog(
                                        context, json.decode(value.body),
                                        message: 'Подзадача удалена');
                                  }
                                });
                              },
                            ),
                          ],
                        );
                      });
                },
                onPressed: () {
                  showDialog(
                    child: Dialog(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ChooseDialog(
                          data: element,
                          title: "Назначить ответственного",
                          addButtomAdress: "customerInfo",
                          function: (value) {
                            Map<String, dynamic> body = {
                              "task_id": int.parse(element["id"]),
                              "operator_id": int.parse(value["id"]),
                            };
                            post(
                                    "https://$dbURL/inner/tza/app.php?cmd=task/assign_operator&api_token=" +
                                        apiToken,
//          headers: headers,
                                    body: json.encode(body))
                                .then((value) {
                              print(value.statusCode);
                              print(value.body);
                              if (value.statusCode == 200) {
                                requestDialog(context, json.decode(value.body),
                                    message: 'Сохранено');
                              }
                            });
                          },
                          searchParam: ["name"],
                          url:
                              "https://$dbURL/inner/tza/app.php?cmd=work_shift/active_operators&api_token=" +
                                  apiToken,
                        ),
                      ),
                    ),
                    context: context,
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Ответственный:"),
                    Text("$name"),
                  ],
                )),
          ),
          Divider(
            height: 10,
          ),
          Expanded(
            child: RaisedButton(
                color: taskColor,
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:
                              Text('Вы уверены что хотите удалить подзадачу ?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Отмена'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text('Удалить'),
                              onPressed: () {
                                Map<String, dynamic> body = {
                                  "id": int.parse(element["id"]),
                                };
                                post(
                                        "https://$dbURL/inner/tza/app.php?cmd=task/remove&api_token=" +
                                            apiToken,
                                        body: json.encode(body))
                                    .then((value) {
                                  print(value.statusCode);
                                  print(value.body);
                                  Navigator.of(context).pop();
                                  if (value.statusCode == 200) {
                                    requestDialog(
                                        context, json.decode(value.body),
                                        message: 'Подзадача удалена');
                                  }
                                });
                              },
                            ),
                          ],
                        );
                      });
                },
                onPressed: () {
                  showDialog(
                    child: Dialog(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ChooseDialog(
                          url:
                              "https://$dbURL/inner/tza/app.php?cmd=refueller/list&api_token=" +
                                  apiToken,
                          data: data,
                          name: "number",
                          addButtomAdress: "deviceInfo",
                          title: "Назначить ТЗА",
                          function: (value) {
                            Map<String, dynamic> body = {
                              "task_id": int.parse(element["id"]),
                              "refueller_id": int.parse(value["id"]),
                            };
                            debugPrint("DATAREF" + body.toString());
                            post(
                                    "https://$dbURL/inner/tza/app.php?cmd=task/use_refueller&api_token=" +
                                        apiToken,
//          headers: headers,
                                    body: json.encode(body))
                                .then((value) {
                              print(value.statusCode);
                              print(value.body);
                              if (value.statusCode == 200) {
                                requestDialog(context, json.decode(value.body),
                                    message: 'Сохранено');
                              }
                            });
                          },
                          searchParam: ["number"],
                        ),
                      ),
                    ),
                    context: context,
                  );
                },
                child: (status == "done")
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("ТЗА: "),
                          Text("$number"),
                          Text("${int.parse(fuel_amount) / 1000}  тонн")
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("ТЗА: "),
                          Text("$number"),
                        ],
                      )),
          ),
        ],
      ),
    ));
  });

  return Container(
    decoration: BoxDecoration(
      border: Border.symmetric(
        horizontal: BorderSide(color: Colors.grey),
      ),
    ),
    child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: widgetTaskList,
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: RaisedButton(
                              onPressed: () {
                                showDialog(
                                  child: Dialog(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ChooseDialog(
                                        data: data,
                                        title: "Назначить ответственного",
                                        addButtomAdress: "customerInfo",
                                        function: (value) {
                                          Map<String, dynamic> body = {
                                            "fueling_id": data["id"],
                                            "operator_id": value["id"],
                                            "refueller_id": data["refueller_id"]
                                          };
                                          post(
                                                  "https://$dbURL/inner/tza/app.php?cmd=fueling/assign_operator&api_token=" +
                                                      apiToken,
//          headers: headers,
                                                  body: json.encode(body))
                                              .then((value) {
                                            print(value.statusCode);
                                            print(value.body);
                                            if (value.statusCode == 200) {
                                              requestDialog(context,
                                                  json.decode(value.body),
                                                  message: 'Сохранено');
                                            }
                                          });
                                        },
                                        searchParam: ["name"],
                                        url:
                                            "https://$dbURL/inner/tza/app.php?cmd=work_shift/active_operators&api_token=" +
                                                apiToken,
                                      ),
                                    ),
                                  ),
                                  context: context,
                                );
                              },
                              color: maingazprom,
                              child: Text(
                                "Назначить ответственного",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: RaisedButton(
                              onPressed: () {
                                showDialog(
                                  child: Dialog(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ChooseDialog(
                                        url:
                                            "https://$dbURL/inner/tza/app.php?cmd=refueller/list&api_token=" +
                                                apiToken,
                                        data: data,
                                        name: "number",
                                        addButtomAdress: "deviceInfo",
                                        title: "Назначить ТЗА",
                                        function: (value) {
                                          Map<String, dynamic> body = {
                                            "fueling_id": data["id"],
                                            "operator_id": data["operator_id"],
                                            "refueller_id": value["id"]
                                          };
                                          debugPrint(
                                              "DATAREF" + body.toString());
                                          post(
                                                  "https://$dbURL/inner/tza/app.php?cmd=fueling/use_refueller&api_token=" +
                                                      apiToken,
//          headers: headers,
                                                  body: json.encode(body))
                                              .then((value) {
                                            print(value.statusCode);
                                            print(value.body);
                                            if (value.statusCode == 200) {
                                              requestDialog(context,
                                                  json.decode(value.body),
                                                  message: 'Сохранено');
                                            }
                                          });
                                        },
                                        searchParam: ["number"],
                                      ),
                                    ),
                                  ),
                                  context: context,
                                );
                              },
                              color: maingazprom,
                              child: Text(
                                "Назначить ТЗA",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
  );
}

Widget customersInfoContainer(Map<String, Object> data) {
  Map<String, dynamic> shift = data["work_shift"];
  int startTime = shift != null ? shift["started_at"] : null;
  int countTask = data["task_created_count"];
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
            child: Center(
          child: Text("ФИО: ${data["name"]}"),
        )),
        Divider(
          height: 10,
        ),
        Text(startTime == null
            ? "Не на смене"
            : "На смене с ${DateFormat('HH:mm:ss dd.MM.yyyy', 'Europe/Moscow').format(DateTime.fromMillisecondsSinceEpoch(startTime * 1000))}"),
        countTask > 1 ? Text("Назначено задач: $countTask") : Container(),
        //Text("Необходимо начать заправку:  ${data["timeStartNeed"]}"),
      ],
    ),
  );
}

Widget eventInfoContainer(Map<String, dynamic> data) {
  Map<String, dynamic> airline = data["airline"];
  if (airline == null) {
    airline = Map();
    airline["name"] = "Не назначенно";
  }
  Map<String, dynamic> plane = data["plane"];
  if (plane == null) {
    plane = Map();
    plane["model"] = "";
  }
  Map<String, dynamic> parking = data["parking"];
  if (parking == null) {
    parking = Map();
    parking["number"] = "Не назначенно";
  }

  Map<String, dynamic> reis = data["flight"];
  if (reis == null) {
    reis = Map();
    reis["dest_airport"] = " ";
  }

  return Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("№${data["id"].toString()} ${airline["name"]}"),
        Text("${reis["dest_airport"]}"),

        Divider(
          height: 10,
        ),
        Text(
            "Стоянка №:  ${parking['number'].toString()}, Топливо:  ${data["fuel_amount"]} тонн"),
        Divider(
          height: 10,
        ),
//              Text("Необходимо начать заправку:  ${data["timeStartNeed"]}"),
        Text("Время вылета ${timeFromSeconds(data["flight_time"])}"),
        Text("№ рейса:${(data["flight_code"])}"),
        Divider(
          height: 10,
        ),
        Text("Модель Самолета:  ${plane["model"].toString()}"),
        Text("Номер Самолета:  ${data["number_plane"].toString()}"),
      ],
    ),
  );
}

Widget buildEventsCardMini(BuildContext context,
    {Map<String, dynamic> data = const {
      "idTZA": " ТЗА не назначен",
      "idEvent": " ТЗА не назначен",
      "nameEmployer": "Ответственный не назначен",
      "timeCreate": " Время не указанно",
      "statusEmployer": "В процессе выполенения данной задачи",
      "timeStartFact": " Время не указанно",
      "timeEndFact": " Время не указанно",
      "timeStartNeed": " Время не указанно",
      "timeEndNeed": " Время не указанно",
      "parkNumber": "1",
      "aviacompany": "Авиакомпания",
      "modelPlane": "Модель самолета",
      "numberPlane": "номер самолета",
      "statusFuelEnd": true,
      "statusStartFuel": false,
      "needTime": "30 минут",
      "qFuel": 100,
      "typeFuel": "Авиабензин"
    },
    void Function() onTapFunc}) {
  Map<String, dynamic> airline = data["airline"];
  if (airline == null) {
    airline = Map();
    airline["name"] = "Не назначенно";
  }
  Map<String, dynamic> plane = data["plane"];
  if (plane == null) {
    plane = Map();
    plane["model"] = "";
  }
  Map<String, dynamic> parking = data["parking"];
  if (parking == null) {
    parking = Map();
    parking["number"] = "Не назначенно";
  }
  Map<String, dynamic> operator = data["operator"];
  if (operator == null) {
    operator = Map();
    operator["name"] = "Не назначен";
  }
  Map<String, dynamic> refueller = data["refueller"];
  if (refueller == null) {
    refueller = Map();
    refueller["number"] = "Не назначен";
  }
  String tasksString = "";
  List<dynamic> tasksList = data['tasks'];
  if (tasksList == null || tasksList.isEmpty) {
    tasksString = " Ответственные и ТЗА не назначены!";
  } else if (tasksList.length == 1) {
    Map<String, dynamic> _operator = tasksList[0]["operator"];
    if (_operator == null) {
      _operator = Map();
      _operator["name"] = "Не назначен";
    }
    Map<String, dynamic> _refueller = tasksList[0]["refueller"];
    if (_refueller == null) {
      _refueller = Map();
      _refueller["number"] = "Не назначен";
    }

    tasksString = " ТЗА:" +
        _refueller["number"].toString() +
        " - " +
        _operator["name"].toString();
  } else {
    tasksString = " (${tasksList.length.toString()})";
    tasksList.forEach((element) {
      Map<String, dynamic> _operator = element["operator"];
      if (_operator == null) {
        _operator = Map();
        _operator["name"] = "Не назначен";
      }
      Map<String, dynamic> _refueller = element["refueller"];
      if (_refueller == null) {
        _refueller = Map();
        _refueller["number"] = "Не назначен";
      }

      tasksString = tasksString +
          " (${_refueller["number"].toString()} - ${_operator["name"].toString()})";
    });
  }

  int doneTasks = 0;
  int allTasks = 0;
  List<dynamic> taskList = data["tasks"];
  bool inProcess = false;
  if (taskList != null) {
    taskList.forEach((element) {
      if (element["current_status"]["status"] != null) {
        String status = element["current_status"]["status"];
        if (status == "done") {
          doneTasks++;
        }
      }
    });
    allTasks = taskList.length;
  }
  bool refuellingRequired = data["refueling_required"] == "1" ? true : false;
  String refuellingRequiredPlus = refuellingRequired ? "+" : "";
  Color statusColor = Theme.of(context).scaffoldBackgroundColor;
  debugPrint("REFREQ" + refuellingRequired.toString());
  if (refuellingRequired) {
    statusColor = redSelected;
  } else if (doneTasks == allTasks && allTasks != 0) {
    statusColor = Colors.green;
  } else if (doneTasks > 0) {
    statusColor = maingazpromorange;
  }
  return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      decoration: BoxDecoration(
          color: statusColor,
          boxShadow: [
            new BoxShadow(
              blurRadius: 0.6,
              spreadRadius: 0.3,
              color: Color(0x50070BA),
            )
          ],
          border: Border.all(color: Colors.grey, width: 0.1),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      height: 26,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.flight_takeoff,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: miniText(
                  context,
                  "${timeFromSeconds(data["flight_time"])} (${(data["flight_code"])})",
                ),
              )),
          Expanded(
            flex: 2,
            child: Container(
                child: miniText(
                    context, " P:  ${parking["number"].toString()}  ")),
          ),
          Expanded(
              flex: 4,
              child: miniText(context, "${airline["name"].toString()}")),
          Container(
            child: Icon(
              Icons.flight,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
          Expanded(
              flex: 4,
              child: miniText(context,
                  " ${data["number_plane"].toString()} (${plane["model"].toString()})")),
          Container(
            child: Icon(
              Icons.local_gas_station,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
          Expanded(
            flex: 2,
            child:
                miniText(context, "  ${data["fuel_amount"].toString()} тонн"),
          ),
          Container(
            child: Icon(
              Icons.local_shipping,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
          Expanded(
              flex: 12,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: miniText(context, tasksString),
              )),

//              Text("Необходимо начать заправку:  ${data["timeStartNeed"]}"),

          Container(
            width: 120,
            child: miniText(
              context,
              "  Cтатус: $doneTasks($allTasks$refuellingRequiredPlus)",
            ),
          ),
        ],
      ));
}
