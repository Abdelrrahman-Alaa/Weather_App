import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // Removed the StatefulWidget and moved the methods to the Provider class for better state management.
  // This is a stateless widget now.
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherModel? weatherData =
        context.watch<WeatherProvider>().weatherData;
    // Used context.watch<> to minimize re-renders by only rebuilding the necessary widgets.

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'There is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Searching now 🔍',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  weatherData.getThemeColor(),
                  weatherData.getThemeColor()[400]!,
                  weatherData.getThemeColor()[300]!,
                  weatherData.getThemeColor()[200]!,
                  weatherData.getThemeColor()[100]!,
                  weatherData.getThemeColor()[100]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    context.watch<WeatherProvider>().cityName!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  Text(
                    "Updated at: ${weatherData.date}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        weatherData.getImage(),
                      ),
                      Text(
                        "${weatherData.temp.toInt()}°C",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Min Temp: ${weatherData.minTemp.toInt()}°C",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Max Temp: ${weatherData.maxTemp.toInt()}°C",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weatherData.weatherStatement,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}

