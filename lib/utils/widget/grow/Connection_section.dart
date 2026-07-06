import 'package:flutter/material.dart';
import '../../dummy/grow/connections_dummy.dart';
import 'connection_card.dart';

class ConnectionsSection extends StatelessWidget {
  const ConnectionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Look for people to connect",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle_rounded,
                  size: 20,
                ),
                label: const Text("Connect"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 245,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: connectionsDummyData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ConnectionCard(
                    connection: connectionsDummyData[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}