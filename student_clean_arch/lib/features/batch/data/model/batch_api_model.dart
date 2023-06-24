import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/batch_entity.dart';

// part ==> always after import
// termainal command to generate files : dart run build_runner build --delete-conflicting-outputs
part 'batch_api_model.g.dart';

@JsonSerializable() // for mapping _id (from API) and batchId (in Dart)
// this class only for _id and batchName object that come from API 'data'

class BatchApiModel {
  // mapping _id and batchId
  @JsonKey(name: '_id')
  final String? batchId;
  final String batchName;

  BatchApiModel({required this.batchId, required this.batchName});

  // fromJson  ==> data come from API
  factory BatchApiModel.fromJson(Map<String, dynamic> json) =>
      _$BatchApiModelFromJson(json);
  // toJson ==> data send to API
// BatchApiModelToJson will be generated using build_runner library
// all data like fullName, courses, batch will be stored in _$BatchApiModelToJson
  Map<String, dynamic> toJson() => _$BatchApiModelToJson(this);

// copied and pasted from batch_hive_model

  // convert Hive Object to Entity ==> passing data from Model to Entity
  BatchEntity toEntity() => BatchEntity(batchId: batchId, batchName: batchName);

  // convert Entity to Hive Object  ==> passing data from Entity to Model , where batchId is not sent there
  BatchApiModel toHiveModel(BatchEntity entity) => BatchApiModel(
        batchId: entity.batchId,
        batchName: batchName,
      );

  // convert Hive List to Entity List
  List<BatchEntity> toEntityList(List<BatchApiModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
