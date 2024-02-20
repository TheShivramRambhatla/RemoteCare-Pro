import 'package:flutter/material.dart';

class CustomInputFieldWidget extends StatelessWidget {
  final String fieldName;
  final String hindText;
  final Widget? icon;
  final Widget? prefix;
  final TextEditingController? controller;
  final bool isSecureText;

  const CustomInputFieldWidget(
      {super.key,
      required this.fieldName,
      required this.hindText,
      this.controller,
      this.icon,
      this.isSecureText = false,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: controller ?? controller,
          decoration: InputDecoration(
            hintText: hindText,
            suffixIcon: icon ?? icon,
            prefix: prefix ?? prefix,
          ),
          obscureText: isSecureText,
        )
      ],
    );
  }
}
