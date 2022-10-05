import 'package:flutter/material.dart';
import 'package:restr/src/constants/constants.dart';

class CategoryListTile extends StatelessWidget {
  final String name;
  const CategoryListTile({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.p12,
        vertical: Sizes.p4,
      ),
      margin: const EdgeInsets.only(right: Sizes.p8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p8),
        color: AppThemes.greenGrey,
      ),
      child: Text(
        name,
        style: AppThemes.subText1,
      ),
    );
  }
}
