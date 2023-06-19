// For API connection : Step 4

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/batch_entity.dart';

part 'batch_api_model.g.dart';

final batchApiModelProvider = Provider((ref) => BatchApiModel.empty());

@JsonSerializable() // used for mapping _id (in API) and batchId (in Dart)
// this class only for _id and batchName object that come from API 'data'
class BatchApiModel {
  @JsonKey(name: '_id') // mapping here, automatically _id maps with batchId
  final String? batchId;
  final String batchName;

  BatchApiModel({required this.batchId, required this.batchName});

  // for empty or initial values
  BatchApiModel.empty() : this(batchId: '', batchName: '');

  // below copied and pasted from batch_hive_model

  // Convert Hive Object to Entity
  BatchEntity toEntity() => BatchEntity(
        batchId: batchId,
        batchName: batchName,
      );

// changed hiveModel name from BatchHiveModel to BatchApiModel
  // Convert Entity to Hive Object
  BatchApiModel toHiveModel(BatchEntity entity) => BatchApiModel(
        // uncommented this because _id comes from API which required here
        batchId: entity.batchId,
        batchName: entity.batchName,
      );

  // Convert Hive List to Entity List
  List<BatchEntity> toEntityList(List<BatchApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  // toJson ==> conversion the data that send to API

// NOte:
// BatchApiModelToJson will be generated using build_runner library
// all data like fullName, courses, batch will be stored in _$BatchApiModelToJson
  Map<String, dynamic> toJson() => _$BatchApiModelToJson(this);

  // fromJson ==> conversion the data that come from API

  factory BatchApiModel.fromJson(Map<String, dynamic> json) =>
      _$BatchApiModelFromJson(json);

  @override
  String toString() {
    return 'batchId: $batchId, batchName: $batchName';
  }
}
