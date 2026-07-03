import 'package:flutter/material.dart';
import '../widget/tile_vert.dart';

Future<String?> openPostMenu(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),

            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 10),

            TileVert(
              icon: Icons.bookmark_border,
              text: "Save post",
              onTap: () => Navigator.pop(context, "save"),
            ),

            TileVert(
              icon: Icons.visibility_off,
              text: "Hide post",
              onTap: () => Navigator.pop(context, "hide"),
            ),

            TileVert(
              icon: Icons.flag_outlined,
              text: "Report post",
              onTap: () => Navigator.pop(context, "report"),
            ),

            TileVert(
              icon: Icons.link,
              text: "Copy link",
              onTap: () => Navigator.pop(context, "copy"),
            ),

            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}