import 'package:flutter/material.dart';
import 'package:islami/theme/apptheme.dart';

class SebhaPage extends StatefulWidget {
  SebhaPage({super.key});

  @override
  State<SebhaPage> createState() => _SebhaPageState();
}

class _SebhaPageState extends State<SebhaPage> {
  List<String> azkar = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
    'لا اله الا الله',
  ];

  int counter = 0;

  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    double screendim = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: screendim * 0.01,
        ),
        Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: Theme.of(context).textTheme.headlineLarge),
        GestureDetector(
          onTap: counterAndzekerChange,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screendim * 0.06),
                child: Image.asset('assets/image/Mask group (1).png'),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screendim * 0.088, left: 20, right: 20, bottom: 20),
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    'assets/image/SebhaBody 1 (1).png',
                  ),
                ),
              ),
              Positioned(
                top: screendim * 0.27,
                child: Column(
                  children: [
                    Text(
                      azkar[index],
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void counterAndzekerChange() {
    counter++;

    if (counter % 33 == 0) {
      index++;
    }
    if (index == azkar.length) {
      index = 0;
      counter = 0;
    }
    angle += 360 / 28;
    setState(() {});
  }
}
