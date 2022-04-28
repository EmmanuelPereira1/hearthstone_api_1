import 'package:api_snowman/request/cards_list.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HEARTHSTONE CARDS")),
      body: const CardsList(),
    );
  }
}
