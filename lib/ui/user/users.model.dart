import 'package:json_annotation/json_annotation.dart';

part 'users.model.g.dart';

@JsonSerializable()
class User {
  String id;
  String name;
  UserType type;

  User(this.id, this.name, this.type);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

}

enum UserType {
  SENDER, RECEPTOR
}