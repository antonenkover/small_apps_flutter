import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<String> exchangeList = [];
  String selectedCurrency = 'AUD';
  String bitcoinValue = '?';
  String etherValue = '?';
  String ltcValue = '?';
  CoinData coinData = CoinData();

  void getData() async {
    try {
      var data = await coinData.getCoinData(selectedCurrency);
      setState(() {
        exchangeList = data;
        bitcoinValue = exchangeList.elementAt(0);
        etherValue = exchangeList.elementAt(1);
        ltcValue = exchangeList.elementAt(2);
      });
    } catch (e) {
      print(e);
    }
  }

  void updateUI() {}

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    CupertinoPicker getIOSPicker() {
      List<Text> menuList = [];
      for (String value in currenciesList) {
        menuList.add(
          Text(value),
        );
      }
      return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            selectedCurrency = currenciesList[selectedIndex];
            getData();
          });
        },
        children: menuList,
      );
    }

    DropdownButton getAndroidPicker() {
      List<DropdownMenuItem<String>> menuList = [];
      for (String value in currenciesList) {
        menuList.add(
          DropdownMenuItem(
            child: Text(value),
            value: value,
          ),
        );
      }
      return DropdownButton(
        value: selectedCurrency,
        items: menuList,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            getData();
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/dollar.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.lightGreen.withOpacity(0.4), BlendMode.srcATop),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.green,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 BTC = $bitcoinValue ${selectedCurrency ?? 'USD'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.green,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 ETH = $etherValue ${selectedCurrency ?? 'USD'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.green,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 LTC = $ltcValue ${selectedCurrency ?? 'USD'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.green,
              child: Platform.isIOS ? getIOSPicker() : getAndroidPicker(),
            ),
          ],
        ),
      ),
    );
  }
}
