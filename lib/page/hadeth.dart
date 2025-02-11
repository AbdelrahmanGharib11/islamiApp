import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:islami/widgets/hadethItem.dart';

class HadethPage extends StatelessWidget {
  HadethPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 20),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: double.infinity,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: false,
        ),
        itemCount: 50,
        itemBuilder: (_, index, __) => HadethItem(
          index: index,
        ),
      ),
    );
  }
}
