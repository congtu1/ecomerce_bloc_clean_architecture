class HttpConstants {

  HttpConstants({this.authorizationValue}) {
    authorizationValue = "";
  }
  static const String contentType = 'Content-Type';
  static const String authorization = 'Authorization';
  static const String jsonContentType = 'application/json';
  static const String accept =  "Accept";
  String? authorizationValue;

  set setAuthValue(String? value) => authorizationValue = value ?? "";
  get getAuthValue => authorizationValue;

}