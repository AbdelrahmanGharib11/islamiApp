import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNaviIcon extends StatelessWidget {
  BottomNaviIcon({super.key, required this.Image});
  String Image;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Image);
  }
}
