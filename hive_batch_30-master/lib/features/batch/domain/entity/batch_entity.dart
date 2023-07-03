import 'package:equatable/equatable.dart';

class BatchEntity extends Equatable {
  final String? batchId;
  final String batchName;

  const BatchEntity({
    this.batchId,
    required this.batchName,
  });

  factory BatchEntity.fromJson(Map<String, dynamic> json) => BatchEntity(
        batchId: json["batchId"] as String?,
        batchName: json["batchName"] as String,
      );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
