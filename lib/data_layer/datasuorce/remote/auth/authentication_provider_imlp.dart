//
// import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/auth/authentication_provider.dart';
// import 'package:http/src/response.dart';
//
// class AuthenticationDataProviderImlp implements AuthenticationDataProvider{
//
//
//
//   @override
//   Future<Response> register(data) async {
//     Response res = await apiHelper.postData(data, "/register");
//     return res;
//   }
//
//   @override
//   Future<Response> signIn(data) async {
//     Response res = await apiHelper.postData(data, "/login");
//     return res;
//   }
//
//   @override
//   Future<Response> currentUser() async {
//     Response res = await apiHelper.getDataWithAuth("/currentUser");
//     return res;
//   }
//
//   @override
//   Future<Response> refresh(data) async {
//      Response res = await apiHelper.postData(data,"/refresh");
//     return res;
//   }
//
//   @override
//   Future<Response> logout() async{
//     Response res = await apiHelper.getData("/register");
//     return res;
//   }
//
// }