import 'package:flutter/material.dart';

class AuthenticationRegister extends StatelessWidget {
  const AuthenticationRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Name"
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Username"
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Password"
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Comfirm Password"
                  ),
                ),
                TextButton(onPressed: (){}, child: const Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
