class CatchUpModel {
  final String name;
  final String headline;
  final String type;

  final String title;
  final String actionText;

  final String? company;
  final String? duration;
  final String? avatar;

  const CatchUpModel({
    required this.name,
    required this.headline,
    required this.type,
    required this.title,
    required this.actionText,
    this.company,
    this.duration,
    this.avatar,
  });
}