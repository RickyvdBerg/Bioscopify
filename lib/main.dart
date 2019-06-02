
import 'package:bioscopify/Blocs/theme.dart';
import 'package:bioscopify/UI/Screens/Main/home.dart';
import 'package:bioscopify/UI/Themes/night.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(nightTheme()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false, 
      home: HomePage());
  }
}
