import 'package:api_snowman/request/cards_list.dart';
import 'package:api_snowman/widgets/appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cardTheme: const CardTheme(
          elevation: 0,
        ),
        cardColor: Colors.transparent,
        scaffoldBackgroundColor: const Color.fromARGB(255, 242, 197, 61),
      ),
      home: Scaffold(
        appBar: LogoBar.appBar,
      body: const CardsList(),
      ),
    );
  }
}

