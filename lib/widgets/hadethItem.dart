import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadethModel.dart';
import 'package:islami/theme/apptheme.dart';
import 'package:islami/widgets/loadingIndicator.dart';

class HadethItem extends StatefulWidget {
  HadethItem({super.key, required this.index});
  int index;

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  Widget build(BuildContext context) {
    if (hadeth == null) loadHadeth();
    var screendim = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('fourth', arguments: hadeth);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Apptheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/image/Cornerr 2.png',
                    height: screendim.height * 0.1,
                  ),
                  if (hadeth != null)
                    Expanded(
                      child: Text(
                        hadeth!.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Apptheme.black),
                      ),
                    ),
                  Image.asset(
                    'assets/image/Cornerr 1.png',
                    height: screendim.height * 0.1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/image/HadithCardBackGround 1.png'))),
                child: hadeth == null
                    ? LoadingIndicator(color: Apptheme.black)
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              return Text(
                                hadeth!.content[index],
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Apptheme.black),
                              );
                            },
                            separatorBuilder: (_, index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: hadeth!.content.length),
                      ),
              ),
            ),
            Image.asset(
              'assets/image/Mosque-02 2.png',
              fit: BoxFit.fill,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeth() async {
    String hadethfilelines =
        await rootBundle.loadString('assets/Hadeeth/h${widget.index + 1}.txt');

    List<String> hadethlines = hadethfilelines.split('\n');
    String title = hadethlines[0];
    List<String> content = hadethlines.sublist(1);

    hadeth = Hadeth(
      content: content,
      hadethnum: widget.index + 1,
      title: title,
    );
    if (mounted) {
      setState(() {});
    }
  }
}
