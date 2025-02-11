import 'package:flutter/material.dart';
import 'package:islami/services/suraService.dart';
import 'package:islami/widgets/recent_sura_card.dart';

class RecentSuraSection extends StatelessWidget {
  const RecentSuraSection({super.key});

  @override
  Widget build(BuildContext context) {
    var screendim = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Recently',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 20),
        SizedBox(
          height: screendim.height * 0.19,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: SuraService.recentSuralist.length,
            itemBuilder: (_, index) {
              return RecentSuraCard(
                  sura: SuraService.recentSuralist[
                      SuraService.recentSuralist.length - index - 1]);
            },
            separatorBuilder: (_, index) => SizedBox(height: 10),
          ),
        )
      ],
    );
  }
}
