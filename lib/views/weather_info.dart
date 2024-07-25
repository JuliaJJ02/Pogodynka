//here it would be stateless widget

import 'package:flutter/cupertino.dart';
import 'package:weather_app_tutorial/extensions/double.dart';
import 'package:weather_app_tutorial/models/weather.dart';

import '../constants/text_styles.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.weather,
});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30
      ),
    child:  Row(
      //lets customize the weather info flyout
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherInfoTile(
          title: 'Temp',
          value: '${weather.main.temp}°',
        ),
        WeatherInfoTile(
          title: 'Wind',
          value: '${weather.wind.speed.kmh} km/h',
        ),
        WeatherInfoTile(
          title: 'Humidity',
          value: '${weather.main.humidity}%',
        ),
      ],
    ),
    );
  }
}

//weatherInfoTile is taking 2 parameters - title and value
class WeatherInfoTile extends StatelessWidget {
  const WeatherInfoTile({super.key, required this.title, required this.value});

  final String title;
  final String value;

  //here we just want to return the column,
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyles.subtitleText,),
        const SizedBox(height: 10),
        Text(value, style: TextStyles.h3),
      ],
    );
  }

}