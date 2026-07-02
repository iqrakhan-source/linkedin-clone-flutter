import 'package:flutter/material.dart';
import '../screens/profile/post_card.dart';
import 'linkedin_social_button.dart';

class PostActions extends StatelessWidget {
  final bool isLiked;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onRepost;
  final VoidCallback onSend;

  const PostActions({
    super.key,
    required this.isLiked,
    required this.onLike,
    required this.onComment,
    required this.onRepost,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          LinkedInSocialButton(
            inactiveIcon: Icons.thumb_up_alt_outlined,
            activeIcon: Icons.thumb_up_alt,
            label: "Like",
            isActive: isLiked,
            onTap: onLike,
          ),

          LinkedInSocialButton(
            inactiveIcon: Icons.comment_outlined,
            activeIcon: Icons.comment,
            label: "Comment",
            isActive: false,
            onTap: onComment,
          ),

          LinkedInSocialButton(
            inactiveIcon: Icons.repeat,
            activeIcon: Icons.repeat,
            label: "Repost",
            isActive: false,
            onTap: onRepost,
          ),

          LinkedInSocialButton(
            inactiveIcon: Icons.send_outlined,
            activeIcon: Icons.send,
            label: "Send",
            isActive: false,
            onTap: onSend,
          ),
        ],
      ),
    );
  }
}