import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/api_helper.dart';

//future provider (we need to import the riverpod to use that)
//inside the provider we only return the API helper
//we need this providers to clean the code + do not call our api methods inside the ui +to manage the error states
final currentWeatherProvider = FutureProvider.autoDispose(
      (ref) => ApiHelper.getCurrentWeather(),
);