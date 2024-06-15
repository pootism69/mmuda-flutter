class users {
  int? id;
  String? name;
  String? email;
  String? password;
  String? token;

  users({
    this.id,
    this.name,
    this.email,
    this.password,
    this.token,
  });

//convert json

  factory users.fromJson(Map<String, dynamic> json) {
    return users(
        id: json['user']['id'],
        name: json['user']['name'],
        email: json['user']['email'],
        password: json['user']['password'],
        token: json['token']);
  }
}
