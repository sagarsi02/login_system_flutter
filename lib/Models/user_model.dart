import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {

    String name;
    String username;
    String city;
    String email;
    String password;
    String cPassword;

    UserModel({
        required this.name,
        required this.username,
        required this.city,
        required this.email,
        required this.password,
        required this.cPassword,
    });



    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        username: json["username"],
        city: json["city"],
        email: json["email"],
        password: json["password"],
        cPassword: json["c_password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "city": city,
        "email": email,
        "password": password,
        "c_password": cPassword,
    };
}
