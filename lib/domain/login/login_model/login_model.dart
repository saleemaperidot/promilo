import 'package:json_annotation/json_annotation.dart';

import 'response.dart';
import 'status.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  Status? status;
  Response? response;

  LoginModel({this.status, this.response});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
