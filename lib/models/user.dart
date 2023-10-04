import '../user_name.dart';

class user {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final userName name;
  user(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.name});
  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
