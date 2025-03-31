import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed, // The argument type 'Function' can't be assigned to the parameter type 'VoidCallback?'.
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: const Color.fromARGB(255, 4, 99, 177)),
        ),
      ),
    );
  }
}
