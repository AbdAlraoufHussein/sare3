import 'package:flutter/material.dart';

class TextFdSignInUp extends StatelessWidget {
  const TextFdSignInUp({
    super.key,
    required this.texthint,
    required this.keyboardType,
    required this.textlabel,
  });
  final String texthint;
  final String textlabel;

  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 310,
      child: TextField(
        keyboardType: keyboardType,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          // prefixText: texthintprefix,
          // prefixStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          hintText: texthint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
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
