/* import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatefulWidget {
  SearchPage({this.updateUI});
  VoidCallback? updateUI;
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String cityName;
  late WeatherModel weather;

  Future<void> _getWeather() async {
    WeatherService service = WeatherService();
    weather = await service.getWeather(cityName: cityName);
    weatherData = weather;
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (data) => cityName = data,
            onSubmitted: (data) async {
              cityName = data;
              await _getWeather();
              setState(() {});
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                label: Text("search"),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
                hintText: "Enter a city"),
          ),
        ),
      ),
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUI});
  VoidCallback? updateUI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                label: Text("search"),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
                hintText: "Enter a city"),
          ),
        ),
      ),
    );
  }
}
