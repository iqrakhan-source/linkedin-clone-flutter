class UserModel {
   final String id;
  final String name;
  final String headline;
  final String profileImage;
  final String location;
  final int followers;
  final int connections;

   UserModel({
     required this.id,
     required this.name,
     required this.headline,
     required this.profileImage,
     required this.location,
     required this.followers,
     required this.connections,
   });
}
