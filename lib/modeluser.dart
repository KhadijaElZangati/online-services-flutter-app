import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
     required this.email,
  });
}