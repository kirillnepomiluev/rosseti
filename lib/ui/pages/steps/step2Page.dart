import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/ui/pages/steps/stepScaffold.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class StepTwo extends StatefulWidget{
  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  int bottomItemIndex = 0;
  TextEditingController _controllerNameTrable = TextEditingController();
  TextEditingController _controllerCharacteristicTrable =
  TextEditingController();
  TextEditingController _controllereffect = TextEditingController();
  bool valideName = true;

  @override
  Widget build(BuildContext context) {
    return buildMyScaffold2(context,  Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text('Выберите категорию'),
          TextFormField(
            controller: _controllerNameTrable,
            decoration: InputDecoration(
                errorText: valideName ? "" : "Название не заполненно",
                hintText: 'Введите название кратко и по сути',
                hintStyle: TextStyle(
                  color: Color(0xFF829AB1),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                  fontFamily: "PTRootUI",
                ),
                hintMaxLines: 8),
          )        ],
      ),
    ), "Шаг 2",
      bottomItemIndex: 2,
      isAppbar: true,
      text1: 'назад',
      text2: 'далее',
      routName1: '/StepOne',
      routName2: '/StepThree',
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
                  _routeName = '/StepOne' ;
                  break;
                case 1:
                  _routeName = '/StepThree';
                  break;

              }
              Navigator.pushNamed(context, _routeName);
            })
    );
  }
}