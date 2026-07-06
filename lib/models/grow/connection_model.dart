class ConnectionModel {
  final String name;
  final String headline;
  final int mutualConnections;
  final String actionText;
  final String? image;

  const ConnectionModel({
    required this.name,
    required this.headline,
    required this.mutualConnections,
    required this.actionText,
    this.image,
  });
}