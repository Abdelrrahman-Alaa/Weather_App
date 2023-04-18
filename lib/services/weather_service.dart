import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  static const baseURL = "http://api.weatherapi.com/v1";
  static const key = "19d5d22e92c14b7491871624230804";

  Future<WeatherModel> getWeather({required String cityName}) async {
    final uri = Uri.parse("$baseURL/forecast.json?key=$key&q=$cityName&days=7");
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Failed to get weather data");
    }

    final data = jsonDecode(response.body);
    return WeatherModel.fromJson(data);
  }
}

