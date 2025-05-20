import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/glassmorphism_widget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();
  bool _isSheetFullScreen = false;

  @override
  void initState() {
    super.initState();
    // Open the sheet to half screen initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _sheetController.animateTo(
        0.5,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Expandable Bottom Sheet'),
      ),
      body: Stack(
        children: [
          // Main content of the home screen
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: GlassmorphismWidget(
                        blur: 10,
                        opacity: 0.6,
                        borderRadius: 20,
                        child: const SizedBox(
                            width: 300,
                            height: 200,
                            child: Center(
                              child: Text(
                                'Glassmorphism',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )))),
                const Text(
                  'Home Screen Content',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Toggle between half and full screen
                    final targetSize = _isSheetFullScreen ? 0.5 : 1.0;
                    _sheetController.animateTo(
                      targetSize,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      _isSheetFullScreen = !_isSheetFullScreen;
                    });
                  },
                  child: Text(_isSheetFullScreen
                      ? 'Show Half Sheet'
                      : 'Show Full Sheet'),
                ),
              ],
            ),
          ),
          // Bottom sheet
          // DraggableScrollableSheet(
          //   controller: _sheetController,
          //   initialChildSize: 0.5, // Initial half screen
          //   minChildSize: 0.3, // Minimum size when dragged down
          //   maxChildSize: 1.0, // Full screen
          //   snap: true,
          //   snapSizes: const [0.5, 1.0], // Snap to half or full screen
          //   builder: (BuildContext context, ScrollController scrollController) {
          //     return Container(
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: const BorderRadius.only(
          //           topLeft: Radius.circular(20),
          //           topRight: Radius.circular(20),
          //         ),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.2),
          //             blurRadius: 10,
          //             spreadRadius: 1,
          //           ),
          //         ],
          //       ),
          //       child: Column(
          //         children: [
          //           // Handle bar
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               width: 40,
          //               height: 5,
          //               decoration: BoxDecoration(
          //                 color: Colors.grey[400],
          //                 borderRadius: BorderRadius.circular(5),
          //               ),
          //             ),
          //           ),
          //           // Sheet content
          //           Expanded(
          //             child: ListView.builder(
          //               controller: scrollController,
          //               itemCount: 20,
          //               itemBuilder: (BuildContext context, int index) {
          //                 return ListTile(
          //                   title: Text('Item ${index + 1}'),
          //                 );
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
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
