import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_colors.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/extension/gradient_underline_tab_indicator.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';
import 'package:weatherapp/widgets/glassmorphism_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  final DraggableScrollableController sheetController;
  List<Widget> hourlyPreview;
  List<Widget> weeklyPreview;
  BottomSheetWidget(
      {super.key,
      required this.sheetController,
      required this.hourlyPreview,
      required this.weeklyPreview});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: widget.sheetController,
      initialChildSize: .4,
      minChildSize: 0.4,
      maxChildSize: 1.0,
      snap: true,
      snapSizes: const [0.5, 1.0],
      builder: (BuildContext context, ScrollController scrollController) {
        return GlassmorphismWidget(
          blur: 14,
          opacity: 0.6,
          borderRadius: 20,
          color: AppColors.charocalIndigo,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                // Handle bar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: context.screenWidth * .14,
                    height: context.screenHeight * .01,
                    decoration: BoxDecoration(
                      color: AppColors.charocalIndigo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                // TabBar
                TabBar(
                  dividerColor: AppColors.charocalIndigo,
                  indicator: GradientUnderlineTabIndicator(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.background,
                        AppColors.background,
                        Colors.transparent
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    width: 100,
                    height: 3,
                  ),
                  labelColor: Colors.transparent,
                  isScrollable: false,
                  controller: tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        'Hourly Forecast',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppFonts.sfProDisplay,
                            fontWeight: AppFonts.bold,
                            color: AppColors.darkQuantiary),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Weekly Forecast',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppFonts.sfProDisplay,
                            fontWeight: AppFonts.bold,
                            color: AppColors.darkQuantiary),
                      ),
                    ),
                  ],
                ),

                // TabBarView
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView(
                          physics: const BouncingScrollPhysics(),
                          controller: scrollController,
                          children: widget.hourlyPreview),
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        controller: scrollController,
                        children: widget.weeklyPreview,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
