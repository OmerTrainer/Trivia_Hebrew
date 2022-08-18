import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class User {
  final String name;
  final String f_id;
  final String email;
  User({required this.name, required this.f_id, required this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromString(String string) => User(
        name: string.split(' ')[0],
        f_id: string.split(' ')[4],
        email: string.split(' ')[4],
      );

  @override
  String toString() => "$name $f_id $email";
}
