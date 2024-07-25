import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/views/hourly_forecast_view.dart';

import '../constants/text_styles.dart';
import '../views/weekly_forecast_view.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
         
          Align(
            alignment: Alignment.center,
              child: Text('Forecast Report', style: TextStyles.h1,)),
          const SizedBox(height:40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today', style: TextStyles.h2),
              Text(DateTime.now().dateTime, style: TextStyles.subtitleText,),
            ],
          ),
          const SizedBox(height: 20),
          const HourlyForecastView(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text('Next Forecast', style: TextStyles.h1),
              Icon(Icons.calendar_month_outlined,color: Colors.white,),
            ],
          ),
          const SizedBox(height: 20),

          // Weekly forecast
          const WeeklyForecastView(),

        ],
      )
    );


  }
  }