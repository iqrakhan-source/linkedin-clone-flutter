import 'package:flutter/material.dart';
import 'package:linkednc/utils/widget/comment_list.dart';
import 'package:linkednc/utils/widget/comment_list.dart';

Future<String?> openCommentSheet(BuildContext context, List<String> comments,) {

  final TextEditingController commentController = TextEditingController();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),const SizedBox(height: 12),

          CommentList(
            comments: comments,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: commentController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Add a comment...",
              border: InputBorder.none,
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: () {
                if (commentController.text.trim().isNotEmpty) {
                  Navigator.pop(
                    context,
                    commentController.text.trim(),
                  );
                }
              },
              child: const Text("Post"),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    ),
  );
}