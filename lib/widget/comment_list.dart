import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  final List<String> comments;

  const CommentList({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context)

  {

    print("CommentList built");

    final displayComments = comments.isEmpty
      ? [
    "Great work! 👏",
    "Looks awesome!",
    "Keep it up 🚀",
  ]
      : comments;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: displayComments.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              radius: 18,
              child: Icon(Icons.person, size: 18),
            ),
            title: const Text(
              "John Doe",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(displayComments[index]),
          );
        },
      ),
    );
  }
}