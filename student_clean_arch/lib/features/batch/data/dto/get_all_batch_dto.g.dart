// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_batch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBatchDTO _$GetAllBatchDTOFromJson(Map<String, dynamic> json) =>
    GetAllBatchDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => BatchApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBatchDTOToJson(GetAllBatchDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
