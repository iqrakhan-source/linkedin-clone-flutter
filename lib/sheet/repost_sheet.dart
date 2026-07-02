import 'package:flutter/material.dart';

Future<String?> openRepostMenu(BuildContext context){

  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.repeat, color: Colors.black87),
            title: const Text('Repost', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            subtitle: const Text('Instantly share this post with your network', style: TextStyle(fontSize: 12)),
            onTap: () => Navigator.pop(context, "repost"),
          ),
          ListTile(
            leading: const Icon(Icons.edit_outlined, color: Colors.black87),
            title: const Text('Share your thoughts', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            subtitle: const Text('Create a new post with this item attached', style: TextStyle(fontSize: 12)),
            onTap: () => Navigator.pop(context,),          ),
        ],
      ),
    ),
  );
}
