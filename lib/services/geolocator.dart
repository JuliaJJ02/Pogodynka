//we use the package to get the user device live location
// in order to work we needed to add the permissions from geolocator (pub.dev site)
import 'package:geolocator/geolocator.dart';

//position is going to contain Longitude and Latitude
Future<Position> getLocation() async {
  //bool serviceEnabled;
  LocationPermission permission;

  //define our location permission
  //if the permission is not provided - we need to ask for it
  //if the permission is denied - we need to return the error
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }
  //if there is no error - we can get the current position of device
  return await Geolocator.getCurrentPosition();
}

