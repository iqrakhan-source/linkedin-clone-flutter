import 'package:flutter/material.dart';

String formatPostTime(DateTime dateTime) {
  final Duration difference = DateTime.now().difference(dateTime);

  if (difference.inSeconds < 60) {
    return "Now";
  }

  if (difference.inMinutes < 60) {
    return "${difference.inMinutes}m";
  }

  if (difference.inHours < 24) {
    return "${difference.inHours}h";
  }

  if (difference.inDays == 1) {
    return "Yesterday";
  }

  if (difference.inDays < 7) {
    return "${difference.inDays}d";
  }

  if (difference.inDays < 30) {
    return "${(difference.inDays / 7).floor()}w";
  }

  if (difference.inDays < 365) {
    return "${(difference.inDays / 30).floor()}mo";
  }

  return "${(difference.inDays / 365).floor()}y";
}