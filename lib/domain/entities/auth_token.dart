class AuthToken {
  String? tokenType;
   int? expiresIn;
   String? accessToken;
   String? refreshToken;

  AuthToken({this.tokenType,this.expiresIn,this.accessToken,this.refreshToken});
}