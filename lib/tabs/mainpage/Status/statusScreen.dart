import 'package:app_project_flutter/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatusScreen extends StatelessWidget {
  StatusScreen({super.key});

  /// Sample data: `viewed: false` = recent (unseen), `viewed: true` = seen
  final List<Map<String, dynamic>> statusContent = const [
    {
      "image":
          "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      "name": "Ayan",
      "statusTime": "15 minutes ago",
      "viewed": false,
    },
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      "name": "Tinni",
      "statusTime": "1 hour ago",
      "viewed": false,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
      "name": "Shreya",
      "statusTime": "Today, 9:30 AM",
      "viewed": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final recent = statusContent.where((e) => e["viewed"] == false).toList();
    final viewed = statusContent.where((e) => e["viewed"] == true).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top title (WhatsApp usually has AppBar, but this matches your pattern)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  UiHelper.customText(
                    text: "Status",
                    size: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),

            // My Status
            const MyStatusTile(),
            const SizedBox(height: 8),

            // List of others' statuses (recent + viewed)
            Expanded(
              child: ListView(
                children: [
                  if (recent.isNotEmpty) ...[
                    SectionHeader(title: "Recent updates"),
                    ...recent.map(
                      (status) => StatusTile(
                        imageUrl: status["image"] ?? "",
                        name: status["name"] ?? "Unknown",
                        time: status["statusTime"] ?? "",
                        viewed: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => StatusDetailScreen(
                                name: status["name"] ?? "Unknown",
                                imageUrl: status["image"] ?? "",
                                time: status["statusTime"] ?? "",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                  if (viewed.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    SectionHeader(title: "Viewed updates"),
                    ...viewed.map(
                      (status) => StatusTile(
                        imageUrl: status["image"] ?? "",
                        name: status["name"] ?? "Unknown",
                        time: status["statusTime"] ?? "",
                        viewed: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => StatusDetailScreen(
                                name: status["name"] ?? "Unknown",
                                imageUrl: status["image"] ?? "",
                                time: status["statusTime"] ?? "",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),

      // WhatsApp-style FABs: pencil above, camera below
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              heroTag: "editStatus",
              onPressed: () {
                // TODO: Open text status editor
              },
              child: const Icon(FontAwesomeIcons.edit, size: 18),
            ),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: "cameraStatus",
            onPressed: () {
              // TODO: Open camera for status
            },
            child: const Icon(FontAwesomeIcons.camera),
          ),
        ],
      ),
    );
  }
}

/// "My status" tile – like WhatsApp
class MyStatusTile extends StatelessWidget {
  const MyStatusTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              "https://plus.unsplash.com/premium_photo-1671656349218-5218444643d8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8fHww",
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 11,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 9,
                backgroundColor: Colors.green,
                child: const Icon(
                  FontAwesomeIcons.add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      title: UiHelper.customText(
        text: "My status",
        size: 16,
        fontWeight: FontWeight.w600,
      ),
      subtitle: UiHelper.customText(
        text: "Tap to add status update",
        size: 13,
        color: Colors.grey,
      ),
      onTap: () {
        // TODO: open status creator
      },
    );
  }
}

/// Section label like "Recent updates", "Viewed updates"
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: UiHelper.customText(
        text: title,
        size: 13,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}

/// Status tile with ring (green if new, grey if viewed)
class StatusTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;
  final bool viewed;
  final VoidCallback? onTap;

  const StatusTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.time,
    this.viewed = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = viewed ? Colors.grey : Colors.green;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 2.5),
        ),
        child: CircleAvatar(
          radius: 23,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
      title: UiHelper.customText(
        text: name,
        size: 15,
        fontWeight: FontWeight.w600,
      ),
      subtitle: UiHelper.customText(text: time, size: 13, color: Colors.grey),
      onTap: onTap,
    );
  }
}

/// Full-screen status view (basic, like opening a single status)
class StatusDetailScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String time;

  const StatusDetailScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(radius: 16, backgroundImage: NetworkImage(imageUrl)),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 15)),
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
