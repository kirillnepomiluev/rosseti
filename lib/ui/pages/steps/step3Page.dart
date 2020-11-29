import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/ui/pages/steps/stepScaffold.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class StepThree extends StatefulWidget{
  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  TextEditingController _controllerNameTrable = TextEditingController();
  TextEditingController _controllerCharacteristicTrable =
  TextEditingController();
  TextEditingController _controllereffect = TextEditingController();
  bool valideName = true;
  bool valideCharacteristic = true;
  bool valideeffect = true;
  bool _valueCheck = true;
  bool toFindSemantic = false;
  int bottomItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return buildMyScaffold2(context,  Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text('Выберите категорию'),
          _textField(context,
              text:
              'Описание действительного положения с указанием существующих недостатков:',
              hintText:
              'Характеристика проблемы, которую решает рационализаторское предложение, должна описывать недостатки'
                  ' действующей конструкции изделия, технологии производства, применяемой техники или состава материала',
              controller: _controllerCharacteristicTrable,
              errorText: "Описание не заполненно",
              valide: valideCharacteristic)
        ],
      ),
    ), "Шаг 3",
      bottomItemIndex: 2,
      isAppbar: true,
      text1: 'назад',
      text2: 'далее',
      routName1: '/StepTwo',
      routName2: '/StepFour',
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
                  _routeName = '/StepTwo' ;
                  break;
                case 1:
                  _routeName = '/StepFour';
                  break;

              }
              Navigator.pushNamed(context, _routeName);
            })

    );
  }
  Widget _textField(BuildContext context,
      {String hintText = '',
        String text = '',
        TextEditingController controller,
        bool valide = true,
        String errorText = ""}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                errorText: valide ? "" : errorText,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyText1,
                hintMaxLines: 8),
          ),
        ],
      ),
    );
  }

}