import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_colors.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_icons.dart';
import 'package:weatherapp/constants/app_images.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';
import 'package:weatherapp/view/cities_weather_screen.dart';
import 'package:weatherapp/widgets/bottom_navigation_bar.dart';
import 'package:weatherapp/widgets/bottom_sheet_widget.dart';
import 'package:weatherapp/widgets/cards/hourly_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

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
            hourlyPreview: [HourlyPreview()],
            weeklyPreview: [WeeklyPreview()],
          ),

          // bottom navigation bar
          BottomNavigationBarWidget(
            onLocationTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CitiesWeatherScreen(),
                  ));
              print('on list tap');
            },
            onPlusTap: () {
              print('on plus tap');
            },
            onListTap: () {
              print('on location tap');
            },
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

class HourlyPreview extends StatelessWidget {
  const HourlyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HourlyCard(
            time: '12 PM', svgIconPath: AppIcons.location, temprature: '19°'),
        // Row(
        //   spacing: 10,
        //   children: [
        //     SizedBox(
        //       width: 10,
        //     ),
        //     HourlyCard(
        //         time: '12 PM',
        //         svgIconPath: AppIcons.location,
        //         temprature: '19°'),
        //     HourlyCard(
        //         time: '12 PM',
        //         svgIconPath: AppIcons.location,
        //         color: AppColors.purpleNavy,
        //         temprature: '19°'),
        //     HourlyCard(
        //         time: '12 PM',
        //         svgIconPath: AppIcons.location,
        //         temprature: '19°'),
        //     HourlyCard(
        //         time: '12 PM',
        //         svgIconPath: AppIcons.location,
        //         temprature: '19°'),
        //   ],
        // )
      ],
    );
  }
}

class WeeklyPreview extends StatelessWidget {
  const WeeklyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
