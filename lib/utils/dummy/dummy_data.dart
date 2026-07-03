import 'package:linkednc/models/post_model.dart';
import 'package:linkednc/models/user_model.dart';

UserModel alex = UserModel(
    id: "1",
    name: "Alex Morgan",
    headline:"Flutter Developer",
    profileImage:"https://picsum.photos/500/500",
    location:"New York",
    followers:1200,
    connections:590,
);
UserModel cam = UserModel(
  id: "2",
  name: "Cam Cabillo",
  headline:"UI/UX Designer",
  profileImage:"https://picsum.photos/500?random=2",
  location:"San Francisco",
  followers:890,
  connections:700,
);
UserModel bethy = UserModel(
  id: "3",
  name: "Bethy Mikelson",
  headline:"Backend Developer",
  profileImage:"https://picsum.photos/500?random=3",
  location:"London",
  followers:540,
  connections:900,
);

List<PostModel> posts = <PostModel>[
  PostModel(
      author: alex,
      img: "https://picsum.photos/500?random=4",
      likes: 34,
      postText:"Just completed my Flutter LinkedIn clone! 🚀 This project has helped me learn widget composition, state management fundamentals, reusable components, and clean project architecture. I'm excited to continue by integrating Firebase and Provider to make the application fully functional. Looking forward to sharing more updates soon!" ,
      comments: 54,
      isLikeCurrentUser: true,
      reposts: 22,
      time: DateTime.now().subtract(const Duration(minutes: 12)),),
  PostModel(
      author: cam,
      img: "https://picsum.photos/500?random=5",
      likes: 30,
      postText:"UI design is all about solving problems.",
      comments: 74,
      isLikeCurrentUser: true,
      reposts: 44,
time: DateTime.now().subtract(const Duration(hours: 2))),
  PostModel(
      author: bethy,
      img: "https://picsum.photos/500?random=6",
      likes: 84,
      postText:"Learning Node.js alongside Flutter.",
      comments: 64,
      isLikeCurrentUser: true,
      reposts: 23,
time: DateTime.now().subtract(const Duration(days: 1)),)];