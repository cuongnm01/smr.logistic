import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/master_data/service_type.dart';

part 'service_type_response.g.dart';

@JsonSerializable()
class ServiceTypeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ServiceType>? data;

  ServiceTypeResponse(this.data);

  factory ServiceTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceTypeResponseToJson(this);
}
