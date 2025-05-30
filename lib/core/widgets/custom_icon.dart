import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomIcon extends StatelessWidget {
  final void Function() onPressed;
  final IconData? icon;
  final double? size, height, width;
  final Color? backgroundColor;
  final Color? iconColor;

  const CustomIcon(
      {super.key,
      required this.onPressed,
        this.height = 60,
      this.width = 60,
      this.icon = Icons.navigate_next,
      this.backgroundColor = AppColors.primary1,
      this.iconColor = AppColors.white, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          size: size,
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
