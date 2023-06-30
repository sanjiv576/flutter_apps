// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchStudentModel _$BatchStudentModelFromJson(Map<String, dynamic> json) =>
    BatchStudentModel(
      studentId: json['_id'] as String?,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      image: json['image'] as String,
      username: json['username'] as String,
      batch: BatchApiModel.fromJson(json['batch'] as Map<String, dynamic>),
      course: (json['course'] as List<dynamic>)
          .map((e) => CourseApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchStudentModelToJson(BatchStudentModel instance) =>
    <String, dynamic>{
      '_id': instance.studentId,
      'fname': instance.fname,
      'lname': instance.lname,
      'image': instance.image,
      'username': instance.username,
      'batch': instance.batch,
      'course': instance.course,
    };
