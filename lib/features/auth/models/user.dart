// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String uid;
  final String email;
  final String password;
  final String country;
  UserModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.password,
    required this.country,
  });

  UserModel copyWith({
    String? name,
    String? uid,
    String? email,
    String? password,
    String? country,
  }) {
    return UserModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'email': email,
      'password': password,
      'country': country,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, uid: $uid, email: $email, password: $password, country: $country)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.uid == uid &&
        other.email == email &&
        other.password == password &&
        other.country == country;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        uid.hashCode ^
        email.hashCode ^
        password.hashCode ^
        country.hashCode;
  }
}
