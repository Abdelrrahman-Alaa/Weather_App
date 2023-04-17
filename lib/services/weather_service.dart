import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String _baseURL = "http://api.weatherapi.com/v1";
  final String _key = "19d5d22e92c14b7491871624230804";

  Future<WeatherModel> getWeather({required String cityName}) async {
    final url =
        Uri.parse("$_baseURL/forecast.json?key=$_key&q=$cityName&days=7");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to get weather data");
    }

    final Map<String, dynamic> data = jsonDecode(response.body);
    late final WeatherModel weatherModel;
    weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }
}
/* import 'dart:convert';
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
 */

