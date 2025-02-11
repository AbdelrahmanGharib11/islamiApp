import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/services/suraService.dart';
import 'package:islami/theme/apptheme.dart';
import 'package:islami/widgets/recent_sura_section.dart';
import 'package:islami/widgets/suraitemwidget.dart';

class QuranPage extends StatefulWidget {
  QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  void initState() {
    super.initState();

    SuraService.filteredSuralist = SuraService.searchsura;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              cursorColor: Apptheme.primary,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Apptheme.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Apptheme.primary),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/svgimage/Vector.svg',
                    colorFilter:
                        ColorFilter.mode(Apptheme.primary, BlendMode.srcIn),
                  ),
                ),
                hintText: 'Sura Name',
                hintStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              onChanged: (value) {
                SuraService.filterSuraList(value);
                setState(() {});
              },
            ),
          ),
          Visibility(
            visible: SuraService.recentSuralist.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20),
              child: RecentSuraSection(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Suras list',
              style: TextStyle(
                color: Apptheme.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: SuraService.filteredSuralist.length,
              itemBuilder: (_, index) {
                Sura sura = SuraService.filteredSuralist[index];

                return InkWell(
                  onTap: () async {
                    SuraService.addRecentSura(sura);
                    await Navigator.of(context)
                        .pushNamed('third', arguments: sura);
                    setState(() {});
                  },
                  child: SuraItem(sura: sura),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Apptheme.white,
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
