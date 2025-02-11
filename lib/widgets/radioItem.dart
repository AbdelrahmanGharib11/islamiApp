import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/theme/apptheme.dart';

class Radioitem extends StatefulWidget {
  Radioitem({super.key, required this.radiodata, required this.index});
  List<String> radiodata = [];
  int index;

  @override
  State<Radioitem> createState() => _RadioitemState();
}

class _RadioitemState extends State<Radioitem> {
  int playflag = 0;
  int voiceflag = 0;

  @override
  Widget build(BuildContext context) {
    var screendim = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          // width: screendim.width * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Apptheme.primary,
          ),
          height: screendim.height * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: screendim.height * 0.015,
              ),
              Text(
                widget.radiodata[widget.index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Apptheme.black,
                    ),
              ),

              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    playflag % 2 == 0
                        ? Positioned(
                            child: Image.asset(
                              'assets/image/Mosque-02 2.png',
                              fit: BoxFit.fill,
                              height: screendim.height * 0.11,
                              width: double.infinity,
                            ),
                          )
                        : Positioned(
                            child: Image.asset(
                              'assets/image/soundWave 1 (2).png',
                              fit: BoxFit.fill,
                              height: screendim.height * 0.1,
                              width: double.infinity,
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 3,
                        ),
                        IconButton(
                          onPressed: () {
                            playflag++;
                            setState(() {});
                          },
                          icon: Icon(
                            playflag % 2 == 0
                                ? Icons.play_arrow_rounded
                                : Icons.pause_rounded,
                            size: 45,
                            color: Apptheme.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            voiceflag++;
                            setState(() {});
                          },
                          icon: Icon(
                            voiceflag % 2 == 0
                                ? CupertinoIcons.volume_up
                                : CupertinoIcons.volume_mute,
                            size: 35,
                            color: Apptheme.black,
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    )
                  ],
                ),
              ),
              // Container(
              //     width: double.infinity,
              //     height: screendim.height * 0.1,
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //         fit: BoxFit.fill,
              //         image: AssetImage(
              //           playflag % 2 == 0
              //               ? 'assets/image/Mosque-02 2.png'
              //               : 'assets/image/WhatsApp Image 2025-02-11 at 23.03.44_333f7fa2.png',
              //         ),
              //       ),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Spacer(
              //           flex: 3,
              //         ),
              //         IconButton(
              //           onPressed: () {
              //             playflag++;
              //             setState(() {});
              //           },
              //           icon: Icon(
              //             playflag % 2 == 0
              //                 ? Icons.play_arrow_rounded
              //                 : Icons.pause_rounded,
              //             size: 45,
              //             color: Apptheme.black,
              //           ),
              //         ),
              //         IconButton(
              //           onPressed: () {
              //             voiceflag++;
              //             setState(() {});
              //           },
              //           icon: Icon(
              //             voiceflag % 2 == 0
              //                 ? CupertinoIcons.volume_up
              //                 : CupertinoIcons.volume_mute,
              //             size: 35,
              //             color: Apptheme.black,
              //           ),
              //         ),
              //         Spacer(
              //           flex: 2,
              //         )
              //       ],
              //     )),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
