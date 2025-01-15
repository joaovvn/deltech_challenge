import 'package:deltech_challenge/constants/values.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.title = '',
      this.hint,
      required this.controller,
      this.prefixIcon,
      this.isPassword = false,
      this.onSubmitted});

  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final String? hint;
  final Icon? prefixIcon;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.isEmpty
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
        SizedBox(
          height: 50,
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
                prefixIcon: prefixIcon,
                border:
                    OutlineInputBorder(borderRadius: AppValues.borderRadius),
                fillColor: Colors.white70,
                filled: true,
                hintText: hint),
          ),
        )
      ],
    );
  }
}
