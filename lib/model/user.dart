import 'package:classwork/model/company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,      
    required this.email,
    required this.company
  });
}
