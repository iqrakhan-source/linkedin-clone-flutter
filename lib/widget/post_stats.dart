import 'package:flutter/material.dart';

class PostStats extends StatelessWidget {
  final int likes;
  final int comments;
  final int reposts;

  const PostStats({
    super.key,
    required this.likes,
    required this.comments,
    required this.reposts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '👍 ❤️ $likes',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            '$comments comments • $reposts reposts',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}