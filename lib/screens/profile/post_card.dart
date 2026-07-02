import 'package:flutter/material.dart';
import 'package:linkednc/models/post_model.dart';
import 'package:linkednc/sheet/send_sheet.dart';
import 'package:linkednc/widget/post_actions.dart';
import '../../sheet/comment_sheet.dart';
import '../../widget/post_header.dart';
import '../../sheet/repost_sheet.dart';
import '../../widget/post_stats.dart';
import 'package:linkednc/widget/expandable_text.dart';
import 'package:linkednc/widget/comment_list.dart';





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
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. User Header Section
          PostHeader(
            post: widget.post,
          ),

          // 2. Post Body Text
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: ExpandableText(
              text: widget.post.postText,
            ),
          ),

          // Image
          Container(
            width: double.infinity,
            height: 220,
            color: Colors.grey.shade200,
            child: Image.network(widget.post.img,
              fit: BoxFit.cover,
            ),
          ),

          //Social Panel
          PostStats(
            likes: _likeCount,
            comments: _comments.length,
           //b reposts: widget.post.reposts,
            reposts: _repostCount,
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
          ),

          //comment list
        /*  CommentList(
            comments: _comments,
          ),*/
        ],
      ),
    );
  }
}




