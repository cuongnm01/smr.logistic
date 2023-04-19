import 'package:json_annotation/json_annotation.dart';
part 'service_type.g.dart';

@JsonSerializable()
class ServiceType {
  int? type;
  String? name;

  ServiceType({this.type, this.name});

  factory ServiceType.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceTypeToJson(this);
}
