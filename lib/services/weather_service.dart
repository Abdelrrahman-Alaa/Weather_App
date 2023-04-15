import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseURL = "http://api.weatherapi.com/v1";
  String key = "19d5d22e92c14b7491871624230804";
  Future<WeatherModel>  getWeather({required String cityName}) async {
    Uri url = Uri.parse("$baseURL/forecast.json?key=$key&q=$cityName&days=7");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }
}


/* import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  static const String baseURL = "https://api.weatherapi.com/v1";
  static const String apiKey = "19d5d22e92c14b7491871624230804";

  Future<WeatherModel> getWeather(
      {required String cityName, int days = 7}) async {
    final uri = Uri.https(
      baseURL,
      '/forecast.json?',
      {'key': apiKey, 'q': cityName, 'days': days.toString()},
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
} */
