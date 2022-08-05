import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rps/components/splash_widget.dart';
import 'package:rps/model/theme_setting_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeSettingData().createSharedPreference();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ThemeSettingData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeSettingData>(context, listen: false)
        .loadSharedPreferences();
    return MaterialApp(
      theme: Provider.of<ThemeSettingData>(context).selectedData,
      home: SplashWidget(),
    );
  }
}
