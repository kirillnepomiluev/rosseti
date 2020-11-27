import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class FillingForm extends StatefulWidget {
  @override
  _FillingFormState createState() => _FillingFormState();
}

class _FillingFormState extends State<FillingForm> {
  String categories = '';
  List<String> categoriesList = [
    'АААААА',
    'ИИИИИИ',
    'ВВВВВВ',
  ];
  TextEditingController _controllerNameTrable = TextEditingController();
  TextEditingController _controllerCharacteristicTrable =
      TextEditingController();
  TextEditingController _controllereffect = TextEditingController();
  bool _valueCheck = false;

  @override
  Widget build(BuildContext context) {
    return buildMyScaffold(context, Filing(context), "Форма заполнения",
        bottomItemIndex: 3,
        isAppbar: true,
        IconAppBar: IconButton(
          icon: Icon(Icons.shopping_basket_outlined),
          onPressed: () {
            Navigator.pushNamed(context, '/basketPage');
          },
        ));
  }

  Widget Filing(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Автор',
            ),
            _After(context),
            _button(context, buttonText: 'Добавить автора'),
            _DropDawnList(context),
            TextFormField(
              controller: _controllerNameTrable,
              decoration: InputDecoration(
                  hintText: 'Введите название кратко и по сути',
                  hintStyle: TextStyle(
                    color: Color(0xFF829AB1),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                    fontFamily: "PTRootUI",
                  ),
                  hintMaxLines: 8),
            ),
            _textField(context,
                text:
                    'Описание действительного положения с указанием существующих недостатков:',
                hintText:
                    'Характеристика проблемы, которую решает рационализаторское предложение, должна описывать недостатки'
                    ' действующей конструкции изделия, технологии производства, применяемой техники или состава материала',
                controller: _controllerCharacteristicTrable),
            _textField(context,
                controller: _controllereffect,
                text: 'Ожидаемый положительный эффект от использлования:',
                hintText: 'Указывается информация об ожидаемом техническом, '
                    'организационном, управленческом или ином положительном эффекте от использования.'
                    ' Расчет планируемой эффективности применения рационализаторского предложения готовится'
                    ' согласно Приложению 10 к настоящему Положению и прикладывается к заявлению '),
            Container(
              height: 40,
            ),
            Text('Необходимые затраты на внедрение'),
            _button(context, buttonText: 'Добавить статью затрат'),
            Text('Требуемые сроки на внедрение'),
            _button(context, buttonText: 'Добавить срок внедрения'),
            Text(
                'Настоящим подтверждается действительное авторство и в соответствии с творческим участием каждого из авторов заключается следующее соглашение: '),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Соглашение',
                style: TextStyle(
                  color: Color(0xFF486581),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  fontFamily: "PTRootUI",
                ),
              ),
            ),
            Text(
                'о распределении вознаграждения ( % ) за использование рационализаторского предложения'),
            Text('№ 1  от 22.05.21',
                style: TextStyle(
                  color: Color(0xFF486581),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  fontFamily: "PTRootUI",
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text('Распределение вознаграждения')),
            _gonorar(context),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                  'Прошу расчет размера вознаграждения произвести как за рационализаторское предложение:'),
            ),
            _checBox(context),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                  'Данное предложение не является обьектом патентного права.'),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                'Прикрепленные файлы',
                style: TextStyle(
                  color: Color(0xFF486581),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  fontFamily: "PTRootUI",
                ),
              ),
            ),
            Container(
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
          ],
        ),
      ),
    );
  }

  Widget _After(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  height: 35,
                  width: 35,
                  child: Image.asset(
                    'assets/imageee.png',
                    fit: BoxFit.fill,
                  )),
              Container(
                child: Text('Иванов Иван Иванович'),
                margin: EdgeInsets.only(left: 15),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _button(BuildContext context, {String buttonText = ''}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 15),
      child: InkWell(
        onTap: () {},
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

  Widget _DropDawnList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1)),
      height: 35,
      child: DropdownButton(
          icon: Container(),
          underline: Container(
            height: 0,
            color: Colors.deepOrangeAccent,
          ),
          isExpanded: true,
          // iconSize: 12,
          // elevation: 5,
          hint: Text(
            categories == "" ? 'Выберите категорию' : categoriesList,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          items: categoriesList.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  item,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: "OpenSansReg",
                      fontSize: 13,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              categoriesList = value;
            });
            // categoriesList = value;
          }),
    );
  }

  Widget _textField(BuildContext context, {String hintText = '', String text = '', TextEditingController controller}) {
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
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyText1,
                hintMaxLines: 8),
          ),
        ],
      ),
    );
  }

  Widget _gonorar(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1 Иванов Иван Иванович'),
              Container(
                child: Row(
                  children: [
                    Text('75%'),
                    Icon(
                      Icons.lock,
                      size: 14,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: 15),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _checBox(BuildContext context) {
    return Container(
        height: 27,
        margin: EdgeInsets.only(bottom: 15),
        child: Row(children: [
          InkWell(
            onTap: () {
              setState(() {
                _valueCheck = !_valueCheck;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                  border: Border.all(color: Colors.blue, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: _valueCheck
                    ? Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue, width: 1)))
                    : Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).cardColor,
                            border: Border.all(
                                color: Theme.of(context).cardColor, width: 1))),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 26),
              child: Text(
                'Создающее экономию',
              )),
        ]));
  }
}
