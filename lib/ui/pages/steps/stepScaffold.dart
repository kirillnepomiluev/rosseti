import 'package:flutter/foundation.dart';
import 'package:rosseti/ui/views/mainDrawer.dart';
import 'package:flutter/material.dart';

// import 'ui/views/BottobBanner.dart';

Scaffold buildMyScaffold2(BuildContext context, Widget body, String title,
    {int bottomItemIndex = 0, bool isAppbar = true, int indexdrawer = 0, bool isNeedDrawer = true,
      bool isNeedBottomMenu = true, bool isNeedBottomBar = false,
      List<Widget> actions,String text1 = '',String text2 = '',String routName1 = '',String routName2 = '',
      bool twoButton = true,BottomNavigationBar botBar,
    }) {
  if (kIsWeb) {
    isNeedBottomMenu = false;
    isNeedDrawer = false;
  }
  return Scaffold(

      appBar: isAppbar
          ? AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(title, style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
        actions: actions,
      )
          : null,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: isNeedDrawer ?  mainDrawer(index: indexdrawer) : null,
      body: body,
      bottomNavigationBar:
      !isNeedBottomMenu? null : Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[ botBar
          // isNeedBottomBar?  SizedBox(
          //    width: MediaQuery.of(context).size.width * 1,
          //    height: 50.0,
          //    child: BottomBanner("mainbottombaner"),
          //  ) :  Container(),
          // BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     iconSize: 26,
          //     unselectedItemColor:
          //     Theme.of(context).tabBarTheme.unselectedLabelColor,
          //     selectedItemColor: Theme.of(context).tabBarTheme.labelColor,
          //     selectedLabelStyle: Theme.of(context).tabBarTheme.labelStyle,
          //     unselectedLabelStyle:
          //     Theme.of(context).tabBarTheme.unselectedLabelStyle,
          //     showUnselectedLabels: true,
          //     items:  twoButton ? <BottomNavigationBarItem>[
          //
          //       BottomNavigationBarItem(
          //         icon: Container(
          //             height: 18,
          //             width: 18,
          //             child: Icon(Icons.arrow_back)),
          //         title: Text(text1),
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Container(
          //             height: 18,
          //             width: 18,
          //             child: Icon(Icons.arrow_forward)),
          //         title: Text(text2),
          //       ),
          //     ] :
          //     <BottomNavigationBarItem>[
          //
          //       BottomNavigationBarItem(
          //         icon: Container(
          //             height: 18,
          //             width: 18,
          //             child: Icon(Icons.arrow_back)),
          //         title: Text(text1),
          //       ),
          //     ],
          //     currentIndex: bottomItemIndex,
          //     onTap:  (int index) {
          //       String _routeName;
          //       switch (index) {
          //         case 0:
          //           _routeName = routName1 ;
          //           break;
          //         case 1:
          //           _routeName = routName2;
          //           break;
          //
          //       }
          //       Navigator.pushNamed(context, _routeName);
          //     }),
        ],
      ) //
  );
}
