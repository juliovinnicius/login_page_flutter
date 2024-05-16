import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.isPass,
    this.obscureText,
    this.validatorText,
    this.controller,
  });

  final String label;
  final String hint;
  final bool isPass;
  final String? validatorText;
  final bool? obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      obscureText: isPass ? obscureText! : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
