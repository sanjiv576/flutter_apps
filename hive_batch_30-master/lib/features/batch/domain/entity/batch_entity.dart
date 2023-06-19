class BatchEntity {
  final String? batchId;
  final String batchName;

  BatchEntity({
    this.batchId,
    required this.batchName,
  });

  factory BatchEntity.fromJson(Map<String, dynamic> json) => BatchEntity(
        batchId: json["batchId"],
        batchName: json["batchName"],
      );
}
