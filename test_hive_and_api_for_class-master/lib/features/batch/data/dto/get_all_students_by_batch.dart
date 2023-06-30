import 'package:hive_and_api_for_class/features/auth/data/model/auth_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/batch_student_model.dart';

part 'get_all_students_by_batch.g.dart';

@JsonSerializable()
class GetAllStudentsByBatchDTO {
  final bool success;
  final String message;
  final List<AuthApiModel> data;

  GetAllStudentsByBatchDTO({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetAllStudentsByBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllStudentsByBatchDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllStudentsByBatchDTOToJson(this);
}
