import 'package:flutter/material.dart';

class TextBtnSugnInUp extends StatelessWidget {
  const TextBtnSugnInUp(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 190),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 0, 69, 126),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
