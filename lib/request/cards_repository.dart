import 'dart:convert';
import 'package:api_snowman/request/cards.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class CardsRepository with ChangeNotifier {
  int _page = 1;
  final List<Cards> _cards = [];

  List<Cards> get cards => _cards;

  getCards() async {
    final url = Uri.parse(
        'https://us.api.blizzard.com/hearthstone/cards?locale=pt_BR&page=$_page&access_token=USD0l4E62MPwuOA8SbMDF3j2Uv9UQEE1jI');
    final response = await http.get(url);
    final List<dynamic> results = jsonDecode(response.body)['cards'];
    for (var i = 0; i < results.length; i++) {
      _cards.add(Cards.fromMap(results[i]));
    }
    _page++;
    notifyListeners();
  }
}
