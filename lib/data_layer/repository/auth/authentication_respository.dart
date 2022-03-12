// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/auth/authentication_provider_imlp.dart';
// import 'package:flutter_ecomerce_ui/data_layer/models/authentication_token.dart';
// import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
//
// import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_states.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart';
//
//
//
//
// class AuthenticationRepository {
//   final AuthenticationDataProviderImlp _authProvider =
//       AuthenticationDataProviderImlp();
//   final FlutterSecureStorage _storage = const FlutterSecureStorage();
//   final _controller = StreamController<AuthenticationStatus>();
//
//   Stream<AuthenticationStatus> get status async* {
//      bool hasToken = await hasAccessToken();print(hasToken.toString());
//      if(hasToken) {
//       yield AuthenticationStatus.authenticated;
//      }
//      else {
//        yield AuthenticationStatus.unauthenticated;
//     }
//     yield* _controller.stream;
//   }
//
//   set addEventAuthStream(AuthenticationStatus status) => _controller.add(status);
//
//   ///////
//   Future<Response> logIn({required data}) async {
//     Response res = await _authProvider.signIn(data);
//     if(res.statusCode == 200 ) {
//       AuthenticationToken authenticationToken = AuthenticationToken.fromJson(json.decode(res.body));
//       storeToken(authenticationToken.accessToken!, authenticationToken.refreshToken!);
//       // TODO: do something
//       _controller.add(AuthenticationStatus.authenticated);
//     }
//     else {
//
//     }
//     return res;
//   }
//   Future<void> register({required data}) async {
//     try {
//       Response res = await _authProvider.signIn(data);
//
//     } catch (e) {}
//   }
//
//   Future<void> logout() async {
//     try {
//       Response res = await _authProvider.logout();
//     } catch (e) {}
//   }
//
//
//   Future<User?> getCurrentUser() async {
//     User? user;
//     try {
//       await _authProvider.currentUser().then((value) {
//         user = User.fromJson(json.decode(value.body));
//       });
//     }
//     catch (_){}
//
//     return user ?? User.empty;
//
//   }
//   void storeToken(String accessToken, refreshToken) async{
//     await _storage.write(key: 'accessToken', value: accessToken);
//     await _storage.write(key: 'refreshToken', value: refreshToken);
//   }
//
//   Future<String> getRefreshToken() async {
//     String? value = await _storage.read(key: "refreshToken");
//     return value??"";
//   }
//
//   Future<bool> hasAccessToken() async {
//     String? value = await _storage.read(key: "refreshToken");
//
//     if (value == null || value =='') {
//       return false;
//     }
//     else {
//       return true;
//     }
//   }
//
// }
