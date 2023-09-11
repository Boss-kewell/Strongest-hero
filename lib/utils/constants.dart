import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
    //App related strings
    static String appName = "SuperHero App";

    //Colors for theme
    static Color lightPrimary = const Color(0xfff3f4f9);
    static const Color darkPrimary = Color(0xff2B2B2B);

    static const Color lightAccent = const Color(0xffBF5AF2);
    //secondary color
    static const Color secondary = const Color(0xff5E5CE6);
    //tertiary color
    static const Color tertiary = const Color(0xff60BFF4);

    static Color darkAccent = const Color(0xffBF5AF2);

    static Color lightBG = const Color(0xfff3f4f9);
    static Color darkBG = const Color(0xff2B2B2B);
    static Color lightGrey = const Color(0xFF2C2C2E);
    static Color darkGrey = const Color(0xFF3A3A3C);
    //softgrey
    static Color softGrey = const Color(0xFFB5B5B5);

    static ThemeData lightTheme = ThemeData(
        primaryColor: lightPrimary,
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: lightAccent,
        ),
        scaffoldBackgroundColor: lightBG,
        bottomAppBarTheme: BottomAppBarTheme(
            elevation: 0.0,
            color: lightBG,
        ),
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: lightBG,
            iconTheme: const IconThemeData(color: Colors.black),
            toolbarTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
            ),
            titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
            ),
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(
            secondary: lightAccent,
        )
            .copyWith(
            background: lightBG,
        ),
    );

    static ThemeData darkTheme = ThemeData(
        snackBarTheme: const SnackBarThemeData(
            actionTextColor: Colors.white,
            contentTextStyle: TextStyle(
                color: Colors.white,
            ),
        ),
        primaryColor: darkPrimary,
        scaffoldBackgroundColor: darkBG,
        iconTheme: const IconThemeData(color: Colors.white),
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: darkAccent,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
            elevation: 2.0,
            color: darkBG,
        ),
        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0.0,
            backgroundColor: darkBG,
            toolbarTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
            ),
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
            ),
        ),
        colorScheme: ColorScheme.fromSwatch(
            accentColor: darkAccent,
        )
            .copyWith(
            secondary: darkAccent,
            brightness: Brightness.dark,
        )
            .copyWith(background: darkBG),
    );
}
class ThemeNotifier extends ChangeNotifier {
    final String key = 'theme';
    SharedPreferences? _prefs;
    bool _darkTheme = false;
    bool get dark => _darkTheme;

    ThemeNotifier() {
        _darkTheme = true;
        _loadfromPrefs();
    }
    toggleTheme(){
        _darkTheme = !_darkTheme;
        _saveToPrefs();
        notifyListeners();
    }

    _initPrefs()async{
        if(_prefs == null)
            _prefs = await SharedPreferences.getInstance();
    }
    _loadfromPrefs()async{
        await _initPrefs();
        _darkTheme = _prefs!.getBool(key) ?? true;
        notifyListeners();
    }
    _saveToPrefs()async{
        await _initPrefs();
        _prefs!.setBool(key, _darkTheme);
    }
}
