// import 'package:flutter/material.dart';
// import 'package:flutter_ecomerce_ui/cus_size.dart';
//
// class SignInScreen extends StatefulWidget {
//   SignInScreen({Key? key}) : super(key: key);
//
//   static String routeName = "/sign_in";
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//
//
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   final _formKey = GlobalKey<FormState>();
//
//   late String email;
//   late String password;
//
//   bool remember = false;
//   bool isLoading = false;
//
//   final List<String> errors = [];
//
//   void addError({required String error}) {
//     if (!errors.contains(error)) {
//       setState(() {
//         errors.add(error);
//       });
//     }
//   }
//
//   void removeError({required String error}) {
//     if (errors.contains(error)) {
//       setState(() {
//         errors.remove(error);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     CustomSize().init(context);
//     return Scaffold(
//       key: _scaffoldKey,
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//
//         child: Form(
//           key: _formKey,
//           child: SafeArea(
//             child: SizedBox(
//               width: CustomSize.screenWidth,
//               height: CustomSize.screenHeight,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 0.0,
//                     child: ClipPath(
//                       clipper: TriangleClipper(),
//                       child: Image.asset(
//                         "assets/images/Pattern.png",
//                         width: CustomSize.screenWidth,
//                         height: CustomSize.screenHeight,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 0.0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Image.asset("assets/images/Logo.png"),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Text(
//                           "Login To Your Account",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: getProportionateScreenWidth(20)),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         SizedBox(
//                           height: 57,
//                           width: CustomSize.screenWidth,
//                           child: buildEmailField(),
//                         ),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         SizedBox(
//                           height: 57,
//                           width: CustomSize.screenWidth,
//                           child: buildPasswordField(),
//                         ),
//                         //FormError(errors: errors),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           "Or Continue With",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         SizedBox(
//                           height: 60,
//                           width: CustomSize.screenWidth,
//                           child: Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: getProportionateScreenWidth(25)),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     margin: EdgeInsets.only(
//                                         right: getProportionateScreenWidth(21 / 2)),
//                                     decoration: lightBoxWithBorde r,
//                                     child: Center(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: const [
//                                           Icon(
//                                             FontAwesomeIcons.facebook,
//                                             color: Colors.blue,
//                                           ),
//                                           Text("Facebook")
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     margin: EdgeInsets.only(
//                                         left: getProportionateScreenWidth(21 / 2)),
//                                     decoration: lightBoxWithBorder,
//                                     child: Center(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Icon(
//                                             FontAwesomeIcons.google,
//                                             color: Colors.red.shade500,
//                                           ),
//                                           const Text("Google")
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 // Expanded(child: )
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(20),
//                         ),
//                         const Text(
//                           "Forgot Your Password?",
//                           style: TextStyle(
//                               color: Color(0xFF53E88B),
//                               decoration: TextDecoration.underline),
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(20),
//                         ),
//                         DefaultButton(
//                           text: "Login",
//                           press: () {
//                             presentation.login();
//                           },
//                           height: getProportionateScreenHeight(57),
//                           width: getProportionateScreenWidth(141),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Container buildPasswordField() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
//       decoration: lightBoxWithBorder,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: TextFormField(
//           decoration: InputDecoration(
//               hintText: "Password",
//               hintStyle: TextStyle(color: Colors.black12),
//               border: InputBorder.none),
//           obscureText: true,
//           onSaved: (newValue) => password = newValue!,
//           onChanged: (value) {
//             if (value.isNotEmpty) {
//               removeError(error: kPassNullError);
//             } else if (value.length >= 8) {
//               removeError(error: kShortPassError);
//             }
//             return;
//           },
//           validator: (value) {
//             if (value!.isEmpty) {
//               addError(error: kPassNullError);
//               return null;
//             } else if (value.length < 8) {
//               addError(error: kShortPassError);
//               return null;
//             }
//             return null;
//           },
//         ),
//       ),
//     );
//   }
//
//   Container buildEmailField() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
//       decoration: lightBoxWithBorder,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: TextFormField(
//           decoration: const InputDecoration(
//               hintText: "Email",
//               hintStyle: TextStyle(color: Colors.black12),
//               border: InputBorder.none),
//           keyboardType: TextInputType.emailAddress,
//           onChanged: (value) {
//             if (value.isNotEmpty) {
//               removeError(error: kEmailNullError);
//             } else if (emailValidatorRegExp.hasMatch(value)) {
//               removeError(error: kInvalidEmailError);
//             }
//             return;
//           },
//           onSaved: (newValue) => email = newValue!,
//           validator: (value) {
//             if (value!.isEmpty) {
//               addError(error: kEmailNullError);
//               return null;
//             } else if (!emailValidatorRegExp.hasMatch(value)) {
//               addError(error: kInvalidEmailError);
//               return null;
//             }
//             return null;
//           },
//         ),
//       ),
//     );
//   }
//   dynamic presentation.login() {
//                   if (_formKey.currentState!.validate() && errors.isEmpty == true) {
//                 _formKey.currentState!.save();
//                 KeyboardUtil.hideKeyboard(context);
//                 var data = {'email': email, 'password': password};
//                 userService.presentation.login(data).then((value) {
//                   switch (value) {
//                     case 200:
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => UploadPhoto()));
//                       break;
//                     case 401:
//                       setState(() {
//                         addError(error: kLoginFail);
//                       });
//                       break;
//                     case 408:
//                       setState(() {
//                         addError(error: kRequestTimeOut);
//                       });
//                       break;
//                     default:
//                       "Error";
//                   }
//                 });
//               }
//             }
//   }
//
// class TriangleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(0.0, size.height * 0.4);
//     path.lineTo(size.width, size.height * 0.4);
//     path.lineTo(size.width, 0);
//     path.lineTo(0.0, 0.0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(TriangleClipper oldClipper) => false;
// }
