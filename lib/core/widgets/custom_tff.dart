
import 'package:flutter/material.dart';
import 'package:todo2/core/utils/my_color.dart';

class CustomTff extends StatelessWidget {
  const CustomTff({super.key, this.hint,this.label,required this.textEditingController, required this.obSecureText, this.onFieldSubmitted, this.validator, required this.borderColor,  this.keyboardType});

  final String? hint;
  final String? label;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController textEditingController;
  final bool obSecureText;
  final String? Function(String?)? validator;
  final Color borderColor;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: const TextStyle(color: blackColor),
      controller:textEditingController ,
      obscureText: obSecureText,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: '$label',
          labelStyle:TextStyle(color: Colors.grey) ,
          enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: borderColor)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: borderColor)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: blueColor)
          ),

      ),
    );
  }
}