import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/Weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'b465da5c75b6471cadf153806242204';

  WeatherService({required this.dio});

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      var json = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(json);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Oops there was an error , try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there was an error , try later');
    }
  }
}
