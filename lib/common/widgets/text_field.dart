import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final bool isObscure;
  final maxLines;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.isObscure,
      this.maxLines = 1,
      required this.controller});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.all(16),
          labelText: widget.hintText,
        ),
        maxLines: widget.maxLines == 1?null:1,
        obscureText: widget.isObscure,
      ),
    );
  }
}
