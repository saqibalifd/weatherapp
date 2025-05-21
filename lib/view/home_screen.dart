import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_colors.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_images.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';
import 'package:weatherapp/view/test_screen.dart';
import 'package:weatherapp/widgets/bottom_navigation_bar.dart';
import 'package:weatherapp/widgets/bottom_sheet_widget.dart';

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
          Image.asset(
            AppImages.homeBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.screenHeight * .14,
                ),
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
                SizedBox(
                  height: context.screenHeight * .05,
                ),
                Image.asset(AppImages.housePic),
              ],
            ),
          ),
          BottomSheetWidget(
            sheetController: _sheetController,
            hourlyPreview: [HourlyPreview()],
            weeklyPreview: [Text('hello heheheh')],
          ),
          BottomNavigationBarWidget(
            onLocationTap: () {
              print('on list tap');
            },
            onPlusTap: () {
              print('on plus tap');
            },
            onListTap: () {
              print('on location tap');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestScreen(),
                  ));
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

class HourlyPreview extends StatelessWidget {
  const HourlyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('hello')],
    );
  }
}
