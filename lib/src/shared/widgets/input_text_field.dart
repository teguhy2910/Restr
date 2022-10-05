// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

class InputTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function(String? value) onChanged;
  const InputTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: AppThemes.text1),
        Gap.h8,
        TextField(
          decoration: InputDecoration(
            fillColor: AppThemes.lightGrey,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.p20),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: Sizes.p16, vertical: Sizes.p12),
            hintText: hintText,
            hintStyle: AppThemes.text2.grey,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
