import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'token_type')
  String? tokenType;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  @JsonKey(name: 'expires_in')
  int? expiresIn;
  String? scope;
  @JsonKey(name: 'user_role')
  List<dynamic>? userRole;
  @JsonKey(name: 'tenant_name')
  String? tenantName;
  @JsonKey(name: 'user_type')
  String? userType;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'user_name')
  String? userName;

  Response({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.userRole,
    this.tenantName,
    this.userType,
    this.userId,
    this.userName,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return _$ResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
