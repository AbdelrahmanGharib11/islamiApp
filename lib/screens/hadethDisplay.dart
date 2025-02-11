import 'package:flutter/material.dart';
import 'package:islami/model/hadethModel.dart';
import 'package:islami/theme/apptheme.dart';
import 'package:islami/widgets/loadingIndicator.dart';

class HadethDisplay extends StatefulWidget {
  HadethDisplay({super.key});

  @override
  State<HadethDisplay> createState() => _SuraDisplayState();
}

class _SuraDisplayState extends State<HadethDisplay> {
  late Hadeth hadeth;

  @override
  Widget build(BuildContext context) {
    var screendim = MediaQuery.sizeOf(context);
    hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
    // if (ayattext.isEmpty) {
    //   getAyat();
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Hadeth ${hadeth.hadethnum}'),
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
                Expanded(
                  child: Text(
                    hadeth.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Apptheme.primary),
                  ),
                ),
                Image.asset(
                  'assets/image/maskgroup2.png',
                  height: screendim.height * 0.12,
                ),
              ],
            ),
          ),
          // hadeth==null?
          //      LoadingIndicator()
          //     :
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                  itemCount: hadeth.content.length,
                  itemBuilder: (_, index) {
                    return Text(hadeth.content[index],
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
