import 'package:flutter/material.dart';
import 'package:linkednc/utils/widget/home_screen/comment_list.dart';
import 'package:linkednc/utils/widget/home_screen/comment_list.dart';

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: commentController,
                  autofocus: true,
                  minLines: 1,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Add a comment...",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(
                        color: Color(0xFF0A66C2),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              FilledButton(
                onPressed: () {
                  if (commentController.text.trim().isNotEmpty) {
                    Navigator.pop(
                      context,
                      commentController.text.trim(),
                    );
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF0A66C2),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                ),
                child: const Text("Post"),
              ),
            ],
          ),

          const SizedBox(height: 12),
        ],
      ),
    ),
  );
}