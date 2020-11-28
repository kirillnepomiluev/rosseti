import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/func/mydb.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/themes/colors.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

//TODO оформление заявки

class FillingForm extends StatefulWidget {
  @override
  _FillingFormState createState() => _FillingFormState();
}

class _FillingFormState extends State<FillingForm> {
  String categories = '';

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

  TextEditingController _controllerNameTrable = TextEditingController();
  TextEditingController _controllerCharacteristicTrable =
      TextEditingController();
  TextEditingController _controllereffect = TextEditingController();
  bool valideName = true;
  bool valideCharacteristic = true;
  bool valideeffect = true;
  bool _valueCheck = true;
  bool toFindSemantic = false;

  bool verifyForms() {
    if (_controllerNameTrable.text.isEmpty) {
      setState(() {
        valideName = false;
      });
      return false;
    }
    if (_controllerCharacteristicTrable.text.isEmpty) {
      setState(() {
        valideCharacteristic = false;
      });
      return false;
    }
    if (_controllereffect.text.isEmpty) {
      setState(() {
        valideeffect = false;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return buildMyScaffold(context, Filing(context), "Форма заполнения",
        bottomItemIndex: 3,
        isAppbar: true,
        actions: [
          FlatButton(
            color: Color(0xFF186FAF),
            onPressed: () {
              if (!toFindSemantic) {
                if (verifyForms()) {
                  setState(() {
                    toFindSemantic = true;
                  });
                }
              } else {
                addNewDoc(context, "suggestions", {
                  "createDate": 1606507384,
                  "branch": "Отде название",
                  "authors": [curUser],
                  "authorlogin" : curUser["login"],
                  "authorsPositions": [
                    "нормальный поц",
                  ],
                  "name": _controllerNameTrable.text,
                  "category": categories,
                  "scope": "ээээ",
                  "status" : "на расмотрении этап 1 из 3",
                  "current": "ээээ",
                  "solution": _controllerCharacteristicTrable.text,
                  "effect": _controllereffect.text,
                  "cost": [
                    {"этап1": "100"},
                    {"этап2": "200"},
                    {"этап3": "300"}
                  ],
                  "stages": [
                    {"этап1": "описание1"},
                    {"этап2": "описание2"},
                    {"этап3": "описание3"}
                  ],
                  "bounty": [

                  ],
                  "makeEconomy": "true"
                });
              }
            },
            child: Text("Далее"),
          )
        ]);
  }
  List <String> listAfter = [
    'Егор пупкин',
  ];

  List <String> nameAfter = [
    'Василий пупкин',
    'Василий непупкин',
    'Василий ине',
  ];

  Widget Filing(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: toFindSemantic
          ? Container(
              padding: EdgeInsets.all(20.0),
              child: Text(" Проверка на уникальность : Совпадений не найденно"),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child: Row(
                    children: [
                      Text('Статус'),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text('черновик'),
                      )
                    ],
                  ),),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child: Row(
                      children: [
                        Text('Создано'),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Text('12/12/12'),
                        )
                      ],
                    ),),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child: Row(
                      children: [
                        Text('Утверждено'),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Text('-'),
                        )
                      ],
                    ),),
                  Container(
                    margin: EdgeInsets.only(top: 5,bottom: 8),
                    child: Text(
                      'Автор',
                    ),
                  ),
                  _After(context),
                  _button(context, buttonText: 'Добавить автора',func: (){
                    return showDialog(
                        context: context,
                        builder: (_) => Container(
                          width: 200,
                          height: 300,
                          child: ListView.builder(
                            itemCount: nameAfter.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TextButton(child: Text(nameAfter[index]),onPressed: (){
                                listAfter.add(nameAfter[index]);
                                setState(() {
                                  _After(context);
                                });
                                Navigator.pop(context);
                              },);
                            },),
                        ));
                  }),
                  _DropDawnList(context),
                  SizedBox(
                    height: 24,
                  ),
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
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  _textField(context,
                      text:
                          'Описание действительного положения с указанием существующих недостатков:',
                      hintText:
                          'Характеристика проблемы, которую решает рационализаторское предложение, должна описывать недостатки'
                          ' действующей конструкции изделия, технологии производства, применяемой техники или состава материала',
                      controller: _controllerCharacteristicTrable,
                      errorText: "Описание не заполненно",
                      valide: valideCharacteristic),
                  _textField(context,
                      controller: _controllereffect,
                      text: 'Ожидаемый положительный эффект от использлования:',
                      hintText:
                          'Указывается информация об ожидаемом техническом, '
                          'организационном, управленческом или ином положительном эффекте от использования.'
                          ' Расчет планируемой эффективности применения рационализаторского предложения готовится'
                          ' согласно Приложению 10 к настоящему Положению и прикладывается к заявлению ',
                      errorText: "Поле не заполненно",
                      valide: valideeffect),
                  Container(
                    height: 40,
                  ),
                  Text('Необходимые затраты на внедрение'),
                  _button(context, buttonText: 'Добавить статью затрат'),
                  SizedBox(
                    height: 24,
                  ),
                  Text('Требуемые сроки на внедрение'),
                  SizedBox(
                    height: 24,
                  ),
                  _button(context, buttonText: 'Добавить срок внедрения'),
                  SizedBox(
                    height: 24,
                  ),
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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listAfter.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [ Container(
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
                  child: Text(listAfter[index]),
                  margin: EdgeInsets.only(left: 15),
                )
              ],
            ),
          )
          ],
        );
    },
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


  Widget _DropDawnList(BuildContext context) {
    return Container(
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
            child: _valueCheck? Icon(Icons.check_box,color: Color(0xFF186FAF),) : Icon(Icons.check_box_outline_blank_sharp,color: Color(0xFF186FAF),)
          ),
          Container(
              margin: EdgeInsets.only(left: 26),
              child: Text(
                'Создающее экономию',
              )),
        ]));
  }
}
