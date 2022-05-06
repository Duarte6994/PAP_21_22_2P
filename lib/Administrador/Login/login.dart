import 'package:flutter/material.dart';
import 'package:pap_projeto/Administrador/Login/Material_de_login/Background/bg.dart';
import 'Material_de_Login/Forms/login_form.dart';

void main() => runApp(const LoginScreen());

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}