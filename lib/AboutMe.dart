import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutMeScreen extends StatelessWidget {
  AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.blue[50],
      ),
      body: SingleChildScrollView(child: AboutMeCard()),
    );
  }
}

class AboutMeCard extends StatefulWidget {
  @override
  _AboutMeCardState createState() => _AboutMeCardState();
}

class _AboutMeCardState extends State<AboutMeCard> {
  bool _isBackgroundExpanded = false;
  bool _isExperienceExpanded = false;

  final String backgroundText =
      'A passionate tech enthusiast with over 6 years of experience in computing and 2 years in mobile application development. '
      'He holds a bachelor\'s degree in Computer Engineering from the Federal University of Technology Akure. '
      'As a student and upon graduation, he contributed vitally to the online-based counselling software (application) of the institution. '
      'Since then, he has had the privilege of working on several other software applications. Some of his mobile applications are listed on this screen. '
      'Aside mobile applications, he has written software to solve various tech problems in various industries such:\n IoT (hardware and software),\n Space-'
      '(A satellite design challenge presided upon by the    American Astronautical Society, NASA and others), and \n Energy -(MPPT Charge Controller\'s firmware.)';

  final List<String> experiences = [
    'Designed and developed an online-based counselling software for over 20,000 people.',
    'Developed an energy monitoring app while managing the pressure well.',
    'Designed and developed a health tracking device with access to user\'s vitals data. '
        'A software that contributed to earning Team Thyreos the first position in the IEEE "Health Tech for Tomorrow" challenge (2025).',
    'Experience with Firebase and other third-party APIs.',
    'Experience with Postman, GitHub.',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              'Sunday Oluwadamilola Michael',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 8),
          Divider(),
          _buildSectionTitle('Background'),
          _buildAnimatedExpandableText(backgroundText, _isBackgroundExpanded,
              () {
            setState(() {
              _isBackgroundExpanded = !_isBackgroundExpanded;
            });
          }),
          SizedBox(height: 12),
          _buildSectionTitle('Experiences'),
          _buildAnimatedExpandableExperienceList(),
          SizedBox(height: 12),
          _buildSectionTitle('Projects'),
          Column(
            children: [
              _buildProjectTile('Counsel',
                  'Web-based application for appointment scheduling, chatting, and voice call.'),
              _buildProjectTile('MedShield',
                  'Health Monitoring app for standard health suggestions based on users\' vitals data from product\'s hardware device.'),
              _buildProjectTile(
                  'Imolede', 'Energy consumption monitoring and control app.'),
            ],
          ),
        ],
      ),
    );
  }

  /// Smooth Animated Expandable Text for Background
  Widget _buildAnimatedExpandableText(
      String text, bool isExpanded, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Text(
            '${text.length > 100 ? text.substring(0, 100) : text}...',
            style: TextStyle(fontSize: 16),
          ),
          secondChild: Text(text, style: TextStyle(fontSize: 16)),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 400),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            isExpanded ? 'Read Less' : 'Read More',
            style: TextStyle(
                fontFamily: 'SourceCodePro',
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  /// Smooth Animated Expandable List for Experiences
  Widget _buildAnimatedExpandableExperienceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Column(
            children: experiences.sublist(0, 2).map(_buildBulletPoint).toList(),
          ),
          secondChild: Column(
            children: experiences.map(_buildBulletPoint).toList(),
          ),
          crossFadeState: _isExperienceExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 400),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _isExperienceExpanded = !_isExperienceExpanded;
            });
          },
          child: Text(
            _isExperienceExpanded ? 'Read Less' : 'Read More',
            style: TextStyle(
                fontFamily: 'SourceCodePro',
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: 'SourceCodePro',
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.teal),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildProjectTile(String title, String description) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 4),
      color: Colors.teal[500], //blue[50], // Background color for the card
      child: SizedBox(
        height: 100, // Ensuring uniform height for all tiles
        child: Container(
          padding: EdgeInsets.all(8), // Padding for better alignment
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SourceCodePro',
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
              description,
              maxLines: 3, // Prevents overflow issues
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
