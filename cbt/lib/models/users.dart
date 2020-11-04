import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  final String name;
  final String surname;
  final String email;

  UserDetails({this.name, this.surname, this.email});

  factory UserDetails.fromDocument(DocumentSnapshot doc) {
    return UserDetails(
      name: doc['name'],
      surname: doc['surname'],
      email: doc['email'],
    );
  }
}
