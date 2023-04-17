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
  String toString() {
    return 'Temp = $temp Min Temp = $minTemp Max Temp = $maxTemp Date = $date weather Statement = $weatherStatement';
  }

  String getImage() {
    if (weatherStatement == 'Sunny' ||
        weatherStatement == 'Clear' ||
        weatherStatement == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherStatement == 'Blizzard' ||
        weatherStatement == 'Patchy snow possible' ||
        weatherStatement == 'Patchy sleet possible' ||
        weatherStatement == 'Patchy freezing drizzle possible' ||
        weatherStatement == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStatement == 'Freezing fog' ||
        weatherStatement == 'Fog' ||
        weatherStatement == 'Heavy Cloud' ||
        weatherStatement == 'Mist' ||
        weatherStatement == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStatement == 'Patchy rain possible' ||
        weatherStatement == 'Heavy Rain' ||
        weatherStatement == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStatement == 'Thundery outbreaks possible' ||
        weatherStatement == 'Moderate or heavy snow with thunder' ||
        weatherStatement == 'Patchy light snow with thunder' ||
        weatherStatement == 'Moderate or heavy rain with thunder' ||
        weatherStatement == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStatement == 'Sunny' ||
        weatherStatement == 'Clear' ||
        weatherStatement == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStatement == 'Blizzard' ||
        weatherStatement == 'Patchy snow possible' ||
        weatherStatement == 'Patchy sleet possible' ||
        weatherStatement == 'Patchy freezing drizzle possible' ||
        weatherStatement == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStatement == 'Freezing fog' ||
        weatherStatement == 'Fog' ||
        weatherStatement == 'Heavy Cloud' ||
        weatherStatement == 'Mist' ||
        weatherStatement == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStatement == 'Patchy rain possible' ||
        weatherStatement == 'Heavy Rain' ||
        weatherStatement == 'Showers	') {
      return Colors.blue;
    } else if (weatherStatement == 'Thundery outbreaks possible' ||
        weatherStatement == 'Moderate or heavy snow with thunder' ||
        weatherStatement == 'Patchy light snow with thunder' ||
        weatherStatement == 'Moderate or heavy rain with thunder' ||
        weatherStatement == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
