import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crewin_intern_project/view/authantication/signInPage/signInPage.dart';

class CwFirebase {
  static Future<void> add(
      {String? collectionName,
      String? userName,
      String? userEmail,
      int? age,
      int? length,
      int? weight}) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionName ?? '');

    return reference
        .add({
          'User Name': userName ?? "",
          'User Email': userEmail ?? "",
          'Age': age ?? "",
          'Length': length ?? "",
          'Weight': weight ?? ""
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> addWithDocName(
      {String? collectionName,
      required String docDame,
      String? age,
      String? length,
      String? weight}) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionName ?? '');

    return reference
        .doc(docDame)
        .set({'age': age ?? "", 'length': length ?? "", 'weight': weight ?? ""})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> get({
    required String collectionName,
    required String field,
  }) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionName);

    return reference.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        return doc[field];
      });
    });
  }

  static Future<void> update({
    required String collectionName,
    required String docDame,
    required String what,
    required Object toWhat,
  }) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionName);

    return reference
        .doc(docDame)
        .update({what: toWhat})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  static Future<void> delete({
    required String collectionName,
    required String docDame,
  }) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection(collectionName);

    return reference
        .doc(docDame)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
