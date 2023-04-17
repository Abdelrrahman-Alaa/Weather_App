import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main(List<String> args) {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);
  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Provider.of<WeatherProvider>(context)
                .weatherData!
                .getThemeColor()),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

/* 
import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const HomePage(),
    );
  }
}
 */