class User {
  String token;
  int id;

  User({required this.token, required this.id});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      token: responseData['token'],
      id: responseData['id_user'],
    );
  }
}
