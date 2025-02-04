import 'package:flutter/material.dart';
import '../widgets/ProgressCard.dart';
import '../widgets/SubjectCard.dart';
import '../widgets/FeatureCard.dart';
import '../widgets/AdvantageCard.dart';
import '/ChatScreen.dart';
import '/ARScreen.dart';
import 'widgets/BottomNavBar.dart'; // Importing the BottomNavBar

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5EFF1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/ilearn_logo.png', height: 40),
                        const SizedBox(width: 10),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: const Color(0xFF097D66),
                      radius: 25,
                      child: const Text(
                        'A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Welcome Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Arya',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF097D66),
                      ),
                    ),
                    Text(
                      "Let's start learning",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF097D66),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Progress Card
              ProgressCard(
                learned: 46,
                total: 60,
              ),

              const SizedBox(height: 30),

              // Subjects Section
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subjects',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF097D66),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SubjectCard(title: 'SCIENCE I', image: 'assets/images/chemistry.png', onTap: () {}),
                          SubjectCard(title: 'MATHEMATICS I', image: 'assets/images/chemistry.png', onTap: () {}),
                          SubjectCard(title: 'SCIENCE II', image: 'assets/images/chemistry.png', onTap: () {}),
                          SubjectCard(title: 'MATHEMATICS II', image: 'assets/images/chemistry.png', onTap: () {}),
                          SubjectCard(title: 'HISTORY', image: 'assets/images/chemistry.png', onTap: () {}),
                          SubjectCard(title: 'GEOGRAPHY', image: 'assets/images/chemistry.png', onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Explore Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF097D66),
                      ),
                    ),
                    const SizedBox(height: 15),
                    FeatureCard(
                      icon: Icons.people_outline,
                      title: 'AI TUTOR',
                      description: 'Assistant that helps you learn and grow smarter anytime, anywhere.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    FeatureCard(
                      icon: Icons.language,
                      title: 'TEXTBOOKS',
                      description: 'Access knowledge with free textbooks for everyone, anytime.',
                      onTap: () {},
                    ),
                    const SizedBox(height: 15),
                    FeatureCard(
                      icon: Icons.people_outline,
                      title: 'MULTILINGUAL',
                      description: 'Bridges language gaps for nationwide audience to learn and grow.',
                      onTap: () {},
                    ),
                    const SizedBox(height: 15),
                    FeatureCard(
                      icon: Icons.people_outline,
                      title: 'AR & VR MODELS',
                      description: 'Convert any diagram into a real-life representation.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ARScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Advantages Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Advantages',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF097D66),
                      ),
                    ),
                    const SizedBox(height: 15),
                    AdvantageCard(
                      title: 'ALL SUBJECTS',
                      description: 'Caters to all the subjects of 10th class mapped as per academic curriculum.',
                      image: 'assets/images/all_subjects.png',
                    ),
                    const SizedBox(height: 15),
                    AdvantageCard(
                      title: 'EASY TO REMEMBER',
                      description: 'Learn effortlessly with flashcards, quizzes etc designed to make chapters easy to remember and fun to explore!',
                      image: 'assets/images/easy_remember.png',
                    ),
                    const SizedBox(height: 15),
                    AdvantageCard(
                      title: 'FREE FOR ALL',
                      description: 'Completely free to use, offering all features at no cost—no subscriptions or hidden charges!',
                      image: 'assets/images/free_service.png',
                    ),
                    const SizedBox(height: 15),
                    AdvantageCard(
                      title: '24/7 ACCESS',
                      description: '4X7 access to our content with mobile phones',
                      image: 'assets/images/access.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // Adding the BottomNavBar here
    );
  }
}
