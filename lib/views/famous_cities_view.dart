import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/screens/weather_detail_screen.dart';

import '../models/famous_city.dart';
import '../widgets/famous_city_tile.dart';

class FamousCitiesView extends StatelessWidget {
  const FamousCitiesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: famousCities.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        ),
      itemBuilder: (context, index) {
        final city = famousCities[index];

        //look lib->widgets->famous_city_tile
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => WeatherDetailScreen(
                  cityName: city.name,
                ),
              ),
            );
          },
          child: FamousCityTile(
            index: index,
            city: city.name,
          ),
        );
      },
    );
  }
}