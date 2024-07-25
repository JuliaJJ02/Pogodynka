// This extension convert m/s to km/h
// m/s is the default unit for wind speed in openweathermap but we need to convert it to km/h

// convert wind speed integer to string
extension ConvertWindSpeed on double {
  String get kmh => (this * 3.6).toStringAsFixed(2);
}
