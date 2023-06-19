// For API connection : Step 5

import 'package:json_annotation/json_annotation.dart';

import '../model/batch_api_model.dart';
part 'get_all_batch_dto.g.dart';
// this dto class for whole JSON object not only specific data part
@JsonSerializable()
class GetAllBatchDTO {
  // same names i.e success, count, and data , as send in response from API
  final bool success;
  final int count;
  final List<BatchApiModel> data;

  GetAllBatchDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  // fromJson
  factory GetAllBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllBatchDTOFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$GetAllBatchDTOToJson(this);
}
