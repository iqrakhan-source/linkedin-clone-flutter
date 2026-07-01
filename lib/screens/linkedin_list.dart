import 'package:flutter/material.dart';

class LinkedInListScreen extends StatefulWidget {
  final List<String> filters;
  final String pageContext;

  const LinkedInListScreen({
    super.key,
    required this.filters,
    required this.pageContext,
  });

  @override
  State<LinkedInListScreen> createState() => _LinkedInListScreenState();
}

class _LinkedInListScreenState extends State<LinkedInListScreen> {
  late String _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.filters.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //HORIZONTAL CHIPS
        Container(
         color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 16),
                // This loop automatically renders a chip for every string in your list
                ...widget.filters.map((chipName) {
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

        //CONTENT LIST
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: 10,
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
                        child: Icon(Icons.notifications, color: Colors.green.shade800),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.pageContext} Update $index',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text('Filtering by: $_selectedFilter'),
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
          color: isSelected ? Colors.green.shade800 :
          Colors.transparent,
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
