import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/themes/colors.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

//TODO 1-экран тем 2-экран конкретной темы

class Topics extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return buildMyScaffold(
      context,
      Serching(),
      "",
      bottomItemIndex: 3,
      isAppbar: false,
    );
  }
}

class Serching extends StatefulWidget {
  Serching({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SerchingState createState() => new _SerchingState();
}

class _SerchingState extends State<Serching> {
  TextEditingController editingController = TextEditingController();

  List<String> duplicateItems = [
    'эксплуатация подстанций (подстанционного оборудования)',
    'эксплуатация магистральных сетей',
    'эксплуатация распределительных сетей',
    'капитальное строительство, реконструкция, проектирование',
    'эксплуатация зданий, сооружений, специальной техники',
    'оперативно-диспетчерское управление',
    'релейная защита и противоаварийная автоматика',
    'информационные технологии, системы связи',
    'мониторинг и диагностика',
    'контроль качества и учёт электроэнергии',
    'производственная безопасность и охрана труда',
    'технологическое присоединение',
    'аварийно-восстановительные работы',
    'экология, энергоэффективность, снижение потерь',
    'совершенствование системы управления',
    'дополнительные (нетарифные) услуги',
  ];
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 64,
                    padding: EdgeInsets.fromLTRB(12, 12, 8, 12),
                    child: TextField(
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                          labelText: "Поиск",
                          hintText: "Поиск",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)))),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    height: 32,
                    width: 32,
                    child: Image.asset('assets/Frame 10.png'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.group),
                      title: Text('${items[index]}'),
                      onTap: () {
                        Navigator.pushNamed(context, '/topic');
                      },
                    ),
                    Divider(
                      height: 1,
                      color: Colors.black,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Topic extends StatefulWidget {
  @override
  _TopicState createState() => _TopicState();
}

class _TopicState extends State<Topic> {
  @override
  Widget build(BuildContext context) {
    return buildMyScaffold(
      context,
      toptopic(context),
      "",
      bottomItemIndex: 3,
      isAppbar: false,
    );
  }

  Widget toptopic(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 64,
            child: Row(
              children: [
                BackButton(onPressed: () {
                  Navigator.pop(context);
                }),
                Expanded(
                    child: Text(
                        'эксплуатация подстанций (подстанционного оборудования);')),
                Icon(Icons.search)
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 60,
              child: Row(
                children: [
                  Icon(Icons.add),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Создать тему'),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
        Expanded(child: topicLinght(context))
        ],
      ),
    );
  }

  Widget topicLinght(BuildContext context) {
    return ListView.builder(
      // scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 12),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                    'Без транспорта, света и связи: жители острова Попова возмущены тем, что их бросили после ледяного шторма',style: TextStyle(
                  color: Color(0xFF486581),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  fontFamily: "PTRootUI",
                ),),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(height: 24,child: Image.asset('assets/imageee.png')),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Иванов Иван Иванович',style: TextStyle(
                              color: Color(0xFF829AB1),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontFamily: "PTRootUI",
                            )),
                            Text('Опубликовано 12/12/06',style: TextStyle(
                              color: Color(0xFF829AB1),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              fontFamily: "PTRootUI",
                            )),
                          ],
                        ),
                      ),
                    ),
                    DropdownButton(
                      onChanged: (value) {},
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text('Население острова Попова – части Первомайского района Владивостока осталось практически без транспортного сообщения с материком. '),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.comment),
                    Container(margin: EdgeInsets.only(left: 10,right: 30),
                    child: Text('12 комментариев'),
                    ),
                    Icon(Icons.arrow_circle_up_sharp),
                    Container(margin: EdgeInsets.only(left: 10),
                      child: Text('В избранное'),
                    )
                  ],
                ),
              ),
              Divider(color: Colors.black,height: 1,)
            ],
          ),
        );
      },
    );
  }
}
