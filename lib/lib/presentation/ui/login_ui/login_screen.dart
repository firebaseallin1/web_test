import 'package:flutter/material.dart';

import 'login_ui_export.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var  useridController =TextEditingController();
    var  passwordController =TextEditingController();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return LoginMobile(userName: useridController,password: passwordController,);
          } else if (constraints.maxWidth > 600 && constraints.maxWidth < 900) {
            return LoginTablet(userName: useridController,password: passwordController,);
          } else {
            return  LoginDesktop(userName: useridController,password: passwordController,);
          }
        },
      ),
    );
  }
}