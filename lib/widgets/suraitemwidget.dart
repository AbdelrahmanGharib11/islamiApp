import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/services/suraService.dart';
import 'package:islami/theme/apptheme.dart';

class SuraItem extends StatefulWidget {
  SuraItem({super.key, required this.sura});

  Sura sura;

  @override
  State<SuraItem> createState() => _SuraItemState();
}

class _SuraItemState extends State<SuraItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/svgimage/arabic-art-svgrepo-com 1.svg'),
            Text(
              '${widget.sura.suranumber}',
              style: TextStyle(
                color: Apptheme.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Spacer(
          flex: 1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sura.englishname,
              style: TextStyle(
                color: Apptheme.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${widget.sura.ayatcount} Verses',
              style: TextStyle(
                color: Apptheme.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Spacer(
          flex: 10,
        ),
        Text(
          widget.sura.arabicname,
          style: TextStyle(
            color: Apptheme.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
