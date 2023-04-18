import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  final Function? updateUI;
  const SearchPage({Key? key, this.updateUI}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? cityName;

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
              WeatherService weatherService = WeatherService();
              WeatherModel weather =
                  await weatherService.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
              if (updateUI != null) {
                updateUI!();
              }
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(20),
              label: Text('search'),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
