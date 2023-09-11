import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strongestheroes/utils/constants.dart';




class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children:  <Widget>[
            ListTile(
              title: Text(
                  'Dark mode',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("Use the dark mode"),
              trailing: Consumer<ThemeNotifier>(
                  builder: (context, notifier, child) => CupertinoSwitch(
                      value: notifier.dark,
                      activeColor: Theme.of(context).colorScheme.secondary,
                      onChanged: (val) {
                        notifier.toggleTheme();
                      },
                  ),
              ),
            ),
            Divider(),
            SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Contribute ")
              ],
            )
          ],
        ),
      ),
    );
  }
}

