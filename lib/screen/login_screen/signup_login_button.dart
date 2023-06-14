import 'package:flutter/material.dart';

class SignupLogin extends StatelessWidget {
  const SignupLogin({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed
  });

  final String text;
  final Color color;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
