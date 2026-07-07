import 'package:flutter/material.dart';
import 'package:linkednc/screens/network/grow_screen.dart';

import '../../dummy/grow/connections_dummy.dart';
import 'Recieved.dart';
import 'Sent.dart';
class InvitationManager extends StatefulWidget {
  const InvitationManager({super.key});

  @override
  State<InvitationManager> createState() => _InvitationManagerState();
}

class _InvitationManagerState extends State<InvitationManager> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text(
            "Invitations",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: TabBar(
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green.shade800,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: "Received"),
              Tab(text: "Sent"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReceivedInvitationScreen(
              data: connectionsDummyData,
            ),
            SentInvitationScreen(
              data: connectionsDummyData,
            ),
          ],
        ),
      ),
    );
  }
}