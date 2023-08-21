import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/View/Widgets/login_form_widgets.dart';
import 'package:project_1/View/Widgets/login_welcome_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70,),
                LoginWelcomeWidgets(),
                Center(child: LoginFormWidget()),
              ],
            ),
          )),
    );
  }
}
