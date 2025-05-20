import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_colors.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';
import 'package:weatherapp/widgets/glassmorphism_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  final List<Widget> childeren;
  final DraggableScrollableController sheetController;
  const BottomSheetWidget(
      {super.key, required this.childeren, required this.sheetController});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
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
                      topRight: Radius.circular(30))),
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

                  Expanded(
                    child: Expanded(
                        child: ListView(
                      physics: BouncingScrollPhysics(),
                      controller: scrollController,
                      children: [
                        TabBar(
                            indicator: const BoxDecoration(),
                            dividerColor: Colors.white,
                            isScrollable: false,
                            controller: tabController,
                            tabs: [
                              Text(
                                'Hourly Forecast',
                                style: TextStyle(color: AppColors.background),
                              ),
                              Text(
                                'Weekly Forecast',
                                style: TextStyle(color: AppColors.background),
                              ),
                              Expanded(
                                child: TabBarView(
                                    controller: tabController,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.green,
                                      ),
                                      Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.red,
                                      ),
                                    ]),
                              )
                            ])
                      ],
                    )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
