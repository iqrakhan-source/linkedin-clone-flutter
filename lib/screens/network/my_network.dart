
import 'package:flutter/material.dart';
import 'package:linkednc/screens/network/grow_screen.dart';
import '../../utils/dummy/grow/connections_dummy.dart';
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
            Expanded(child: TabBarView(children: [Growscreen(data: connectionsDummyData,),
              const CatchUpScreen(),
          ],
        ),
      )
      ],
    )
    )
    );
  }
}
