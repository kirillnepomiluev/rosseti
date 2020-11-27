import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class FillingForm extends StatefulWidget {
  @override
  _FillingFormState createState() => _FillingFormState();
}

class _FillingFormState extends State<FillingForm> {

  String categories = '';
  List <String> categoriesList = [
    'АААААА',
    'ИИИИИИ',
    'ВВВВВВ',
  ];
  TextEditingController _controllerNameTrable = TextEditingController();
  TextEditingController _controllerCharacteristicTrable = TextEditingController();

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
            Text('Автор'),
            After(context),
            button(context),
            DropDawnList(context),
            textField(context,hintText: 'Введите название кратко и по сути предложения',controller: _controllerNameTrable),
            textField(context,text: 'Описание действительного положения с указанием существующих недостатков:',
                hintText: 'Характеристика проблемы, которую решает рационализаторское предложение, должна описывать недостатки'
                    ' действующей конструкции изделия, технологии производства, применяемой техники или состава материала',controller: _controllerCharacteristicTrable),
          ],
        ),
      ),
    );
  }

  Widget After(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10,top: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100)
                ),
                  height: 35,
                  width: 35,
                  child: Image.asset('assets/imageee.png',fit: BoxFit.fill,)
              ),
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

  Widget button(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: (){},
        child: Row(
          children: [
            Icon(Icons.add,size: 35,),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text('Добавить автора'),
            )
          ],
        ),
      ),
    );
  }

  Widget DropDawnList (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey,width: 1)
      ),
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
          hint: Text(categories==""? 'Выберите категорию' : categoriesList,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "OpenSansReg",
                  fontSize: 13,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
              )),

          items: categoriesList.map<DropdownMenuItem<String>>(
                  (String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child:  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      item,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: "OpenSansReg",
                          fontSize: 13,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold
                      ),
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

  Widget textField (BuildContext context,{String hintText = '',String text = '',TextEditingController controller}){
    return Column(
      children: [
        Text(text),
        TextFormField(controller: controller,decoration: InputDecoration(hintText: hintText,hintMaxLines: 8),),
      ],
    );
  }
}
