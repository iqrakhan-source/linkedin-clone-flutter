import 'package:linkednc/models/user_model.dart';

class PostModel {
 final UserModel author;
 final String img;
 final String postText;
 final int likes;
 final int comments;
 final int reposts;
 final bool isLikeCurrentUser;
 final DateTime time;

 PostModel({
  required this.author,
  required this.img,
  required this.likes,
  required this.postText,
  required this.comments,
  required this.isLikeCurrentUser,
  required this.reposts,
  required this.time
 });
}
