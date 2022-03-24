class HttpConstants {
  HttpConstants({this.authorizationValue});

  static const String contentType = 'Content-Type';
  static const String authorization = 'Authorization';
  static const String jsonContentType = 'application/json';
  static const String accept = "Accept";
  String? authorizationValue;

  get getAuthValue => authorizationValue;

  void setAuthorizationValue(String value) {
    authorizationValue = value;
  }
}