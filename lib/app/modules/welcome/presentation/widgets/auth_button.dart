import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final String route;
  final Color color;
  final Color textColor;

  const AuthButton({
    super.key,
    required this.buttonText,
    required this.route,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.navigate(route),
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
