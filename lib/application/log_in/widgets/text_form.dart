import 'package:flutter/material.dart';
import 'package:test_1/models/form_validator.dart';

class InputTextForm extends StatelessWidget {
  final FormValidator formValidator;
  final IconData? suffixIcon;
  final IconData prefixIcon;
  final bool showText;
  final VoidCallback? suffixPressed;

  final double width;

  const InputTextForm(
      {Key? key,
      required this.formValidator,
        required this.width,
      this.suffixIcon,
      required this.prefixIcon,
      this.suffixPressed,
      this.showText = true})
      : super(key: key);

  Widget? _getSuffixIcon() {
    if (suffixIcon == null) return null;
    return IconButton(
      onPressed: suffixPressed,
      icon: Icon(suffixIcon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,

        child: TextFormField(
          style: const TextStyle(
            color: Colors.black,
          ),
          validator: formValidator.validator,
          controller: formValidator.controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: formValidator.hint,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: _getSuffixIcon(),
          ),
          obscureText: !showText,
        ),
      ),
    );
  }
}
