// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

class RegularButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  const RegularButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isLoading ? onPressed : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.p12,
          horizontal: Sizes.p32,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.p12),
          color: AppThemes.green,
        ),
        child: !isLoading
            ? Text(
                text,
                style: AppThemes.text1.white.bold,
                textAlign: TextAlign.center,
              )
            : const Center(
                child: SizedBox(
                  height: Sizes.p16,
                  width: Sizes.p16,
                  child: CircularProgressIndicator(
                    color: AppThemes.white,
                  ),
                ),
              ),
      ),
    );
  }
}
