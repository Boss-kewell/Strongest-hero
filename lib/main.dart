

import 'package:flutter/material.dart';
import 'package:strongestheroes/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:strongestheroes/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
            return MaterialApp(
              title: 'SuperHero App',
              debugShowCheckedModeBanner: false,
              home: HomePage(),
              theme: notifier.dark ? Constants.darkTheme : Constants.lightTheme,
            );
          }
      ),
    );
  }
}
