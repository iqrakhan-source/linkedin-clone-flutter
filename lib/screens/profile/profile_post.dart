import 'package:flutter/material.dart';
import 'package:linkednc/models/post_model.dart';

class Posts extends StatefulWidget {
 final PostModel post;

 const Posts({
   super.key,
   required this.post
});

  @override
  State<StatefulWidget> createState() {
    return _Posts();
  }
}
class _Posts extends State<Posts>{

  int _commentCount = 5;
  late int _likeCount;
  late bool _isLikedByMe;

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
    _commentCount = widget.post.comments;
    _isLikedByMe = widget.post.isLikeCurrentUser;
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: widget.post.author.profileImage.startsWith('http')
                      ? NetworkImage(widget.post.author.profileImage)
                      : AssetImage(widget.post.author.profileImage) as ImageProvider,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(widget.post.author.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        widget.post.author.headline,
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(widget.post.time.toString(), style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
                          Icon(Icons.public, size: 13, color: Colors.grey.shade500),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.black54),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // 2. Post Body Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
    widget.post.postText,
    style: const TextStyle(fontSize: 14, height: 1.3),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('👍 ❤️ $_likeCount',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                Text('$_commentCount comments • ${widget.post.reposts} reposts',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 0.5),

          // 5. Social Actions Row (Like, Comment, Repost, Send) with set state for individual
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LinkedInSocialButton(
                  inactiveIcon: Icons.thumb_up_alt_outlined,
                  activeIcon: Icons.thumb_up_alt,
                  label: 'Like',
                  isActive: _isLikedByMe,
                  onTap: _toggleLike,
                ),
                LinkedInSocialButton(
                  inactiveIcon: Icons.comment_outlined,
                  activeIcon: Icons.comment,
                  label: 'Comment',
                  isActive: false,
                  onTap: () => _openCommentSheet(context),
                ),
                LinkedInSocialButton(
                  inactiveIcon: Icons.repeat,
                  activeIcon: Icons.repeat,
                  label: 'Repost',
                  isActive: false,
                  onTap: () => _openRepostMenu(context),
                ),
                LinkedInSocialButton(
                  inactiveIcon: Icons.send_outlined,
                  activeIcon: Icons.send,
                  label: 'Send',
                  isActive: false,
                  onTap: () => _openSendSheet(context),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

// Separate StatefulWidget manages each button state independently
class LinkedInSocialButton extends StatelessWidget {
  final IconData inactiveIcon;
  final IconData activeIcon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final Color? activeColor;
  final Color? inActiveColor;

  const LinkedInSocialButton({
    super.key,
    required this.inactiveIcon,
    required this.activeIcon,
    required this.label,
    required this.onTap,
    required this.isActive,
    this.activeColor,
    this.inActiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color active =
        activeColor ?? const Color(0xFF0A66C2);
    final Color inactive =
        inActiveColor ?? Colors.black54;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4),
          splashColor: active.withValues(alpha: 0.15),
          highlightColor: inactive.withValues(alpha: 0.05),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isActive ? activeIcon : inactiveIcon,
                  color: isActive ? active : inactive,
                  size: 20,
                ),
                const SizedBox(height: 3),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: isActive ? active : inactive,
                    fontWeight:
                    isActive ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// A. OPENS COMMENT BOTTOM DRAWER SHEET
void _openCommentSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
    builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 36, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 12),
          const TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'Add a comment...', border: InputBorder.none),
          ),
        ],
      ),
    ),
  );
}

// B. OPENS LINKEDIN REPOST ACTION DIALOG BOX MENU
void _openRepostMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.repeat, color: Colors.black87),
            title: const Text('Repost', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            subtitle: const Text('Instantly share this post with your network', style: TextStyle(fontSize: 12)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.edit_outlined, color: Colors.black87),
            title: const Text('Share your thoughts', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            subtitle: const Text('Create a new post with this item attached', style: TextStyle(fontSize: 12)),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  );
}

// C. OPENS SEARCHABLE SEND-TO-CONNECTION DRAWER PANEL
void _openSendSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
    builder: (context) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          const SizedBox(height: 12),
          Text('Send post', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey.shade800)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(color: const Color(0xFFEDF3F8), borderRadius: BorderRadius.circular(4)),
              child: const TextField(
                decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search connections', border: InputBorder.none),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                leading:  CircleAvatar(
                  backgroundColor: Colors.blueGrey,),
                title: const Text('Alexie', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                trailing: TextButton(onPressed: () => Navigator.pop(context), child: const Text('Send')),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
