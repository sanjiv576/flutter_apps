class StudentResult {
  final double flutterMarks;
  final double apiMarks;
  final double designMarks;
  final double individualProMarks;

  StudentResult({
    required this.flutterMarks,
    required this.apiMarks,
    required this.designMarks,
    required this.individualProMarks,
  });

  double totalMarks() =>
      flutterMarks + apiMarks + designMarks + individualProMarks;

  String resultStatus() => apiMarks < 40 ||
          flutterMarks < 40 ||
          designMarks < 40 ||
          individualProMarks < 40
      ? 'Fail'
      : 'Pass';

  String division() {
    final double scoredPercentage = totalMarks() / 400;

    if (scoredPercentage >= 60) {
      return 'First';
    } else if (scoredPercentage >= 50) {
      return 'Second';
    } else if (scoredPercentage >= 40) {
      return 'Third';
    } else {
      return 'Fail';
    }
  }
}
