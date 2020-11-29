import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/ui/pages/steps/stepScaffold.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class StepFive extends StatefulWidget{
  @override
  _StepFiveState createState() => _StepFiveState();
}

class _StepFiveState extends State<StepFive> {
  int bottomItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return buildMyScaffold2(context, Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text('Требуемые сроки на внедрение'),
          SizedBox(
            height: 24,
          ),
          _button(context, buttonText: 'Добавить срок внедрения'),
        ],
      ),
    ), "Шаг 5",
      bottomItemIndex: 2,
      isAppbar: true,
      text1: 'назад',
      text2: 'далее',
      routName1: '/StepFour',
      routName2: '/StepSix',
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
                  _routeName = '/StepFour' ;
                  break;
                case 1:
                  _routeName = '/StepSix';
                  break;

              }
              Navigator.pushNamed(context, _routeName);
            })

    );
  }
  Widget _button(BuildContext context, {String buttonText = '',Function func}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 15),
      child: InkWell(
        onTap: func,
        child: Row(
          children: [
            Icon(
              Icons.add,
              size: 35,
              color: Color(0xFF486581),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(buttonText),
            )
          ],
        ),
      ),
    );
  }

}