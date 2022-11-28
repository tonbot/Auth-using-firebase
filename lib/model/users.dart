import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  void addUser() {
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };

// Add a new document with a generated ID

    db
        .collection("user")
        .doc("BJ")
        .set(user)
        .onError((e, _) => print("Error writing document: $e"));

    db.collection("user").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
