import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/images.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleName;
  final String title;
  final Widget? leading;
  final double height;
  final double? elevation;
  final Color? backgroundColor, titleColor, statusBarColor;
  final Brightness? statusBarIconBrightness;
  final bool? centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const GlobalAppBar({
    super.key,
    this.titleName,
    required this.title,
    this.leading,
    this.height = kToolbarHeight,
    this.elevation = 0.0,
    this.backgroundColor = Colors.white,
    this.titleColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.centerTitle = false,
    this.actions,
    this.bottom,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          )),
      backgroundColor: backgroundColor,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      centerTitle: centerTitle,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(loginBg),
            fit: BoxFit.cover,
          ),
        ),
      ),
      leading: leading ??
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      title: Text(
       title,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            letterSpacing: 1,
            fontWeight: FontWeight.w900),
      ),
      actions: actions,
    );
  }
}
