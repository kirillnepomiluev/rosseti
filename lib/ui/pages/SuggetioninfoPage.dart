import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/widgets/MyScaffold.dart';

class Suggetioninfo extends StatefulWidget {
   String suggetionId;
   Suggetioninfo ({this.suggetionId});
  @override
  _SuggetioninfoState createState() => _SuggetioninfoState();
}

class _SuggetioninfoState extends State<Suggetioninfo> {
  @override
  Widget build(BuildContext context) {

      if (kIsWeb) {
        return  buildBody();
      }
      return buildMyScaffold(context, buildBody (), "Информация о  предложении");

  }
  Widget buildBody () {
    return Container(child:  widget.suggetionId == null?   Container(child: Text("Предложение не выбранно")
    )
        :
    StreamBuilder(
      stream: store.collection("suggestions").doc(widget.suggetionId).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          DocumentSnapshot documentSnapshot = snapshot.data;
          Map<String, dynamic> data =          documentSnapshot.data();

          return Container(padding: EdgeInsets.all(24), child: ListView(
            shrinkWrap: true,
            children: [
            Container( padding:  EdgeInsets.all(20), child: Text(data["name"].toString() ),),


          ],) , );


        } else if (snapshot.hasError) {
          return Container (child: Text("Ошибка"),);

        }
        return Container(child: CircularProgressIndicator(), );
      },)
    );
  }

}