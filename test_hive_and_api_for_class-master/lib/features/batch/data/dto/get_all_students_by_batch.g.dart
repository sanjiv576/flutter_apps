// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_students_by_batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllStudentsByBatchDTO _$GetAllStudentsByBatchDTOFromJson(
        Map<String, dynamic> json) =>
    GetAllStudentsByBatchDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AuthApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllStudentsByBatchDTOToJson(
        GetAllStudentsByBatchDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
