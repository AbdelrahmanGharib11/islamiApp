import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/theme/apptheme.dart';

class BottomNaviActiveIcon extends StatelessWidget {
  BottomNaviActiveIcon({super.key, required this.Image});
  String Image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
          color: Apptheme.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(66)),
      child: SvgPicture.asset(
        Image,
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
