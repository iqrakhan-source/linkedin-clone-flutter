import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkednc/screens/Post_screen.dart';
import 'package:linkednc/screens/home_screen.dart';
import 'package:linkednc/screens/linkedin_list.dart';
import 'package:linkednc/screens/messaging/message.dart';
import 'package:linkednc/screens/network/my_network.dart';

class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _navigation();
  }
}

class _navigation extends State<navigation> {
  int _currentindex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MyNetworkScreen(),
    const PostScreen(),

    Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: LinkedInListScreen(
        pageContext: 'Notification',
        filters: const ['All', 'My posts', 'Mentions', 'Jobs'],
      ),
    ),

    Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: LinkedInListScreen(
        pageContext: 'Jobs',
        filters: const ['Preferance', 'Job Tracker', 'Post a free job', 'Career insight'],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leadingWidth: 70,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.cyan,
                backgroundImage: NetworkImage("https://picsum.photos/500?random=9"),
              ),
            ),
          ),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4)),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.black54, fontSize: 16),
              prefixIcon: const Icon(Icons.search, color: Colors.black54),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.message_rounded, color: Colors.black54),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => const Message()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.cyan,
                    backgroundImage: AssetImage("assets/images/profileman.png"),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Jhonny Doe',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('View Profile', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('My Items'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Groups'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentindex,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor:  Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_rounded),
            label: 'My Network',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases),
            label: 'Jobs',
          ),
        ],
      ),
    );
  }
}
