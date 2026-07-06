import 'package:flutter/material.dart';

import '../../utils/constant/catch_up_types.dart';
import '../../utils/dummy/catch_up_dummy_data.dart';
import '../../utils/widget/catch_up/catch_up_card.dart';
import '../../utils/widget/catch_up/filter_chip.dart';

class CatchUpScreen extends StatefulWidget {
  const CatchUpScreen({super.key});

  @override
  State<CatchUpScreen> createState() => _CatchUpScreenState();
}

class _CatchUpScreenState extends State<CatchUpScreen> {
  String _selectedFilter = CatchUpType.all;

  final List<String> filters = [
    CatchUpType.all,
    CatchUpType.jobChanges,
    CatchUpType.workAnniversaries,
  ];

  @override
  Widget build(BuildContext context) {
    final filteredData = catchUpDummyData.where((item) {
      return _selectedFilter == CatchUpType.all ||
          item.type == _selectedFilter;
    }).toList();

    return Column(
      children: [
        _buildFilterBar(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top:6,),
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              return CatchUpCard(
                item: filteredData[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterBar() {
    return Container(
      width: .infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16),

            ...filters.map(
                  (filter) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _chip(filter),
              ),
            ),

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