// For API connection : Step 1
class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  //static const String baseUrl = "http://localhost:3000/api/v1/"; // for ios
  // static const String baseUrl = "http://10.0.2.2:3000/api/v1/"; // for android
  static const String baseUrl = "http://192.168.1.64:3000/api/v1/"; // for android --> ip address win
  // static const String baseUrl =
  //     "http://192.168.4.4:3000/api/v1/"; // ip address

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String getAllStudent = "auth/getAllStudents";
  static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  static const String updateStudent = "auth/updateStudent/";
  static const String deleteStudent = "auth/deleteStudent/";
  static const String uploadImage = "auth/uploadImage";

  // ====================== Batch Routes ======================
  static const String createBatch = "batch/createBatch";
  static const String getAllBatch = "batch/getAllBatches";

  // ====================== Course Routes ======================
  static const String createCourse = "course/createCourse";
  static const String getAllCourse = "course/getAllCourse";
}
