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
      this.isObscure = false,
      this.switchVisibility,
      this.onSubmitted});

  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final bool isObscure;
  final String? hint;
  final Icon? prefixIcon;
  final Function(String)? onSubmitted;
  final Function()? switchVisibility;

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
            obscureText: isObscure,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
                prefixIcon: prefixIcon,
                suffixIcon: isPassword
                    ? GestureDetector(
                        onTap: switchVisibility,
                        child: isObscure
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      )
                    : null,
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
