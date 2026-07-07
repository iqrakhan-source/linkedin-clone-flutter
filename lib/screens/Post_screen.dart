import 'package:flutter/material.dart';
import 'package:linkednc/screens/home_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _textController = TextEditingController();
  bool _canPost = false;

  @override
  void initState() {
    super.initState();
    // Watch text entry changes so we can enable/disable the 'Post' button dynamically
    //addlistener to observe changes and trigger function
    _textController.addListener(() {
      setState(() {
        _canPost = _textController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
      toolbarHeight: 76,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.close,
          size: 24,
          color: Colors.black87,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/profileman.png"),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.public, size: 13),
                    SizedBox(width: 3),
                    Text(
                      "Anyone",
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(Icons.arrow_drop_down, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: TextButton(
            onPressed: _canPost ? () {} : null,
            child: const Text("Post"),
          ),
        ),
      ],
    ),
      body: Column(
        children: [
          // --- TEXT BOX CONTENT FEED ---
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: _textController,
                maxLines: null, // Allows the textbox to expand dynamically downward
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'What do you want to talk about?',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // --- BOTTOM MEDIA TOOLBAR ---
          Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 8, // Handles phone physical notches
              top: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
            ),
            child: Column(
              children: [
                // Top row actions: Add media text row descriptors
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildToolbarItem(Icons.image, 'Media', Colors.blue),
                      _buildToolbarItem(Icons.calendar_month, 'Event', Colors.orange.shade700),
                      _buildToolbarItem(Icons.celebration, 'Celebrate', Colors.purple),
                      _buildToolbarItem(Icons.bar_chart, 'Poll', Colors.teal),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Helper method to layout uniform attachment option buttons
  Widget _buildToolbarItem(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: color, size: 22),
        label: Text(label, style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
