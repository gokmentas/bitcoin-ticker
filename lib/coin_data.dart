import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  final String url;
  CoinData(this.url);

  Future getCoinData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)["rate"];
    } else {
      print(response.statusCode);
    }
  }

  List<DropdownMenuItem<String>> itemList = [];

  void addItem() {
    for (String currency in currenciesList) {
      itemList.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
  }
}
