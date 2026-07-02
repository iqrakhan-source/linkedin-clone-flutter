import 'package:flutter/material.dart';
import '../../data/dummy/catch_up_dummy_data.dart';
import '../../widget/catch_up/catch_up_card.dart';
import '../../widget/catch_up/filter_chip.dart';

class CatchUpScreen extends StatefulWidget {
  const CatchUpScreen({super.key});

  @override
  State<CatchUpScreen> createState() => _CatchUpScreenState();
}

class _CatchUpScreenState extends State<CatchUpScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredData = catchUpDummyData
        .where((item) =>
    _selectedFilter == 'All' || item.type == _selectedFilter)
        .toList();

    return Column(
      children: [
        _buildFilterBar(),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              return CatchUpCard(item: filteredData[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16),
            _chip('All'),
            const SizedBox(width: 8),
            _chip('Job changes'),
            const SizedBox(width: 8),
            _chip('Work anniversaries'),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label) {
    return FilterChipItem(
      label: label,
      isSelected: _selectedFilter == label,
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
    );
  }
}