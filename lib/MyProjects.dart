import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjectsScreens extends StatelessWidget {
  MyProjectsScreens({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      "images": [
        "assets/projects/imolede/imoledeLandingPage.png",
        "assets/projects/imolede/imoledeloginPage.png",
        "assets/projects/imolede/homePage.png",
        "assets/projects/imolede/menuPage.png",
        "assets/projects/imolede/profileScreen.png"
      ],
      "title": "Imolede",
      "description":
          "Connects users to their energy-monitoring hardware device for remote energy control",
      "youtube": "https://www.google.com"
    },
    {
      "images": [
        "assets/projects/counsel/counselorLogin.png",
        "assets/projects/counsel/chatScreen.png",
        "assets/projects/counsel/ringing.png",
        "assets/projects/counsel/ongoing call.png"
      ],
      "title": "Counsel",
      "description": "A counselling app",
      "youtube": "https://www.youtube.com"
    },
    {
      "images": [
        "assets/project3_1.png",
        "assets/project3_2.png",
        "assets/project3_3.png"
      ],
      "title": "MedShield",
      "description": "An AI-powered chatbot using Flutter & Firebase.",
      "youtube": "https://www.youtube.com/watch?v=your_project_link"
    },
    {
      "images": [
        "assets/project3_1.png",
        "assets/project3_2.png",
        "assets/project3_3.png"
      ],
      "title": "Choose your Adventure",
      "description": "An AI-powered chatbot using Flutter & Firebase.",
      "youtube": "https://www.youtube.com/watch?v=your_project_link"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "A Few Projects",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue[50]!,
      ),
      backgroundColor: Colors.blue[50]!,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ProjectTile(
                images: project["images"]!,
                title: project["title"]!,
                description: project["description"]!,
                youtubeUrl: project["youtube"]!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final List<String> images;
  final String title;
  final String description;
  final String youtubeUrl;

  const ProjectTile({
    required this.images,
    required this.title,
    required this.description,
    required this.youtubeUrl,
    super.key,
  });

  void _launchURL() async {
    final Uri url = Uri.parse(youtubeUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $youtubeUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontally Scrollable Image Gallery
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      images[index],
                      height: 200,
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: _launchURL,
              icon: const Icon(Icons.video_library, color: Colors.red),
              label: const Text(
                "Watch",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
