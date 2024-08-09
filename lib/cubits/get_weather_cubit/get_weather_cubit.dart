import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/Weather_model.dart';
import 'package:weather_app/Services/Weather_service.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather-states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel ?weatherModel;

  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherService(dio: Dio()).getWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
