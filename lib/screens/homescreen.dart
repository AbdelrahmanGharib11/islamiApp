import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/page/hadeth.dart';
import 'package:islami/page/quran.dart';
import 'package:islami/page/radio.dart';
import 'package:islami/page/sebha.dart';
import 'package:islami/page/time.dart';
import 'package:islami/services/suraService.dart';
import 'package:islami/widgets/bottomNaviActiveIcon.dart';
import 'package:islami/widgets/bottomNaviIcon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  List<Widget> tabs = [
    QuranPage(),
    HadethPage(),
    SebhaPage(),
    RadioPage(),
    TimePage(),
  ];
  List<String> tabsbackgroundimage = [
    'background',
    'hadethback',
    'sebha',
    'radio1',
    'background'
  ];

  @override
  Widget build(BuildContext context) {
    var screendim = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/image/${tabsbackgroundimage[currentindex]}.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/image/header.png',
                height: screendim.height * 0.16,
              ),
            ),
            Expanded(child: tabs[currentindex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap: (index) {
          currentindex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: BottomNaviIcon(Image: 'assets/svgimage/Vector.svg'),
            activeIcon:
                BottomNaviActiveIcon(Image: 'assets/svgimage/Vector.svg'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: BottomNaviIcon(
              Image: 'assets/svgimage/book-album-svgrepo-com 1.svg',
            ),
            activeIcon: BottomNaviActiveIcon(
              Image: 'assets/svgimage/book-album-svgrepo-com 1.svg',
            ),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: BottomNaviIcon(
              Image: 'assets/svgimage/necklace-islam-svgrepo-com 1.svg',
            ),
            activeIcon: BottomNaviActiveIcon(
              Image: 'assets/svgimage/necklace-islam-svgrepo-com 1.svg',
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: BottomNaviIcon(
              Image: 'assets/svgimage/radio-svgrepo-com 1.svg',
            ),
            activeIcon: BottomNaviActiveIcon(
              Image: 'assets/svgimage/radio-svgrepo-com 1.svg',
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: BottomNaviIcon(
              Image: 'assets/svgimage/Vector (1).svg',
            ),
            activeIcon: BottomNaviActiveIcon(
              Image: 'assets/svgimage/Vector (1).svg',
            ),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
