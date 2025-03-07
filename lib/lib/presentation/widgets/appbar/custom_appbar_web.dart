import 'package:flutter/material.dart';

import '../../../core/const/custom_colors.dart';
import '../../../core/const/text_style.dart';

class CustomAppBarWeb extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;

  const CustomAppBarWeb({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.backgroundColor = CustomAppColors.appbarColor
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 10),
          child: Text(title,
          style: CustomTextStyles.appbarTextStyle),
        ),
      ),
    //  title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: backgroundColor,
      elevation: 4, // Shadow effect
      actions: actions,
      leading: leading,
    );
  }

}
