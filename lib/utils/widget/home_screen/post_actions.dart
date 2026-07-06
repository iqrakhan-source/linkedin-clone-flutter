import 'package:flutter/material.dart';
import 'linkedin_social_button.dart';

class PostActions extends StatelessWidget {
  final bool isLiked;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onRepost;
  final VoidCallback onSend;
  final int likes;
  final int comments;
  final int reposts;


  const PostActions({
    super.key,
    required this.isLiked,
    required this.onLike,
    required this.onComment,
    required this.onRepost,
    required this.onSend,
    required this.likes,
    required this.comments,
    required this.reposts,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: .min,
      children: [
        SizedBox(
          width: 60,
          child: LinkedInSocialButton(
            inactiveIcon: Icons.thumb_up_alt_outlined,
            activeIcon: Icons.thumb_up_alt,
            label: "$likes",
            isActive: isLiked,
            onTap: onLike,
          ),
        ),

        SizedBox(
          width: 60,
          child: LinkedInSocialButton(
            inactiveIcon: Icons.comment_outlined,
            activeIcon: Icons.comment,
            label: "$comments",
            isActive: false,
            onTap: onComment,
          ),
        ),

        SizedBox(
          width: 60,
          child: LinkedInSocialButton(
            inactiveIcon: Icons.repeat,
            activeIcon: Icons.repeat,
            label: " $reposts ",
            isActive: false,
            onTap: onRepost,
          ),
        ),

        SizedBox(
          width: 60,
          child: LinkedInSocialButton(
            inactiveIcon: Icons.send_outlined,
            activeIcon: Icons.send,
            label: "",
            isActive: false,
            onTap: onSend,
          ),
        ),
      ],
    );
  }
}