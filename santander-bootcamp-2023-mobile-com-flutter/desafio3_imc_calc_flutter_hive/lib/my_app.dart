import 'package:calc_imc_flutter/pages/home_page.dart';
import 'package:calc_imc_flutter/theme/dark_theme.dart';
import 'package:calc_imc_flutter/theme/light_theme.dart';
// import 'package:calc_imc_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}
