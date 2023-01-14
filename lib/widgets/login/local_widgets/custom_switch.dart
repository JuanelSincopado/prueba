import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {

  bool customSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoSwitch(
          value: customSwitch,
          onChanged: (value) {
            setState(() {
              customSwitch = value;
            });
          },
        ),
        const SizedBox(width: 10),
        const Text(
          'Recordar',
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
