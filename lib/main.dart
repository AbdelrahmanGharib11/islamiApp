import 'package:flutter/material.dart';
import 'package:islami/screens/hadethDisplay.dart';
import 'package:islami/screens/homescreen.dart';
import 'package:islami/screens/introscreen.dart';
import 'package:islami/screens/suraDisplay.dart';
import 'package:islami/services/storeKeys.dart';
import 'package:islami/services/storeService.dart';
import 'package:islami/services/suraService.dart';
import 'package:islami/theme/apptheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();
  SuraService.getRecentSuralist();

  runApp(const IslamiApp());
}

class IslamiApp extends StatefulWidget {
  const IslamiApp({super.key});

  @override
  State<IslamiApp> createState() => _MyAppState();
}

class _MyAppState extends State<IslamiApp> {
  @override
  Widget build(BuildContext context) {
    var runforthefirsttime =
        LocalStorageServices.getbool(LocalStorageKeys.runforthefirsttime) ??
            false;
    return MaterialApp(
      routes: {
        'first': (context) => IntroScreen(),
        'second': (context) => HomeScreen(),
        'third': (context) => SuraDisplay(),
        'fourth': (context) => HadethDisplay(),
      },
      debugShowCheckedModeBanner: false,
      home: runforthefirsttime ? HomeScreen() : IntroScreen(),
      theme: Apptheme.lighttheme,
      darkTheme: Apptheme.darktheme,
      themeMode: ThemeMode.light,
    );
  }
}
