import 'package:flutter/material.dart';
import '../../../models/catch_up/catchup_model.dart';
import '../../constant/catch_up_types.dart';

class CatchUpCard extends StatelessWidget {
  final CatchUpModel item;

  const CatchUpCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String title;

    if (item.type == CatchUpType.jobChanges) {
      title = "${item.name} ${item.title}";
    } else {
      title = "${item.name} ${item.title} ${item.duration}";
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.green.shade100,
            child: const Icon(
              Icons.person,
              color: Colors.green,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 6),

                Text(item.headline),

                if (item.company != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(item.company!),
                  ),

                if (item.duration != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(item.duration!),
                  ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(item.actionText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}