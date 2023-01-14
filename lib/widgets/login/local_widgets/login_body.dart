import 'package:flutter/material.dart';
import 'package:prueba/services/firebase.dart';
import 'package:prueba/widgets/login/local_widgets/Button.dart';
import 'package:prueba/widgets/login/local_widgets/customInputContainer.dart';
import 'package:prueba/widgets/login/local_widgets/custom_switch.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final formKey = GlobalKey<FormState>();

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomInputContainer(
            controller: phoneNumber,
            text: 'Celular',
            obscureText: false,
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 40),
          CustomInputContainer(
            controller: password,
            text: 'Clave',
            obscureText: true,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 40),
          const CustomSwitch(),
          const Spacer(),
          Button(
            formKey: formKey,
            text: 'Entrar',
            function: () {
              verifyNumber(context, phoneNumber.text);
            },
          ),
          TextButton(
            onPressed: () {},
            child: const Text('¿Olvidó su clave?'),
          )
        ],
      ),
    );
  }
}
