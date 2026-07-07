import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkednc/screens/profile/Activity_Banner.dart';
import 'package:linkednc/screens/profile/post_card.dart';

import 'package:linkednc/utils/dummy/dummy_data.dart';
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}
class _HomeScreen extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index != 0)
                ActivityBanner(
                  text: "${posts[index - 1].author} liked this",
                ),

              PostCard(
                post: posts[index],
              ),
            ],
          );
        },
      )
    );
  }
}