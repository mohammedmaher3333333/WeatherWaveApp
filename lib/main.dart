import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wave/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_wave/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_wave/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: getThemeColor(
                      BlocProvider
                          .of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                  useMaterial3: true),
              home: const HomeView(),
            );
          },
        );
      }),
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
    case 'Partly cloudy':
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.lightBlue;
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Blizzard':
    case 'Cloudy':
    case 'Fog':
    case 'Freezing fog':
    case 'Heavy snow':
      return Colors.grey;
    case 'Thundery outbreaks possible':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Patchy light rain with thunder':
      return Colors.deepPurple;
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    default:
      return Colors.blue; // Default color if condition doesn't match any case
  }
}
