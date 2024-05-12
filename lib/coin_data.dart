import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = ['EUR', 'GBP', 'USD', 'TRY'];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = "https://rest.coinapi.io/v1/exchangerate";
const apiKEY = "99B01457-FBF3-402B-9B5F-EC1401441D8D";

class CoinData {
  Future getBTCData(String selectedCurrency) async {
    String requestURL = "$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKEY";
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)["rate"];
    } else {
      print(response.statusCode);
    }
  }

  Future getLTCData(String selectedCurrency) async {
    String requestURL = "$coinAPIURL/LTC/$selectedCurrency?apikey=$apiKEY";
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)["rate"];
    } else {
      print(response.statusCode);
    }
  }

  Future getETHData(String selectedCurrency) async {
    String requestURL = "$coinAPIURL/ETH/$selectedCurrency?apikey=$apiKEY";
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)["rate"];
    } else {
      print(response.statusCode);
    }
  }

  String getCurrencyName(int index) {
    return currenciesList[index];
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
