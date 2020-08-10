import 'dart:convert';
import 'package:http/http.dart' as http;
import 'coin_data.dart';

//const apiKey = '8FCD231D-F9CB-42EC-8A4D-F22CB034D89B';
const apiKey2 = '690941FA-3F7D-4B0F-A1DA-E86C92F39B3B';
const coinURL = 'https://rest.coinapi.io/v1/exchangerate';

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
  Future getCoinData(String selectedCurrency) async {
    List<String> exchangeRateList = [];

    for (String crypto in cryptoList) {
      http.Response response =
          await http.get('$coinURL/$crypto/$selectedCurrency?apikey=$apiKey2');
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        num eR = jsonResponse['rate'];
        String exRate = eR.toStringAsFixed(0);
        if (exRate == null) {
          exchangeRateList.add('?');
        }
        exchangeRateList.add(exRate);
      } else {
        print('${response.statusCode}');
      }
    }
    return exchangeRateList;
  }
}
