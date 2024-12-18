import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

String currencyName = "USD";

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  String currentBTCPrice = "1 BTC = ? USD";
  String currentLTCPrice = "1 LTC = ? USD";
  String currentETHPrice = "1 ETH = ? USD";

  CoinData coinData = CoinData();

  @override
  void initState() {
    coinData.addItem();
    super.initState();
  }

  void updateBTCUI(String price) {
    currentBTCPrice = "1 BTC = $price $currencyName";
    currentLTCPrice = "1 LTC = $price $currencyName";
    currentETHPrice = "1 ETH = $price $currencyName";
  }

  void updateLTCUI(String price) {
    currentLTCPrice = "1 LTC = $price $currencyName";
  }

  void updateETHUI(String price) {
    currentETHPrice = "1 ETH = $price $currencyName";
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(
        Text(currency),
      );
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) async {
        currencyName = coinData.getCurrencyName(selectedIndex);
        double btcData = await coinData.getBTCData(currencyName);
        double ltcData = await coinData.getLTCData(currencyName);
        double ethData = await coinData.getETHData(currencyName);
        setState(() {
          updateBTCUI(btcData.toString());
          updateLTCUI(ltcData.toString());
          updateETHUI(ethData.toString());
        });
      },
      children: pickerItems,
    );
  }

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: coinData.itemList,
      onChanged: (value) async {
        currencyName = value!;
        double btcData = await coinData.getBTCData(currencyName);
        double ltcData = await coinData.getLTCData(currencyName);
        double ethData = await coinData.getETHData(currencyName);
        setState(() {
          selectedCurrency = value;
          updateBTCUI((btcData.toInt()).toString());
          updateLTCUI((ltcData.toInt()).toString());
          updateETHUI((ethData.toInt()).toString());
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("🤑 Coin Ticker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                child: Text(
                  currentBTCPrice,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                child: Text(
                  currentLTCPrice,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                child: Text(
                  currentETHPrice,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 100,
            child: SizedBox(
              height: 10,
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
