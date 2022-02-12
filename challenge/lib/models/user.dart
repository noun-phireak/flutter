class User {
  int? id;
  String? name;
  String? image;
  String? phone;
  String? token;

  User({this.id, this.name, this.phone, this.token});

  // convert data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'],
        name: json['user']['name'],
        phone: json['user']['phone'],
        token: json['user']['token']);
  }
}
