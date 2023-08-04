import 'package:flutter/material.dart';

class buttonComponent extends StatelessWidget {
  buttonComponent({super.key, required this.text, required this.onPressed});
  String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(12),
        color: Colors.black,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
