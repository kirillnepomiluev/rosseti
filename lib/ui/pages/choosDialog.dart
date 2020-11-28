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
  final List<String> listString;
  final List<Map<String, dynamic>> listDatas;
  final String addButtomAdress;
  Map<String, Object> data ;
  final String id;
  final List<String> searchParam;
  Function(dynamic data) function;
  bool multiChoice;

  ChooseDialog({
    this.title,
    this.url,
    this.name='name',
    this.id = "id",
    this.data,
    this.function,
    this.addButtomAdress,
    this.searchParam, this.multiChoice = false, this.listDatas,this.listString});


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
    if (widget.listString != null) {
      setState(() {
        _listData = widget.listString.map((e) {

          if (widget.multiChoice) {
            return {
              "title": e,
              "choosen": false
            };
          } else {
            return {
              "title": e,
            };
          }
        }
        ).toList();
      });
    } else if (widget.listDatas != null) {
      setState(() {
        _listData = widget.listDatas;
      });
    } else {
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
    }
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
              padding: EdgeInsets.all(8.0),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
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
                  widget.multiChoice? myGradientButton(context, btnText: "Применить",
                      funk: () {
                        if (widget.function == null) {

                        } else {
                          widget.function(data);

                        }

                        Navigator.of(context).pop();
                      })    :  myGradientButton(context, btnText: "Добавить",
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
                    bool choosen = false;
                    if (data[item]['choosen'] != null) {
                      choosen = data[item]['choosen'];
                    }
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child:
                          InkWell(
                              hoverColor: Colors.black12,
                              child: widget.multiChoice?  Row(
                                children: [
                                  Checkbox(value: choosen, onChanged: (bool value) {
                                    setState(() {
                                      data[item]['choosen'] = !choosen;
                                    });
                                  },
                                  ),
                                  Text(data[item][widget.name].toString())
                                ],
                              )   :   Text(data[item][widget.name].toString()),
                            onTap: () {
                                if (!widget.multiChoice) {
                                  if (widget.function == null) {
                                  } else {
                                    widget.function(data[item]);
                                    Navigator.of(context).pop();
                                  }
                                } else {
                                  setState(() {
                                    data[item]['choosen'] = !choosen;
                                  });

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
