import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/utils/my_color.dart';
import 'package:todo2/features/home_feature/presentation/manger/settings_cubit/settings_cubit.dart';

class CustomTff extends StatelessWidget {
  const CustomTff(
      {super.key, this.hint, this.label, required this.textEditingController, required this.obSecureText, this.onFieldSubmitted, this.validator, required this.borderColor, this.keyboardType});

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
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return TextFormField(
          style: TextStyle(color:BlocProvider.of<SettingsCubit>(context).isLight?Colors.black:whiteColor),
          validator: validator,
          controller: textEditingController,
          obscureText: obSecureText,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: '$label',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: borderColor)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: blueColor)
            ),

          ),
        );
      },
    );
  }
}