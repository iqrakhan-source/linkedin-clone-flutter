import 'package:flutter/material.dart';

class ManageNetworkScreen extends StatefulWidget {
  const ManageNetworkScreen({super.key});

  @override
  State<ManageNetworkScreen> createState() => _ManageNetworkScreenState();
}

class _ManageNetworkScreenState extends State<ManageNetworkScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {
      "icon": Icons.people_outline,
      "title": "Connections",
      "count": "245",
    },
    {
      "icon": Icons.contact_phone_outlined,
      "title": "Contacts",
      "count": "",
    },
    {
      "icon": Icons.person_add_alt_1_outlined,
      "title": "Following & followers",
      "count": "",
    },
    {
      "icon": Icons.groups_outlined,
      "title": "Groups",
      "count": "",
    },
    {
      "icon": Icons.event_outlined,
      "title": "Events",
      "count": "",
    },
    {
      "icon": Icons.business_outlined,
      "title": "Pages",
      "count": "",
    },
    {
      "icon": Icons.newspaper_outlined,
      "title": "Newsletters",
      "count": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Manage my network",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.separated(
        itemCount: menuItems.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: Colors.grey.shade300,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];

          return ListTile(
            leading: Icon(
              item["icon"],
              color: Colors.grey.shade700,
            ),
            title: Text(
              item["title"],
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item["count"] != "")
                  Text(
                    item["count"],
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right),
              ],
            ),
            onTap: () {
              // TODO: Navigate to corresponding page
            },
          );
        },
      ),
    );
  }
}