import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/providers/current_weather_provider.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/views/hourly_forecast_view.dart';
import 'package:weather_app_tutorial/views/weather_info.dart';

import '../constants/text_styles.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData =ref.watch(currentWeatherProvider);

    //then return our provider
    // we can use when , because our data is async values
    return weatherData.when(
        data: (weather) {
          //return gradient background
          return GradientContainer(
              children: [
               const SizedBox(width: double.infinity),
                //text style is from the text styles package
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(weather.name, style: TextStyles.h1,
                ),
                const SizedBox(height: 20),
                //lib -> extensions -> datetime.dart for the date format
                Text(DateTime.now().dateTime,
                  style: TextStyles.subtitleText,
                ),

                const SizedBox(height: 30),

                //now image, according to the weather prediction we need to adjust the source (replace all with the d)
                SizedBox(height: 260, child: Image.asset(
                    'assets/icons/${weather.weather[0].icon.replaceAll('n','d')}.png')
                  ,),
                const SizedBox (height:40),
                //now there would be our description

                Text(weather.weather[0].description,
                  style: TextStyles.h2,
                ),
              ],
            ),
                const SizedBox (height: 40),

                WeatherInfo(
                  weather: weather,
                ),

                const SizedBox(height: 40),
                ///hourly weather forecast
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyles.h2,
                    ),
                    TextButton(onPressed: () {},
                      child: const Text ('View full forecast'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                const HourlyForecastView(),
              ],
          );
        },
        error: (error, stackTrace) {
          return  Center(
            child: Text(error.toString()),
          );
        },
        //here we return the circular progress
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    );
  }
}