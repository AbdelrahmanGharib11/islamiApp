import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:islami/theme/apptheme.dart';
import 'package:islami/widgets/radioItem.dart';

class RadioPage extends StatelessWidget {
  RadioPage({super.key});
  List<String> radio = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
    'Radio Islamic Studies',
    'Radio Muslim Community',
  ];

  List<String> reciters = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
    'Ahmad Al-Tawab',
    'Sahil Al-Ahmadi',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Apptheme.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12)),
              child: TabBar(
                  dividerHeight: 0,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Apptheme.black),
                  unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge,
                  indicator: BoxDecoration(
                    color: Apptheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'Radio'),
                    Tab(text: 'Reciters'),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                      itemCount: radio.length,
                      itemBuilder: (context, index) {
                        return Radioitem(
                          radiodata: radio,
                          index: index,
                        );
                      }),
                  ListView.builder(
                      itemCount: radio.length,
                      itemBuilder: (context, index) {
                        return Radioitem(
                          radiodata: reciters,
                          index: index,
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
