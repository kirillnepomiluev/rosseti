
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

void addNewDoc(
    BuildContext context, String collectionPath, Map<String, Object> data,
    {whenDone(), String id}) {
  showProgress(context);

  if (id == null) {
    store.collection(collectionPath).add(data).then((value) {
      showDialogDB(context, text: "Сохранено успешно", whenDone: whenDone );
    });
  } else {
    store.collection(collectionPath).doc(id).set(data).then((value) {
      showDialogDB(context, text: "Сохранено успешно", whenDone: whenDone );
    });
  }
}

void updateDoc(
    BuildContext context,  Map<String, Object> data,
    { String collection , String doc ,whenDone()}) {
  showProgress(context);

  store.collection(collection).doc(doc).update(data).then((value) {
    showDialogDB(context, text: "Обновлено успешно", whenDone: whenDone );
  });
}

void deleteDoc(
    BuildContext context, String docPath, Map<String, Object> data,
    {whenDone(), bool showMessage = true}) {
  showProgress(context);
  data["timeAtArhive"] = "${DateTime.now().millisecondsSinceEpoch}";
  var batch = store.batch();
  batch.delete(store.doc(docPath));
  batch.set(store.doc("archive" +docPath),data);
  batch.commit().then((value) {
    if (showMessage)
    showDialogDB(context, text: "Успешно удалено в архив", whenDone: whenDone );
  });
}

  showDialogDB (BuildContext context, {String text, Function() whenDone}) {
    Navigator.pop(context);
    showDialog(
         context: context,
        builder: (BuildContext context) {
          return RaisedButton(
            onPressed: () {
              Navigator.pop(context);
              whenDone();
            } ,
            child: Center(
              child: Text(text),
            ),
          );
        });
 }
 showProgress(BuildContext context) {
   showDialog(
       context: context,
       builder: (BuildContext context) {
         return Center(
           child: CircularProgressIndicator(),
         );
       });
 }