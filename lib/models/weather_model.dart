import 'package:flutter/material.dart';

class WeatherModel {
  final String date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherStatement;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherStatement,
  });

  factory WeatherModel.fromJson(dynamic data) {
    final Map<String, dynamic> jsonData =
        data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      minTemp: jsonData['mintemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      weatherStatement: jsonData['condition']['text'],
    );
  }

  @override
  String toString() =>
      'Temp = $temp Min Temp = $minTemp Max Temp = $maxTemp Date = $date weather Statement = $weatherStatement';

  String getImage() {
    switch (weatherStatement) {
      case 'Sunny':
      case 'Clear':
      case 'Partly cloudy':
        return 'assets/images/clear.png';
      case 'Blizzard':
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Blowing snow':
        return 'assets/images/snow.png';
      case 'Freezing fog':
      case 'Fog':
      case 'Heavy Cloud':
      case 'Mist':
        return 'assets/images/cloudy.png';
      case 'Patchy rain possible':
      case 'Heavy Rain':
      case 'Showers':
        return 'assets/images/rainy.png';
      case 'Thundery outbreaks possible':
      case 'Moderate or heavy snow with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light rain with thunder':
        return 'assets/images/thunderstorm.png';
      default:
        return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    switch (weatherStatement) {
      case 'Sunny':
      case 'Clear':
      case 'Partly cloudy':
        return Colors.orange;
      case 'Blizzard':
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Blowing snow':
        return Colors.blue;
      case 'Freezing fog':
      case 'Fog':
      case 'Heavy Cloud':
      case 'Mist':
        return Colors.blueGrey;
      case 'Patchy rain possible':
      case 'Heavy Rain':
      case 'Showers':
        return Colors.blue;
      case 'Thundery outbreaks possible':
      case 'Moderate or heavy snow with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light rain with thunder':
        return Colors.deepPurple;
      default:
        return Colors.orange;
    }
  }
}

