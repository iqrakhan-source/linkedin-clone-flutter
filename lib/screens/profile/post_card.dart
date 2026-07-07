
import 'package:flutter/material.dart';
import 'package:linkednc/models/post_model.dart';
import 'package:linkednc/utils/widget/home_screen/post_actions.dart';
import '../../utils/sheet/comment_sheet.dart';
import '../../utils/sheet/repost_sheet.dart';
import '../../utils/sheet/send_sheet.dart';
import '../../utils/widget/home_screen/post_header.dart';
import 'package:linkednc/utils/widget/home_screen/expandable_text.dart';


class PostCard extends StatefulWidget {
 final PostModel post;

 const PostCard({
   super.key,
   required this.post
});

  @override
  State<StatefulWidget> createState() {
    return _Posts();
  }
}
class _Posts extends State<PostCard>{

  final List<String> _comments = [];
  late int _likeCount;
  late bool _isLikedByMe;
  late int _repostCount;

  // Toggle like logic
  void _toggleLike() {
    setState(() {
      _isLikedByMe = !_isLikedByMe;
      if (_isLikedByMe) {
        _likeCount++;
      } else {
        _likeCount--;
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _likeCount = widget.post.likes;
    _isLikedByMe = widget.post.isLikeCurrentUser;
    _repostCount = widget.post.reposts;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom:10),
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. User Header Section
          PostHeader(
            post: widget.post,
          ),

          // 2. Post Body Text
            Padding(
              padding: const EdgeInsets.fromLTRB(
                12,
                4,
                12,
                6,
              ),
            child: ExpandableText(
              text: widget.post.postText,
            ),
          ),

          // Image
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              child: Image.network(
                widget.post.img,
                fit: BoxFit.cover,
              ),
            ),
          ),


          const Divider(height: 1, thickness: 0.5),

          // 5. Social Actions Row (Like, Comment, Repost, Send) with set state for individual
          PostActions(
            isLiked: _isLikedByMe,
            onLike: _toggleLike,
            onComment: ()async {
              final result = await openCommentSheet(context,_comments);
              if (result != null){
                setState(() {
                  _comments.add(result);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Comment added : $result"),
                  ),
                );
              }
            },
            onRepost: () async {
              final result = await openRepostMenu(context);

              if (result == "repost") {
                setState(() {
                  _repostCount++;
                 // widget.post.reposts = _repostCount;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Post reposted successfully"),
                  ),
                );
              }
            },
            onSend: () => openSendSheet(context),
            likes: _likeCount,
            comments: _comments.length,
            reposts: _repostCount,
          ),

        ],
      ),
    );
  }
}




