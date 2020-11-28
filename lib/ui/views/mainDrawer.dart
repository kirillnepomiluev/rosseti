
import 'package:flutter/material.dart';

class mainDrawer extends StatefulWidget {
  mainDrawer({Key key, this.index}) : super(key: key);

  int index;



  @override
  State<StatefulWidget> createState() => _mainDrawerState(index);
}

class _mainDrawerState extends State<mainDrawer> with  AutomaticKeepAliveClientMixin<mainDrawer> {

  int index = 0;
  String url;

  Map _photos;

  _mainDrawerState(int index) {
    this.index = index;
  }


  ListTile buildListTile(BuildContext context,
      {indexnumber = 0, direction = '/', IconData mIcon, title = "Главная"}) {
    bool selected = index == indexnumber ? true : false;
    Color _iconColor = selected
        ? Theme.of(context).textTheme.headline3.color
        : Theme.of(context).textTheme.headline4.color;
    TextStyle _textStyle = selected
        ? Theme.of(context).textTheme.headline3
        : Theme.of(context).textTheme.headline4;

    return ListTile(
      selected: selected,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Icon(
                  mIcon,
                  color: _iconColor,
                )),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Text(
                  title,
                  style: _textStyle,
                ),
              ),
            )
          ]),
      onTap: () {
        Navigator.pushNamed(context, direction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child:  Text('Загрузка...')
          ),
          Expanded(flex: 8 ,child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              buildListTile(context,
                  title: "Главная",
                  direction: "/",
                  mIcon: Icons.add,
                  indexnumber: 0),
              buildListTile(context,
                  title: "Мои заявки",
                  direction: "/shop",
                  mIcon: Icons.shopping_cart,
                  indexnumber: 1),
              buildListTile(context,
                  title: "Обсуждения",
                  direction: "/partnerpromotions",
                  mIcon: Icons.messenger,
                  indexnumber: 2),
              buildListTile(context,
                  title: "Уведомления",
                  direction: "/notifications",
                  mIcon: Icons.notification_important,
                  indexnumber: 3),
              buildListTile(context,
                  title: "Аккаунт",
                  direction: "/account",
                  mIcon: Icons.account_circle,
                  indexnumber: 4),
            ],
          ),),
        ],
      ),
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


}
