//different the others providers, because this one requires the parameter
// to have the parameter we needed to add the 'family' to auto dispose below
//family has 2 data types <1 - data we return, 2 - type of our arg so String>


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/models/weather.dart';
import '/services/api_helper.dart';

final cityForecastProvider = FutureProvider.autoDispose.family<Weather, String>(
      (ref, cityName) => ApiHelper.getWeatherByCityName(
    cityName: cityName,
  ),
);