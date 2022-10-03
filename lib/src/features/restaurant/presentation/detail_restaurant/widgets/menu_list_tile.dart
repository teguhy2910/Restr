import 'package:flutter/material.dart';
import 'package:restr/src/constants/constants.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final String menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.p20,
        vertical: Sizes.p12,
      ),
      margin: const EdgeInsets.only(right: Sizes.p20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p12),
        color: AppThemes.greenGrey,
      ),
      child: Text(
        menu,
        style: AppThemes.text1,
      ),
    );
  }
}
