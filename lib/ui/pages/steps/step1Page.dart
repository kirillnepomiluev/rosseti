import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/themes/colors.dart';
import 'package:rosseti/ui/pages/steps/stepScaffold.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class StepOne extends StatefulWidget{
  @override
  _StepOneState createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {

  String categories = '';
  bool twoButton = true;
  int bottomItemIndex = 0;

  List<String> categoriesList = [
    '  эксплуатация подстанций (подстанционного оборудования)',
    '  эксплуатация магистральных сетей',
    '  эксплуатация распределительных сетей',
    '  капитальное строительство, реконструкция, проектирование',
    '  эксплуатация зданий, сооружений, специальной техники',
    '  оперативно-диспетчерское управление',
    '  релейная защита и противоаварийная автоматика',
    '  информационные технологии, системы связи',
    '  эксплуатация распределительных сетей',
    '  эксплуатация распределительных сетей',
    '  мониторинг и диагностика',
  ];

  @override
  Widget build(BuildContext context) {
    return buildMyScaffold2(context,
      Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 20,bottom: 20),
              child: Text('Выберите категорию',style: TextStyle(
                color: textDisable,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 22,
                fontFamily: "PTRootUI",
              ),)),
          Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xFF9FB3C8), width: 1)),
        height: 35,
        child: DropdownButton(
            icon: Container(margin: EdgeInsets.only(right: 10),height: 9,width:16,child: Image.asset('assets/iconArow.png')),
            underline: Container(
              height: 0,
              color: Colors.deepOrangeAccent,
            ),
            isExpanded: true,
            // iconSize: 12,
            // elevation: 5,
            hint: Text(
              categories == "" ? '  Выберите категорию' : categories,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            // isDense: true,
            items: categoriesList.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: textLight,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      fontFamily: "PTRootUI",
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                categories = value;
              });
              // categoriesList = value;
            }),
          )
        ],
      ),
    ), "Шаг 1",
      bottomItemIndex: 2,
      isAppbar: true,
      botBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 26,
          unselectedItemColor:
          Theme.of(context).tabBarTheme.unselectedLabelColor,
          selectedItemColor: Theme.of(context).tabBarTheme.labelColor,
          selectedLabelStyle: Theme.of(context).tabBarTheme.labelStyle,
          unselectedLabelStyle:
          Theme.of(context).tabBarTheme.unselectedLabelStyle,
          showUnselectedLabels: true,
          items:   <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Container(
                  height: 18,
                  width: 18,
                  child: Icon(Icons.arrow_back)),
              title: Text('назад'),
            ),
            BottomNavigationBarItem(
              icon: Container(
                  height: 18,
                  width: 18,
                  child: Icon(Icons.arrow_forward)),
              title: Text('далее'),
            ),
          ],
          currentIndex: bottomItemIndex,
          onTap:  (int index) {
            String _routeName;
            switch (index) {
              case 0:
                _routeName = '/topics' ;
                break;
              case 1:
                _routeName = '/StepTwo';
                break;

            }
            Navigator.pushNamed(context, _routeName);
          }),
    );
  }
}