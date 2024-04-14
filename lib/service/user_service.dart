
import 'package:classwork/model/company.dart';
import 'package:classwork/model/user.dart';
import 'package:dio/dio.dart';


class UserService {
  final dio = Dio();

  Future<List<User>> getAllUsers() async {
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final json = response.data as List;

      //map returns an item on each iteration
      final users = json.map((e) {
        return User(
            id: e['id'],
            name: e['name'],
            username: e['username'],
            email: e['email'],
            company: Company(
              name: e['company']['name'],
              catchphrase: e['company']['catchPhrase'],
              bs: e['company']['bs']
            ));
      }).toList();

      return users;
    }
    return [];
  }
}