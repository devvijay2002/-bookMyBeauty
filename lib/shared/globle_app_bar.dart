import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final double height;
  final double? elevation;

  final Color? backgroundColor, statusBarColor;
  final Brightness? statusBarIconBrightness;
  final bool? centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;


  const GlobalAppBar({
    required this.title,
    this.leading,
    this.height = kToolbarHeight,
    this.elevation = 0.0,
    super.key,
    this.backgroundColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.centerTitle = true,
    this.actions,
    this.bottom,
  });


  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        centerTitle: centerTitle,
        bottom: bottom,
        flexibleSpace: Container(
          decoration: backgroundColor !=null ?
          BoxDecoration(
           color: backgroundColor
          ) :
          const BoxDecoration(
          gradient: kPrimaryGradient
          ),
        ),
        leading: leading ??
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: kPrimaryColor,
                    size: 16,
                  ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
        title:  title,
        titleTextStyle: backgroundColor ==null ?
        const TextStyle(color: Colors.white,fontSize: 17) : null,
        actions: actions,
      ),
    );
  }
}
