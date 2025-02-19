import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Helper method for reusable text boxes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:im_rich/AboutMe.dart';
import 'package:im_rich/MyProjects.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Enable the virtual device preview
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true, // Allows responsive design
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 90, // Adjust size as needed
                  backgroundImage: AssetImage(
                      'assets/profile_picture.jpg'), // Add valid image path
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sunday O.M.',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                      fontFamily: 'SourceCodePro',
                      fontSize: 20,
                      color: Colors.teal.shade100,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5),
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                  child: Divider(color: Colors.teal.shade100),
                ),
                _buildTextBox(
                    context, Icons.call, '+2347060873520', 'Phone No.'),
                _buildTextBox(
                    context, Icons.mail, 'sundaymichael624@gmail.com', 'Email'),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(color: Colors.teal.shade100),
                ),
                _buildNextPage(
                    FontAwesomeIcons.info, 'About Me', AboutMeScreen()),
                _buildNextPage(FontAwesomeIcons.code, 'A few projects',
                    MyProjectsScreens()),

                //_buildTextBox(Icons.home, 'Oluwadamilola Michael Sunday'),
                SizedBox(
                  height: 20,
                  width: 250,
                  child: Divider(color: Colors.teal.shade100),
                ),
                _buildTextButton(FontAwesomeIcons.xTwitter, 'SundayMik'),
                _buildTextButton(FontAwesomeIcons.github, 'MichaelOS10'),

                _buildTextButton(
                    FontAwesomeIcons.linkedin, 'Oluwadamilola Michael Sunday'),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Next Screen',
      //   child: const Icon(Icons.arrow_forward),
      //   foregroundColor: Colors.teal,
      //   backgroundColor: Colors.white,
      // ),
    );
  }

  Widget _buildTextBox(
      BuildContext context, IconData icon, String text, String textUse) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16, vertical: 8), // Padding around the tile
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.teal), // FontAwesome icon
          title: Text(
            _truncateText(text, 12),
            style: TextStyle(fontSize: 16, color: Colors.black),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            icon: Icon(Icons.copy, color: Colors.grey),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: text));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$textUse copied to clipboard: $text")),
              );
            },
          ),
          dense: true, // Makes the ListTile more compact
        ),
      ),
    );
  }

  String _truncateText(String text, int wordLimit) {
    List<String> words = text.split(" ");
    if (words.length > wordLimit) {
      return words.sublist(0, wordLimit).join(" ") + "...";
    }
    return text;
  }

  Widget _buildNextPage(IconData icon, String text, Widget screen) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: FaIcon(icon, color: Colors.teal), // FontAwesome icon
            title: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            dense: true, // Makes the ListTile more compact
          ),
        ),
      ),
    );
  }

  Widget _buildTextButton(IconData icon, String text) {
    return TextButton(
      onPressed: () {
        print("linkedIn pressed");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: FaIcon(icon, color: Colors.teal), // FontAwesome icon
            title: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            dense: true, // Makes the ListTile more compact
          ),
        ),
      ),
    );
  }
}
