import 'package:flutter/material.dart';

class CustomInputContainer extends StatelessWidget {
  const CustomInputContainer({
    Key? key,
    required this.text,
    required this.obscureText,
    required this.textInputType,
    required this.controller,
  }) : super(key: key);

  final String text;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          obscureText: obscureText,
          keyboardType: textInputType,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
