class User {
  int? id;
  String? name;
  String? username;

  User({required this.id, required this.name, required this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }
}
