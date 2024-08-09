import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Widgets/NoWeatherBody.dart';
import 'package:weather_app/Views/SearchView.dart';
import 'package:weather_app/Widgets/WeatherInfoBody.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather-states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Searchview();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return Noweatherbody();
          } else if (state is WeatherLoadedState) {
            return Weatherinfobody();
          } else {
            return Text('oops There is an error');
          }
        },
      ),
    );
  }
}
