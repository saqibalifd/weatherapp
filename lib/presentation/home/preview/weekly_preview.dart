import 'package:flutter/material.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';
import 'package:weatherapp/presentation/home/widgets/hourly_card.dart';

import '../../../constants/app_icons.dart';
import '../widgets/air_quality_card.dart';
import '../widgets/common_card.dart';
import '../widgets/pressure_card.dart';
import '../widgets/sunrise_card.dart';
import '../widgets/uv_index_card.dart';
import '../widgets/wind_card.dart';

class WeeklyPreview extends StatelessWidget {
  final List hourlyData;
  final List weatherData;
  const WeeklyPreview(
      {super.key, required this.hourlyData, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.screenHeight * .03,
      children: [
        SizedBox(
          height: context.screenHeight * .24,
          child: ListView.builder(
            itemCount: hourlyData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.screenWidth * .02),
                child: HourlyCard(
                    isNow: hourlyData[index]['isNow'],
                    time: hourlyData[index]['time'],
                    rainChances: hourlyData[index]['rainChances'],
                    temprature: hourlyData[index]['temprature']),
              );
            },
          ),
        ),
        AirQualityCard(
          percentage: weatherData.first['airQuality'],
        ),
        SizedBox(
          height: context.screenHeight * 1,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * .02),
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                //uv index
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * .02,
                      vertical: context.screenHeight * .01),
                  child: UvIndexCard(
                    uvIndex: weatherData.first['uvIndex'],
                  ),
                ),
                //sunrise
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * .02,
                      vertical: context.screenHeight * .01),
                  child: SunriseCard(
                    sinriseValue: weatherData.first['sunriseValue'],
                  ),
                ),
                //wind
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * .02,
                      vertical: context.screenHeight * .01),
                  child: WindCard(
                      windSpeed: weatherData.first['windSpeed'].toString()),
                ),
                //rainfall
                CommonCard(
                  iconPath: AppIcons.rain,
                  name: 'RAINFALL',
                  title: '${weatherData.first['LHRainFallInMM']} mm',
                  body: 'in last hour',
                  subtitle:
                      '${weatherData.first['fullDayRainFallInMM']}  mm expected in next 24 hours.',
                ),
                //feels like
                CommonCard(
                  iconPath: AppIcons.temprature,
                  name: 'FEELS LIKE',
                  title: '${weatherData.first['feelsLike']}°',
                  subtitle: 'Similar to the actual temprature.',
                ),
                //humidity
                CommonCard(
                  iconPath: AppIcons.humidity,
                  name: 'HUMIDITY',
                  title: '${weatherData.first['humidity']}%',
                  subtitle: 'The diw point is 17 right now.',
                ),
                //visibility
                CommonCard(
                  iconPath: AppIcons.visibility,
                  name: 'VISIBILITY',
                  title: '${weatherData.first['visibility']}km',
                  subtitle: 'Similar to the actual temprature.',
                ),
                //pressure
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * .02,
                      vertical: context.screenHeight * .01),
                  child: PressureCard(
                    progress: .9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
