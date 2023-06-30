import 'package:json_annotation/json_annotation.dart';
import 'package:student_clean_arch/features/course/data/model/course_api_model.dart';

part 'get_all_course_dto.g.dart';

@JsonSerializable()
class GetAllCourseDTO {
  final bool success;
  final int count;
  final List<CourseApiModel> data;

  GetAllCourseDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  // fromJson
  factory GetAllCourseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllCourseDTOFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$GetAllCourseDTOToJson(this);
}
