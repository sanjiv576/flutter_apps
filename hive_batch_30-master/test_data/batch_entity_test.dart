import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';

// Step auth_unit test 1
// BatchEntity is used here because data is returned from Usecase instead of Model which only has Entity 
Future<List<BatchEntity>> getBatchListTest() async {

  // read the data i.e Batch from the JSON file
  final response =
      await rootBundle.loadString('test_data/batch_test_data.json');

      // decode the JSON object
  final jsonList = await json.decode(response);

  // get each decoded JSON of Batch object and convert/add into BatchEntity List
  final List<BatchEntity> batchList = jsonList
      .map<BatchEntity>(
        (json) => BatchEntity.fromJson(json),
      )
      .toList();

  return Future.value(batchList);
}


