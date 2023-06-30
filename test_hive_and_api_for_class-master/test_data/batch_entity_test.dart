import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';

Future<List<BatchEntity>> getBatchListTest() async {
  final response =
      await rootBundle.loadString('test_data/batch_test_data.json');
  final jsonList = await json.decode(response);
  final List<BatchEntity> batchList = jsonList
      .map<BatchEntity>(
        (json) => BatchEntity.fromJson(json),
      )
      .toList();

  return Future.value(batchList);
}


