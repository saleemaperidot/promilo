// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      refreshToken: json['refresh_token'] as String?,
      expiresIn: json['expires_in'] as int?,
      scope: json['scope'] as String?,
      userRole: json['user_role'] as List<dynamic>?,
      tenantName: json['tenant_name'] as String?,
      userType: json['user_type'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
      'user_role': instance.userRole,
      'tenant_name': instance.tenantName,
      'user_type': instance.userType,
      'user_id': instance.userId,
      'user_name': instance.userName,
    };
