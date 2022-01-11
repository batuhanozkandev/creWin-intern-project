import 'package:crewin_intern_project/service/firebase/cwFirebase.dart';
import 'package:crewin_intern_project/service/sharedPreferences/sharedPreferences.dart';
import 'package:flutter/material.dart';

class CwAddandGiveInfo extends StatelessWidget {
  const CwAddandGiveInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
        future: CwFirebase.add(
            collectionName: "user",
            userEmail: CwSharedPreferences.getString(key: "userEmail"),
            userName: CwSharedPreferences.getString(key: "userName"),
            age: CwSharedPreferences.getInt(key: "age"),
            length: CwSharedPreferences.getInt(key: "length"),
            weight: CwSharedPreferences.getInt(key: "weight"),),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return Text("Data have been added!");
          }
        });
  }
}
