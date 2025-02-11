import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/theme/apptheme.dart';
import 'package:islami/widgets/loadingIndicator.dart';

class SuraDisplay extends StatefulWidget {
  SuraDisplay({super.key});

  @override
  State<SuraDisplay> createState() => _SuraDisplayState();
}

class _SuraDisplayState extends State<SuraDisplay> {
  List<String> ayattext = [];

  late Sura sura;

  Future<void> getAyat() async {
    String suratextfile =
        await rootBundle.loadString('assets/Suras/${sura.suranumber}.txt');
    ayattext = suratextfile.split('\r\n');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screendim = MediaQuery.sizeOf(context);
    sura = ModalRoute.of(context)?.settings.arguments as Sura;
    if (ayattext.isEmpty) {
      getAyat();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishname),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/image/maskgroup.png',
                  height: screendim.height * 0.12,
                ),
                Text(
                  sura.arabicname,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Apptheme.primary),
                ),
                Image.asset(
                  'assets/image/maskgroup2.png',
                  height: screendim.height * 0.12,
                ),
              ],
            ),
          ),
          ayattext.isEmpty
              ? LoadingIndicator()
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.separated(
                        itemCount: ayattext.length,
                        itemBuilder: (_, index) {
                          return Text(ayattext[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Apptheme.primary));
                        },
                        separatorBuilder: (_, index) {
                          return SizedBox(height: 20);
                        }),
                  ),
                ),
          Image.asset(
            'assets/image/maskgroup3.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
