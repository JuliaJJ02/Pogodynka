//class famous city, that is taking 3 parameters

class FamousCity {
  final String name;
  final double lat;
  final double lon;

  const FamousCity({
    required this.name,
    required this.lat,
    required this.lon,
  });
}

// List of famous cities as a constant, with Lattitude and Longtittude
List<FamousCity> famousCities = const [
  FamousCity(name: 'Barcelona', lat: 41.39, lon: 2.154),
  //FamousCity(name: 'Rome', lat:  41.903, lon: 12.496),
  FamousCity(name: 'Cracow', lat: 50.0497, lon: 19.94),
  FamousCity(name: 'Paris', lat: 48.85, lon: 2.3333),
  FamousCity(name: 'London', lat: 51.4833, lon: -0.0833),
  FamousCity(name: 'New York', lat: 40.7167, lon: -74.0167),
  FamousCity(name: 'Venice', lat: 45.438759, lon: 12.327145),
  //FamousCity(name: 'Rome', lat:  41.903, lon: 12.496),
];