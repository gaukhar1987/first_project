import 'package:json_annotation/json_annotation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey (name: 'email_name')
  final String? email;
  @JsonKey (name: 'nickname_name')
  final String? nickname;

  UserModel({
    required this.email,
    required this.nickname,
  });

   factory UserModel.fromJson(Map<String, dynamic> json) =>_$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}