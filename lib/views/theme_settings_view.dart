import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rps/constants.dart';
import 'package:rps/model/theme_setting_data.dart';

class ThemeSettingsView extends StatelessWidget {
  const ThemeSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SwitchTheme(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Theme Settings'),
    );
  }
}

class SwitchTheme extends StatelessWidget {
  const SwitchTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _value = Provider.of<ThemeSettingData>(context).isGreen;
    return Card(
      child: SwitchListTile(
        title: Text('Change App Theme'),
        subtitle: _value ? blueText : redText,
        value: _value,
        onChanged: (bool value) {
          _value = value;
          print(value);
          Provider.of<ThemeSettingData>(context, listen: false)
              .switchTheme(value);
        },
      ),
    );
  }
}
