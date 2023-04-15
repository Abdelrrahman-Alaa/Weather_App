class WeatherModel {
  String date;
  String temp;
  String minTemp;
  String maxTemp;
  String weatherStatement;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherStatement,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    print(jsonData);
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
    return 'Temp = $temp Min Temp = $minTemp Max Temp = $maxTemp Date = $date';
  }
}

/* 
class WeatherModel {
  late String date;
  late double temp;
  late String minTemp;
  late String maxTemp;
  late String weatherStatement;

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
    return 'Temp = $temp Min Temp = $minTemp Max Temp = $maxTemp Date = $date';
  }
}
 */