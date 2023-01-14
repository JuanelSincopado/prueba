import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.formKey,
    required this.function,
    required this.text,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final Function() function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          function();
        }
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(60, 15, 60, 15)),
      child: Text(text),
    );
  }
}
