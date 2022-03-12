import 'package:flutter_ecomerce_ui/domain/entities/auth_token.dart';

class AuthenticationToken extends AuthToken {
  // final String tokenType;
  // final int expiresIn;
  // final String accessToken;
  // final String refreshToken;

  AuthenticationToken(
      {required String tokenType,
      required int expiresIn,
      required String accessToken,
      required String refreshToken})
      : super(tokenType: tokenType,expiresIn: expiresIn, accessToken:accessToken, refreshToken:refreshToken);

  factory AuthenticationToken.fromJson(Map<String, dynamic> json) {
    return AuthenticationToken(
        tokenType: json['token_type'],
        expiresIn: json['expires_in'],
        accessToken: json['access_token'],
        refreshToken: json['refresh_token']);
  }
}
