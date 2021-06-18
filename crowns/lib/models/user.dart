class User {
  String? token;

  User({
    this.token = '',
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      token: responseData['token'],
    );
  }
}
