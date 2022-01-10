import 'package:crewin_intern_project/service/firebase/cwFirebase.dart';
import 'package:flutter/material.dart';

class CwAddandGiveInfo extends StatelessWidget {
  const CwAddandGiveInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CwFirebase.add(
            collectionName: "user", age: "50", length: "170", weight: "40"),
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
