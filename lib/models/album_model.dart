class Albums {
  final int userID;
  final int id;
  final String title;

  const Albums({
    required this.userID,
    required this.id,
    required this.title,
  });

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
      userID: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
