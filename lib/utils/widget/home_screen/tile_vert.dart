import 'package:flutter/material.dart';

class TileVert extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const TileVert({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,  size: 18, color: Colors.black87),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,)
      ),
      onTap: onTap,
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}