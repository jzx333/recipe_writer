import 'package:flutter/material.dart';
import 'package:recipe_writer/core/themes/themes.dart';
import 'package:recipe_writer/features/actions/presentation/screens/actions_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: createLightTheme(),
      home: ActionsScreen(),
    );
  }
}
