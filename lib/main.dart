import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Views/Homepage.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather-states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: Homepage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.blue;
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
      return Colors.lightBlue;
    case 'Patchy rain possible':
      return Colors.lightBlue;
    case 'Patchy snow possible':
      return Colors.cyan;
    case 'Patchy sleet possible':
      return Colors.cyan;
    case 'Patchy freezing drizzle possible':
      return Colors.cyan;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    case 'Blowing snow':
      return Colors.cyan;
    case 'Blizzard':
      return Colors.lightBlue;
    case 'Fog':
      return Colors.grey;
    case 'Freezing fog':
      return Colors.lightBlue;
    case 'Patchy light drizzle':
      return Colors.lightBlue;
    case 'Light drizzle':
      return Colors.lightBlue;
    case 'Freezing drizzle':
      return Colors.cyan;
    case 'Heavy freezing drizzle':
      return Colors.cyan;
    case 'Patchy light rain':
      return Colors.lightBlue;
    case 'Light rain':
      return Colors.lightBlue;
    case 'Moderate rain at times':
      return Colors.blue;
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain at times':
      return Colors.blue;
    case 'Heavy rain':
      return Colors.blue;
    case 'Light freezing rain':
      return Colors.cyan;
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;
    case 'Light sleet':
      return Colors.cyan;
    case 'Moderate or heavy sleet':
      return Colors.cyan;
    case 'Patchy light snow':
      return Colors.lightBlue;
    case 'Light snow':
      return Colors.lightBlue;
    case 'Patchy moderate snow':
      return Colors.lightBlue;
    case 'Moderate snow':
      return Colors.lightBlue;
    case 'Patchy heavy snow':
      return Colors.cyan;
    case 'Heavy snow':
      return Colors.cyan;
    case 'Ice pellets':
      return Colors.cyan;
    case 'Light rain shower':
      return Colors.lightBlue;
    case 'Moderate or heavy rain shower':
      return Colors.blue;
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Light sleet showers':
      return Colors.cyan;
    case 'Moderate or heavy sleet showers':
      return Colors.cyan;
    case 'Light snow showers':
      return Colors.lightBlue;
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'Light showers of ice pellets':
      return Colors.cyan;
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;
    case 'Patchy light rain with thunder':
      return Colors.purple;
    case 'Moderate or heavy rain with thunder':
      return Colors.purple;
    case 'Patchy light snow with thunder':
      return Colors.lightBlue;
    case 'Moderate or heavy snow with thunder':
      return Colors.lightBlue;
    default:
      return Colors.grey;
  }
}
