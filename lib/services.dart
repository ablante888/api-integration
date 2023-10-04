import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/user.dart';
import '../user_name.dart';

class UserApi {
  static Future<List<user>> FetchUsers() async {
    print('fetch users called');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;

    final users = result.map((e) {
      final name = userName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      print(name);
      return user(
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat'],
          name: name);
    }).toList();
    return users;
    print(json);
  }
}
