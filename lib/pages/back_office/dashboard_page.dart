import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/navigation_service.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationService = Provider.of<NavigationService>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Admin Login'),
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     // Center vertically
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     // Center horizontally
        //     children: [
        //       ElevatedButton(
        //         onPressed: () {
        //           navigationService.goBack(); // Go back to the previous page
        //         },
        //         child: Text('Go Back'),
        //       ),
        //       Text('Welcome to the Back Office Login Page!'),
        //     ],
        //   ),
        // )
      // body: LayoutBuilder(
      //   builder: (context, constraints) {
      //     return Column(
      //       children: [
      //         // First section - at the top
      //         Container(
      //           padding: EdgeInsets.all(16.0),
      //           child: Row(
      //             children: [
      //               Icon(Icons.home),
      //               SizedBox(width: 8.0),
      //               Text('Top Section'),
      //             ],
      //           ),
      //         ),
      //
      //         // Middle section - evenly spaced and scrollable
      //         Expanded(
      //           child: SingleChildScrollView(
      //             child: Container(
      //               padding: EdgeInsets.all(16.0),
      //               child: Column(
      //                 children: List.generate(10, (index) {
      //                   return Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Card(
      //                       child: ListTile(
      //                         title: Text('Item $index'),
      //                       ),
      //                     ),
      //                   );
      //                 }),
      //               ),
      //             ),
      //           ),
      //         ),
      //
      //         // Third section - at the bottom
      //         Container(
      //           padding: EdgeInsets.all(16.0),
      //           child: Row(
      //             children: [
      //               Icon(Icons.info),
      //               SizedBox(width: 8.0),
      //               Text('Bottom Section'),
      //             ],
      //           ),
      //         ),
      //       ],
      //     );
      //   },
      // ),

      body: Row(
        children: [
          // First part of the screen (half of the screen)
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // First section - at the top
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.home, size: 30),
                      SizedBox(width: 8.0),
                      Text('Top Section', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                // Second section - evenly spaced and scrollable
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: List.generate(10, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                title: Text('Item $index'),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                // Third section - at the bottom
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.info, size: 30),
                      SizedBox(width: 8.0),
                      Text('Bottom Section', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Second part of the screen with a blue background
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Store Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network('https://upload.wikimedia.org/wikipedia/commons/4/45/App_Store_logo_and_wordmark.png', width: 100, height: 100),
                      SizedBox(height: 10),
                      Text('Download from App Store', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  SizedBox(width: 40), // Spacing between columns
                  // Play Store Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network('https://upload.wikimedia.org/wikipedia/commons/5/58/Google_Play_Logo_2015.svg', width: 100, height: 100),
                      SizedBox(height: 10),
                      Text('Download from Play Store', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
