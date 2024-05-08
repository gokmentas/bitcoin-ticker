import 'package:flutter/material.dart';

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
  List<DropdownMenuItem<String>> itemList = [];

  void addItem() {
    for (var i = 0; i < currenciesList.length; i++) {
      itemList.add(
        DropdownMenuItem(
          child: Text("${currenciesList[i]}"),
          value: currenciesList[i],
        ),
      );
    }
  }
}
