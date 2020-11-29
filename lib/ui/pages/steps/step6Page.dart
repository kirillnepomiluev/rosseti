import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/ui/pages/steps/stepScaffold.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class StepSix extends StatefulWidget{
  @override
  _StepSixState createState() => _StepSixState();
}

class _StepSixState extends State<StepSix> {
  int bottomItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return buildMyScaffold2(context,                   Container(
      margin: EdgeInsets.only(bottom: 20, top: 15),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Icon(
              Icons.attachment_outlined,
              size: 35,
              color: Color(0xFF486581),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text('Прикрепить файл'),
            )
          ],
        ),
      ),
    )
        , "Шаг 6",
        bottomItemIndex: 2,
        isAppbar: true,
      text1: 'назад',
      text2: 'отправить',
      routName1: '/StepFive',
      routName2: '/',
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
                  _routeName = '/StepFive' ;
                  break;
                case 1:
                  _routeName = '/';
                  break;

              }
              Navigator.pushNamed(context, _routeName);
            })
    );
  }
}