import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  Customtextfield({
    super.key,
    required this.nameController,
    required this.valid,
    required this.ispass,
    required this.text1,
    required this.text2,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController? nameController;
  final FormFieldValidator<String>? valid;
  final bool ispass;
  final String text1;
  final String text2;
  final IconData? icon;
  final TextInputType? keyboard;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      validator: valid,
      obscureText: ispass,
      decoration: InputDecoration(
        label: Text(text1),
        hint: Text(text2),
        suffixIcon: Icon(icon),
        suffixIconColor: Colors.teal,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusColor: Colors.teal,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      keyboardType: keyboard,
    );
  }
}
