import 'package:flutter/material.dart';

class CatchUp extends StatefulWidget {
  const CatchUp({super.key});

  @override
  State<CatchUp> createState() => _catchupState();
}

class _catchupState extends State<CatchUp> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //THE HORIZONTAL FILTER CHIPS
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  _buildFilterChip('All'),
                  const SizedBox(width: 8),
                  _buildFilterChip('Job changes'),
                  const SizedBox(width: 8),
                  _buildFilterChip('Work anniversaries'),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
          // THE ACTUAL LIST CONTENT
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green.shade100,
                          child: Image.asset("assets/images/profileman.png")
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$index',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(' $_selectedFilter'),
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
    );
  }

  //  to build the selectable LinkedIn
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
