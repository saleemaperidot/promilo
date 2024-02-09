import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable()
class Status {
  int? code;
  dynamic message;

  Status({this.code, this.message});

  factory Status.fromJson(Map<String, dynamic> json) {
    return _$StatusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
