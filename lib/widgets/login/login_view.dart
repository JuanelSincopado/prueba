import 'package:flutter/material.dart';
import 'package:prueba/widgets/login/local_widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text('AMB APP'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: LoginBody(),
      ),
    );
  }
}
