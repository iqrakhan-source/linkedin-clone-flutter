import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          // --- PROFILE HEADER ROW ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.cyan,
                  backgroundImage: AssetImage("assets/images/profileman.png"),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jhonny Doe',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                     // width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Icon(Icons.public, size: 14, color: Colors.black54),
                          SizedBox(width: 4),
                          Text('Anyone', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                          Icon(Icons.arrow_drop_down, size: 16, color: Colors.black54),

                          TextButton(
                            onPressed: _canPost ? () {
                              // Handle posting logic here
                              print("Posted text: ${_textController.text}");
                              _textController.clear();
                            } : null,
                            style: TextButton.styleFrom(
                              backgroundColor: _canPost ? Colors.blue.shade800 : Colors.grey.shade200,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: Text(
                              'Post',
                              style: TextStyle(
                                color: _canPost ? Colors.white : Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

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
