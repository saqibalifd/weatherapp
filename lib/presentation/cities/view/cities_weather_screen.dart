import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_icons.dart';
import 'package:weatherapp/presentation/cities/widgets/cities_weather_card.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class CitiesWeatherScreen extends StatelessWidget {
  const CitiesWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List dummyCitiesData = [
      {
        'title': '19°',
        'subtitle': 'H 24 L:18',
        'location': 'Tronto,Canada',
        'condition': 'Showers',
        'icon': AppIcons.moonCloudMidRain,
      },
      {
        'title': '19°',
        'subtitle': 'H 24 L:18',
        'location': 'Tronto,Canada',
        'condition': 'Showers',
        'icon': AppIcons.sunCloudAngleRain,
      },
      {
        'title': '19°',
        'subtitle': 'H 24 L:18',
        'location': 'Tronto,Canada',
        'condition': 'Showers',
        'icon': AppIcons.trondoBig,
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.charocalIndigo,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          _appBar(context),
          Expanded(
            child: ListView.builder(
              itemCount: dummyCitiesData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CitiesWeatherCard(
                  title: dummyCitiesData[index]['title'],
                  subtitle: dummyCitiesData[index]['subtitle'],
                  location: dummyCitiesData[index]['location'],
                  condition: dummyCitiesData[index]['condition'],
                  icon: dummyCitiesData[index]['icon'],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
//app  bar

Widget _appBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                AppIcons.back,
                color: AppColors.background,
              ),
            ),
            Text(
              'Weather',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppFonts.sfProDisplay,
                  fontWeight: AppFonts.regular,
                  color: AppColors.background),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.background,
              width: 2,
            ),
          ),
          child: Icon(
            AppIcons.more,
            color: AppColors.background,
          ),
        )
      ],
    ),
  );
}
