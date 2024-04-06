import 'package:flutter/material.dart';

class TextFdPassSignInUp extends StatelessWidget {
  const TextFdPassSignInUp({
    super.key,
    required this.texthint,
    required this.txetlabel,
    required this.onChanged,
  });
  final String texthint;
  final String txetlabel;

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 310,
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: texthint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(
                'assets/images/eye.png',
              ),
              height: 14,
            ),
          ),
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
          label: Text(txetlabel),
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
