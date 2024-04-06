import 'package:flutter/material.dart';

class TextFdNumSignInUp extends StatelessWidget {
  const TextFdNumSignInUp({
    super.key,
    required this.textprefix,
    required this.keyboardType,
    required this.textlabel,
  });
  final String textprefix;
  final String textlabel;

  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 310,
      child: TextField(
        keyboardType: keyboardType,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          // prefixText: textprefix,
          // prefixStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          hintText: textprefix,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 0, 69, 126),
              width: 2,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          label: Text(textlabel),
          labelStyle: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 69, 126),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 0, 69, 126),
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}
