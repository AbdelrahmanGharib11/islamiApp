import 'package:flutter/material.dart';
import 'package:islami/theme/apptheme.dart';

class LoadingIndicator extends StatelessWidget {
  LoadingIndicator({super.key, this.color});
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? Apptheme.primary,
      ),
    );
  }
}
