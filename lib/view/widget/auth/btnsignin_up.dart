import 'package:flutter/material.dart';

class BtnSignInUp extends StatelessWidget {
  const BtnSignInUp({super.key, required this.txet, required this.onPressed});
  final String txet;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 69, 126),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              side: BorderSide(
                color: Color.fromARGB(255, 0, 69, 126),
                width: 3,
              )),
        ),
        onPressed:onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
          child: Text(
            txet,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
