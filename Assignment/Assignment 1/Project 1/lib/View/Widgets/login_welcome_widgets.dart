import 'package:flutter/material.dart';

class LoginWelcomeWidgets extends StatelessWidget {
  const LoginWelcomeWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text('Welcome Back', style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.blue
        ),),
        Text('Sign to Continue', style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w300
        ),),
        SizedBox(height: 20,)
      ],
    );
  }
}
