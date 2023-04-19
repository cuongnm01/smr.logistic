import 'package:json_annotation/json_annotation.dart';
part 'fee.g.dart';

@JsonSerializable()
class Fee {
  double? totalTemporaryPrice;

  Fee({
    this.totalTemporaryPrice,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => _$FeeFromJson(json);

  Map<String, dynamic> toJson() => _$FeeToJson(this);
}
