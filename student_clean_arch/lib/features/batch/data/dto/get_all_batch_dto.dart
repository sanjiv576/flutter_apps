import 'package:json_annotation/json_annotation.dart';
import 'package:student_clean_arch/features/batch/data/model/batch_api_model.dart';
// command: dart run build_runner build --delete-conflicting-outputs
part 'get_all_batch_dto.g.dart';
@JsonSerializable()
class GetAllBatchDTO {
  // same names i.e success, count, and data , as send in response from API
  final bool success;
  final int count;
  final List<BatchApiModel> data;

  GetAllBatchDTO(
      {required this.success, required this.count, required this.data});

  // fromJson
  factory GetAllBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllBatchDTOFromJson(json);

  //  toJson
  Map<String, dynamic> toJson() => _$GetAllBatchDTOToJson(this);
}
