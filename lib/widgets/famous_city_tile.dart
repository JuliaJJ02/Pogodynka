//this is the consumer widget

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/providers/city_weather_provider.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';

import '../constants/app_colors.dart';
import '../constants/text_styles.dart';

class FamousCityTile extends ConsumerWidget{
  const FamousCityTile({super.key, required this.city, required this.index});

  final String city;
  final int index;

//1st of all - get our weather data
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(cityForecastProvider(city));
    //here we define what should happen in each case (loading/error etc)
    return weatherData.when(
        //here what will happen when we have a data
        data: (weather) {
          return Material(
            color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
            elevation: index == 0 ? 8 : 0,
            borderRadius: BorderRadius.circular(25.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 12,
          ),
          //now we need to build a column (list of children)
          //inside the child we have another child (row inside the cell,
            // to determine when where which info is displayed inside the cell)

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
          children: [
            Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text(
                '${weather.main.temp.toDouble().round().toString()}°',
                style: TextStyles.h2,
            ),
            //and now some space and then, weather condition
            const SizedBox(height: 12),
            Text(
              weather.weather[0].description,
              style: TextStyles.subtitleText,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            ],
            ),
            ),
            //take a look on lib-> utils -> get weather icon
            //take the asset (image), set the size of it
            Image.asset(getWeatherIcon(weatherCode: weather.weather[0].id),
              width: 50,
            ),

          ],
          ),
            //inside the column and after the row we need to display the name of the city
            Text(
            weather.name,
            style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.8),
            fontWeight: FontWeight.w400,
          ),
            )
          ],
          ),
          ),
          );
        },
        error: (error, stackTrace){
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    );
  }

}