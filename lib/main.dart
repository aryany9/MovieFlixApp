import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieflixapp/theme/theme.dart';
import 'package:movieflixapp/views/home.dart';
import 'package:movieflixapp/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: HomeScreen(),
      getPages: routes(),
    );
  }
}
