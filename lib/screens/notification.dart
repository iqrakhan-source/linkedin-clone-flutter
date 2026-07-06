import 'package:flutter/material.dart';

import '../models/grow/connection_model.dart';

class NotificationPage extends StatefulWidget {
  final List<ConnectionModel> data;
  const NotificationPage({super.key, required this.data} );

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String _selectedFilter = 'All';

  // Define your custom notification filters here
  final List<String> _filters = const ['All', 'My posts', 'Mentions', 'Jobs'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. THE HORIZONTAL FILTER CHIPS
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  ..._filters.map((chipName) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: _buildFilterChip(chipName),
                    );
                  }).toList(),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),

          // 2. THE ACTUAL LIST CONTENT
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: 15,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green.shade100,
                          // Your profile image asset stays safely here
                          child: Image.asset("assets/images/profileman.png"),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Notification Alert #$index',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text('Currently viewing active filter: $_selectedFilter'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String chipName) {
    bool isSelected = _selectedFilter == chipName;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = chipName;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade800 : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: Colors.grey.shade400),
        ),
        child: Text(
          chipName,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
