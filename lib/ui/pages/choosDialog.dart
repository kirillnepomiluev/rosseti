import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rosseti/ui/widgets/MyTexts.dart';
import 'package:rosseti/ui/widgets/RaisedGradientButton.dart';

import '../../data.dart';
import '../../main.dart';

class ChooseDialog extends StatefulWidget {
  final String title;
  final String url;
  final String name;
  final String addButtomAdress;
  Map<String, Object> data ;
  final String id;
  final List<String> searchParam;
  Function(Map<String, dynamic> data) function;

  ChooseDialog({
    this.title,
    this.url,
    this.name='name',
    this.id = "id",
    this.data,
    this.function,
    this.addButtomAdress,
    this.searchParam});


  @override
  _ChooseDialogState createState() => _ChooseDialogState();
}

class _ChooseDialogState extends State<ChooseDialog> {
  TextEditingController searchTextController = TextEditingController();
  List <Map<String, Object>> _listData;
  List <Map<String, Object>> searchResult;

  @override
  initState() {
    Map<String, String> headers = {
//      'content-type': 'application/json',
//      'accept': 'application/json',
//      'authorization': mainAuth
    };
    get(
      widget.url,
    ).then((value) {
      print(value.statusCode);
      print(value.body);
      List<Map<String, dynamic>> listmaps = [];
      List<dynamic> datalist = json.decode(value.body);
      datalist.forEach((element) {
        listmaps.add(element);
      });
      setData(listmaps);
    });
    searchTextController.addListener(onChange);
    super.initState();
  }

  void setData(List<Map<String, dynamic>> decode) {
    setState(() {
      _listData = decode;
    });
  }

  @override
  Widget build(BuildContext context) {
    List <Map<String, dynamic>> data = searchResult == null ? _listData : searchResult;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.search),
                  Expanded(
                      child: buildTextForm(searchTextController,
                          hint: "Поиск")),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        searchTextController.text="";
                        searchResult = null;
                      });
                    },
                    child: Icon (Icons.close),
                  ),
                  myGradientButton(context, btnText: "Добавить",
                      funk: () {
                        currentData = Map();

                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, item) {
                    String aviacompany = data[item]["airline"] != null ? " (${data[item]["airline"]["name"]})" : "";
                    String code = data[item]["code"] != null ? "${data[item]["code"]}  " : "";
                    String parkNumber = data[item]["parkNumber"] != null ? " стоянка ${data[item]["parkNumber"]}" : "";
                    String numberPlane = data[item]["numberPlane"] != null ? " номер самолета ${data[item]["numberPlane"]}" : "";
                    String modelPlane = data[item]["plane"] !=null ? "  ${data[item]["plane"]["model"]}" : "";
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child:
                          InkWell(
                              hoverColor: Colors.black12,
                              child: Text(code + data[item][widget.name].toString() + aviacompany + parkNumber + numberPlane + modelPlane),
                            onTap: () {
                              if (widget.function == null) {
                                Map<String, Object>  newdata = widget.data;
                                newdata['nameEmployer']= data[item][widget.name].toString();
                                newdata['idEmployer']= data[item][widget.id];
                                linkCustomerToTask(newdata);
                              } else {
                                widget.function( data[item]);
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void linkCustomerToTask(Map<String, Object> data) {
    post("https://$dbURL/inner/tza/event_modify.php",
//          headers: headers,
        body: json.encode(data))
        .then((value) {
      print(value.statusCode);
      print(value.body);
      if (value.statusCode == 200) {
        showDialog(
            context: context,
            
            builder: (context) {
              return Dialog(
                backgroundColor: Theme.of(context).accentColor,
                child: Container(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Text(
                      "Обновленно успешно",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
              );
            });
      }
    });
  }

  void onChange() {
    String text = searchTextController.text.toLowerCase();
    setState(() {
      if (text == "") {
        searchResult = null;
      } else {
        searchResult = new List();
        _listData.forEach((element) {
          if (widget.searchParam != null) {
            widget.searchParam.forEach((e) {
              String param = element[e].toString().toLowerCase();
              if (param.contains(text)) searchResult.add(element);
            });
          }
        });
      }
      debugPrint("CHOOSEDATALOG " + searchResult.toString());
    });
  }
}
