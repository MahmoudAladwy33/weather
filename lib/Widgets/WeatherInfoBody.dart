import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/Weather_model.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class Weatherinfobody extends StatelessWidget {
  const Weatherinfobody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getThemeColor(weatherModel.condition)[400]!,
              getThemeColor(weatherModel.condition)[300]!,
              getThemeColor(weatherModel.condition)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  weatherModel.cityName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  ('Updated at ${weatherModel.date.hour} :${weatherModel.date.minute} '),
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    weatherModel.img.contains("https:")
                        ? Image.network(weatherModel.img)
                        : Image.network(
                            "https:${weatherModel.img}",
                          ),
                    Text(
                      weatherModel.avgTemp.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Maxtemp: ${weatherModel.maxTemp.round()}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Mintemp: ${weatherModel.minTemp.round()}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  weatherModel.condition,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
