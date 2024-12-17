import 'package:flutter/material.dart';
import 'package:yours_news/shared/constant/colors.dart';



// this is a custom appbar that we will use in our app
// we will use this appbar in all the screens of our app
// this appbar will have a title and a back button
// we will also use this appbar in the screens where we don't need a back button
// in that case we will pass automaticallyImplyLeading as false
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    this.title = "",
    this.leading,
    this.leadingPadding = 0.0,
    this.backgroundColor = AppColor.white,
    this.contentColor = AppColor.contentColor,
    this.automaticallyImplyLeading = false,
  });

  final List<Widget>? actions;
  final Widget? leading;
  final String title;
  final double leadingPadding;
  final Color backgroundColor;
  final Color contentColor;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading != null
          ? Padding(
              padding: EdgeInsets.only(left: leadingPadding),
              child: leading,
            )
          : null,
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: contentColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: contentColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
