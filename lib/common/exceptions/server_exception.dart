
class ServerException implements Exception {
   String code;
   String? message;

  ServerException({required this.message, required this.code});
}