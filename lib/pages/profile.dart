import 'package:currency_app/pages/botton_nav.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
               automaticallyImplyLeading: false, // Remove default back arrow
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );
    },
  ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "About Coral",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Coral App",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),

              Text(
                "Coral is a recipe learning application thoughtfully developed by "
                "Amadi Sixtus to help people discover, learn, and confidently prepare "
                "a wide variety of meals from different cultures. The app is designed "
                "to make cooking easier and more enjoyable for everyone whether you’re "
                "a beginner or an experienced cook looking to try something new.\n\n"
                "Coral provides step-by-step video guidance for each recipe, making it "
                "simple to follow along and understand every stage of the cooking process. "
                "Each meal also comes with a complete list of ingredients, including images "
                "and detailed information, so users always know exactly what they need before "
                "they begin. The app aims to give users a smooth, clear, and practical cooking "
                "experience, helping them prepare delicious meals with confidence.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
