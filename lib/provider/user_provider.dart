import 'package:classwork/model/user.dart';
import 'package:classwork/repository/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
Future<List<User>> user(UserRef ref) async {
  List<User> userList = await ApiClient().getUser();
  return userList;
}
