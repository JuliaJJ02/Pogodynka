//stateless widget

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';

import '../constants/app_colors.dart';
import '../constants/text_styles.dart';
import '../views/famous_cities_view.dart';
import '../widgets/round_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class  _SearchScreenState extends State<SearchScreen>{
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //container with the list of children ('Pick location for eg)
      body: GradientContainer(
        children: [
          Text('Pick Location', style: TextStyles.h1),
          const SizedBox(height: 30),
          Text(
            'Find the area or city where you want to know the detailed weather info at this time',
            style: TextStyles.subtitleText,
          ),
          const SizedBox(height: 40),

          //now text field and location icon, 1st we need to define the row and again - list of children
          Row(
            children: [
              Expanded(
                child: RoundTextField(
                  controller: _controller,
                ),
              ),

              const SizedBox(width: 15),
              //location icon is here:
              const LocationIcon(),
            ],
          ),

          const SizedBox(height: 30),
          ///FAMOUS CITIES VIEW!
          //since this below is a view, we need to define it inside the VIEW folder
          const FamousCitiesView(),
        ],
      ),
    );
  }
}

//location icon, created and described below
//very simple widget, 1 we return container, has height specified + box decroation
class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentBlue,
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: AppColors.grey,
      ),
    );
  }
}