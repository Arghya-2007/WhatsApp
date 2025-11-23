import 'package:flutter/material.dart';
import 'package:app_project_flutter/Widgets/uihelper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class chatsScreen extends StatelessWidget {
  final List<Map<String, String>> arrContent = [
    {
      "images":
          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=800&auto=format&fit=crop&q=60",
      "name": "Ayan",
      "lastMsg": "Hey! How are you doing?",
      "time": "12:00 PM",
    },
    {
      "images":
          "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?w=800&auto=format&fit=crop&q=60",
      "name": "Tinni",
      "lastMsg": "Let’s meet tomorrow.",
      "time": "11:18 PM",
    },
    {
      "images":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800&auto=format&fit=crop&q=60",
      "name": "Shreya",
      "lastMsg": "Got it, thank you!",
      "time": "12:30 AM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffefefe),

      body: ListView.separated(
        itemCount: arrContent.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 0, thickness: 0.8, indent: 80),
        itemBuilder: (context, index) {
          final chat = arrContent[index];
          return ListTile(
            onTap: () => Navigator.pushNamed(context, "chatScreen"),
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(chat["images"]!),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chat["name"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  chat["time"]!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.rightFromBracket,
                    size: 16,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      chat["lastMsg"]!,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 18,
                  width: 18,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff25D366),
        onPressed: () {},
        child: const Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
          size: 20,
      ),
      )
    );
  }
}
