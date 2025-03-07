import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;
  final TextStyle? titleStyle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.backgroundColor = Colors.blue,
    this.titleStyle,
    required this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 15,),
          Text(subTitle!, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 12)),
        ],
      ),
      backgroundColor: backgroundColor,
      elevation: 4, // Shadow effect
      actions: actions,
      leading: leading,
      titleTextStyle: titleStyle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
