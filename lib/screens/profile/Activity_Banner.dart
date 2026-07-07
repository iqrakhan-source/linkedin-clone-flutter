import 'package:flutter/material.dart';

import '../../models/post_model.dart';

class ActivityBanner extends StatelessWidget {
  final  String text;

  const ActivityBanner({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
    IconButton(
    visualDensity: VisualDensity.compact,
    splashRadius: 20,
    icon: Icon(
    Icons.more_vert,
    size: 20,
    color: Colors.grey.shade700,
    ),onPressed: (){},),
          IconButton(
            visualDensity: VisualDensity.compact,
            splashRadius: 20,
            icon: Icon(
              Icons.close,
              size: 20,
              color: Colors.grey.shade700,
            ),onPressed: (){},)
        ],
      ),
    );
  }
}