import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '43d8a11577f849baabcc2d3a6b4c663f';
const weatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double latitude;
  double longitude;

  Future<dynamic> getCityWeather(String cityName) async {
    String cityURL = '$weatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: cityURL);
    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
//    await location.getCurrentLocation().timeout(const Duration(seconds: 2),
//        onTimeout: () {
//          print(
//              'ontimeout executed for getLocationWeather, location data not available for device');
//          latitude = 28.6695721;
//          longitude = 77.1069857;
//        });

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$weatherMapURL?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric');

    var data = await networkHelper.getData();

    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
