import 'package:flutter/material.dart';

class PrimaryInput extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;

  PrimaryInput({this.controller, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      maxLength: 100,
    );
  }
}
