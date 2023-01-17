import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': 'b763c5dffbaeacd02c3b3da491601e46',
      'units' : 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);


    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
