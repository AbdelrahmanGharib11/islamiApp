import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/theme/apptheme.dart';

class RecentSuraCard extends StatelessWidget {
  RecentSuraCard({super.key, required this.sura});
  Sura sura;
  @override
  Widget build(BuildContext context) {
    var screendim = MediaQuery.sizeOf(context);
    TextTheme texttheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('third', arguments: sura);
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            height: screendim.height * 0.2,
            width: screendim.width * 0.735,
            decoration: BoxDecoration(
              color: Apptheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      sura.englishname,
                      style: texttheme.headlineSmall
                          ?.copyWith(color: Apptheme.black),
                    ),
                    Text(
                      sura.arabicname,
                      style: texttheme.headlineSmall
                          ?.copyWith(color: Apptheme.black),
                    ),
                    Text(
                      '${sura.ayatcount} Verses',
                      style:
                          texttheme.titleSmall?.copyWith(color: Apptheme.black),
                    )
                  ],
                ),
                SizedBox(
                  width: screendim.width * 0.35,
                  height: screendim.height * 0.16,
                  child: Image.asset(
                    'assets/image/Rectangle 124.png',
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
