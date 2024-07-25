import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/widgets/subscript_text.dart';
import '../constants/text_styles.dart';
import '../utils/get_weather_icons.dart';
import 'package:weather_app_tutorial/providers/weekly_weather_provider.dart';

import '../constants/app_colors.dart';



class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyForecastProvider);

    return weeklyForecastData.when(
      data: (weeklyWeather) {
        return ListView.builder(
          itemCount: weeklyWeather.daily.weatherCode.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            final dayOfWeek =
                DateTime.parse(weeklyWeather.daily.time[index]).dayOfWeek;
            final date = weeklyWeather.daily.time[index];
            final temp = weeklyWeather.daily.temperature2mMax[index];
            final icon = weeklyWeather.daily.weatherCode[index];

            return WeeklyForecastTile(
              date: date,
              day: dayOfWeek,
              temp: temp.toInt(),
              icon: getWeatherIcon2(icon),
            );
          } ,
        );

          },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class WeeklyForecastTile extends StatelessWidget {
  const WeeklyForecastTile({super.key, required this.day, required this.date, required this.temp, required this.icon, });

  final String day;
  final String date;
  final int temp;
  final String icon;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.accentBlue,
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(day, style: TextStyles.h3),
              const SizedBox(height: 5),
              Text(date, style: TextStyles.subtitleText)
            ],
          ),
          SuperscriptText(
              text: temp.toString(),
              superScript: "°C",
              color: AppColors.white,
              superscriptColor: AppColors.grey),
          Image.asset(icon, width: 60,),
        ],
      ),
    );
  }
}


