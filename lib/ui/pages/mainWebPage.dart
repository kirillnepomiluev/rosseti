import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/themes/colors.dart';
import 'package:rosseti/ui/pages/FillingForm.dart';
import 'package:rosseti/ui/pages/choosDialog.dart';
import 'package:rosseti/ui/widgets/myAppBar.dart';

import '../../data.dart';

class MainWebPage extends StatefulWidget {
  @override
  _MainWebPageState createState() => _MainWebPageState();
}

class _MainWebPageState extends State<MainWebPage> {
  String categories = 'Все';

  List<String> categoriesList = [
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

  String status = 'Все';
  List<String> statusesList = [
    'АААААА',
    'ИИИИИИ',
    'ВВВВВВ',
  ];

  String author = 'Все';
  List<String> authorsList = [
    'АААААА',
    'ИИИИИИ',
    'ВВВВВВ',
  ];
  String department = 'Все';
  List<String> departmentsList = [
    'АААААА',
    'ИИИИИИ',
    'ВВВВВВ',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:  AppBar ( title: MyAppBar(title: "Главная",),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xFF186FAF),
            height: 56,
            child: Row(
              children: [
                Container(
                  height: 32,
                  width: 107,
                  margin: EdgeInsets.only(right: 40,left: 48),
                  child: Image.asset('assets/logo2rosseti.png',color: Colors.white,),
                ),
                Ink(
                  child: Container(
                    margin: EdgeInsets.only(right: 32,left: 0),
                    child: Text('Предложения',style: TextStyle(
                      color: textWight,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontFamily: "PTRootUI",
                    ),),
                  ),
                ),
                Ink(
                  child: Container(
                    margin: EdgeInsets.only(right: 32,left: 0),
                    child: Text('Мои предложения',style: TextStyle(
                      color: textWight,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontFamily: "PTRootUI",
                    )),
                  ),
                ),
                Ink(
                  child: Container(
                    margin: EdgeInsets.only(right: 32,left: 0),
                    child: Text('Обсуждения',style: TextStyle(
                      color: textWight,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontFamily: "PTRootUI",
                    )),
                  ),
                ),
                Ink(
                  child: Container(
                    margin: EdgeInsets.only(right: 32,left: 0),
                    child: Text('Справочники',style: TextStyle(
                      color: textWight,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontFamily: "PTRootUI",
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      child: Dialog(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: FillingForm(),
                        ),
                      ),
                      context: context,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 32,left: 0),
                    child: Text('Добавить',style: TextStyle(
                      color: textWight,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontFamily: "PTRootUI",
                    )),
                  ),
                )

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40,top: 30),
            // padding:  EdgeInsets.symmetric(vertical: 32, horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // padding: EdgeInsets.all(10.0),
                  child: Text("Список предложений", style: Theme.of(context).textTheme.headline4,),
                ),
                filtersRow(),


              ],
            )
            ,),
        ],
      )

    );
  }

  Widget filtersRow() {
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      height: 32,
      child: Row(
       children: [
         Expanded(child: dropDawnList(context, title: "Темы", list: categoriesList, value: categories, function: ( data) {
           String newvalue = "";
           int size =0;
           List<Map<String, dynamic>> newData = data;
           newData.forEach((element) {
             if (element["choosen"]) {
               size++;
               newvalue = newvalue.isEmpty? element["title"] : (newvalue + ", " +  element["title"]);
             }
           });
           newvalue = size ==0? "Все" : size.toString();
           setState(() {
             categories = newvalue;
           });
         }
         )),
         Expanded(child: dropDawnList(context, title: "Статус", list: statusesList, value: status, function: ( data) {
           String newvalue = "";
           int size =0;
           List<Map<String, dynamic>> newData = data;
           newData.forEach((element) {
             if (element["choosen"]) {
               size++;
               newvalue = newvalue.isEmpty? element["title"] : (newvalue + ", " +  element["title"]);
             }
           });
           newvalue = size ==0? "Все" : size.toString();
           setState(() {
             status = newvalue;
           });
         })),
         Expanded(child: dropDawnList(context, title: "Автор", list: authorsList, value: author, function: ( data) {
           String newvalue = "";
           int size =0;
           List<Map<String, dynamic>> newData = data;
           newData.forEach((element) {
             if (element["choosen"]) {
               size++;
               newvalue = newvalue.isEmpty? element["title"] : (newvalue + ", " +  element["title"]);
             }
           });
           newvalue = size ==0? "Все" : size.toString();
           setState(() {
             author = newvalue;
           });
         })),
         Expanded(child: dropDawnList(context, title: "Отдел", list: departmentsList, value: department, function: ( data) {
           String newvalue = "";
           int size =0;
           List<Map<String, dynamic>> newData = data;
           newData.forEach((element) {
             if (element["choosen"]) {
               size++;
               newvalue = newvalue.isEmpty? element["title"] : (newvalue + ", " +  element["title"]);
             }
           });
           newvalue = size ==0? "Все" : size.toString();
           setState(() {
             department = newvalue;
           });
         })),
       ],
    ),);
  }

  Widget bigRow(BuildContext context){
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Row(
        children: [
          Column(
            children: [],
          )
        ],
      ),
    );
  }



}
Widget dropDawnList(BuildContext context, {String title="", List<String> list, String value , String dialogTitle , Function function  }) {
  return Row(
    children: [
      Text(title + ":"),
      Container(
        width: 100,

        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.grey, width: 1)),
        height: 35,
        child: InkWell(child: Row(
          children: [
            Container(margin: EdgeInsets.only(right: 10) ,child: Text(value, style: Theme.of(context).textTheme.bodyText2,)),
            Icon (Icons.keyboard_arrow_down_outlined)
          ],
        ), onTap: () {
          showDialog(
            child: Dialog(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.6,
                child: ChooseDialog(
                  multiChoice: true,
                  name: "title",
                  title: dialogTitle??title,
                  listString: list,
                  addButtomAdress: "customerInfo",
                  function: (data) {
                    function (data);
                  },
                  searchParam: ["title"],
                ),
              ),
            ),
            context: context,
          );
        },),
      ),
    ],
  );
}