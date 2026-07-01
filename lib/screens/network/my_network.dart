// import 'package:flutter/material.dart';
// import 'catch_up.dart';
// import 'grow_screen.dart';
//
// class mynetwork extends StatefulWidget {
//   const mynetwork({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return _mynetwork();
//   }
// }
//
// class _mynetwork extends State<mynetwork> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 0,
//       length: 2,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade100,
//
//         body: Column(
//           children: [
//             TabBar(
//                     isScrollable: false,
//                     labelColor: Colors.green.shade800,
//                     unselectedLabelColor: Colors.grey.shade600,
//                     labelStyle: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     unselectedLabelStyle: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     indicatorSize: TabBarIndicatorSize.label,
//                     indicatorColor: Colors.green.shade800,
//                     indicatorWeight: 3,
//                     dividerColor: Colors.transparent,
//                     padding: EdgeInsets.zero,
//                     labelPadding: EdgeInsets.zero,
//                     tabs: const [
//                       Tab(text: "Grow"),
//                       Tab(text: "Catch up"),
//                     ],
//                   ),
//             TabBarView(children: [growscreen(), catchup()]),
//           ],
//         ),
//             ),
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:linkednc/screens/network/grow_screen.dart';

import 'catch_up.dart';
import '../linkedin_list.dart';

class MyNetworkScreen extends StatefulWidget {
  const MyNetworkScreen({super.key});

  @override
  State<MyNetworkScreen> createState() => _MyNetworkScreenState();
}

class _MyNetworkScreenState extends State<MyNetworkScreen> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: TabBar(
                labelColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.green.shade800,
                      indicatorWeight: 3,
                     dividerColor: Colors.transparent,
                        labelStyle: const TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.bold,
                       ),
                       unselectedLabelStyle: const TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.bold,
                       ),
                tabs: [
                  Tab(text: "Grow",),
                  Tab(text: "Catch up"),
                ],
              ),
            ),
            Expanded(child: TabBarView(children: [Growscreen(),  LinkedInListScreen(
              pageContext: 'Catch Up',
              filters: const ['All', 'Job changes', 'Work anniversaries'],
            ),]))
          ],
        ),
      ),
    );
  }
}
