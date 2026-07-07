import 'package:flutter/material.dart';
import 'package:linkednc/models/post_model.dart';
import 'package:linkednc/utils/sheet/post_menu_sheet.dart';
import 'time_formatter.dart';
class PostHeader extends StatelessWidget {
  final PostModel post;

  const PostHeader({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: post.author.profileImage.startsWith('http')
                ? NetworkImage(post.author.profileImage)
                : AssetImage(post.author.profileImage) as ImageProvider,
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.author.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),

                Text(
                  post.author.headline,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.2,
                    color: Colors.grey.shade700,
                  ),
                ),

                Row(
                  children: [
                    Text(
                    formatPostTime(post.time),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.public,
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ],
            ),
          ),

        IconButton(
          visualDensity: VisualDensity.compact,
          splashRadius: 20,
          icon: Icon(
            Icons.more_vert,
            size: 20,
            color: Colors.grey.shade700,
          ),
            onPressed: () async {
              final result = await openPostMenu(context);
              // for now just debug
              debugPrint("Selected: $result");
            },
          ),
        ],
      ),
    );
  }
}