import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_colors.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_images.dart';
import 'package:weatherapp/data/dummy_data_services.dart';
import 'package:weatherapp/presentation/cities/view/cities_weather_screen.dart';
import 'package:weatherapp/presentation/home/preview/weekly_preview.dart';
import 'package:weatherapp/presentation/home/widgets/bottom_navigation_bar.dart';
import 'package:weatherapp/presentation/home/widgets/bottom_sheet_widget.dart';

import '../preview/hourly_preview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  final DummyDataServices dummyDataServices = DummyDataServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background image
          Image.asset(
            AppImages.homeBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          //background text
          Center(child: headingText()),
          //bottom sheet
          BottomSheetWidget(
            sheetController: _sheetController,
            hourlyPreview: [
              HourlyPreview(
                hourlyData: dummyDataServices.hourlyData,
                weatherData: dummyDataServices.weatherData,
              )
            ],
            weeklyPreview: [
              WeeklyPreview(
                hourlyData: dummyDataServices.hourlyData,
                weatherData: dummyDataServices.weatherData,
              )
            ],
          ),

          // bottom navigation bar
          BottomNavigationBarWidget(
            onLocationTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CitiesWeatherScreen(),
                  ));
            },
            onPlusTap: () {},
            onListTap: () {},
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }
}

Widget headingText() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Montreal',
        style: TextStyle(
            fontSize: 34,
            fontFamily: AppFonts.sfProDisplay,
            fontWeight: AppFonts.regular,
            color: AppColors.background),
      ),
      Text(
        '19' '°',
        style: TextStyle(
            fontSize: 90,
            fontFamily: AppFonts.sfProDisplay,
            fontWeight: AppFonts.thin,
            color: AppColors.background),
      ),
      Text(
        'Mostly Clear',
        style: TextStyle(
            fontSize: 20,
            fontFamily: AppFonts.sfProDisplay,
            fontWeight: AppFonts.semiBold,
            color: AppColors.lavenderMist),
      ),
      Text(
        'H:24° L:18°',
        style: TextStyle(
            fontSize: 20,
            fontFamily: AppFonts.sfProDisplay,
            fontWeight: AppFonts.semiBold,
            color: AppColors.background),
      ),
      Image.asset(AppImages.housePic),
    ],
  );
}
