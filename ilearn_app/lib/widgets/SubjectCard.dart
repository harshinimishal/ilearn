import 'package:flutter/material.dart';
import 'package:ilearn_app/ChapterScreen.dart';

class SubjectCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const SubjectCard({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/background.png',
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            // Content on top of background
            Container(
              width: double.infinity,
              height: 160,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black38,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Get Started Button with navigation
                  GestureDetector(
                    onTap: () {
                      // Navigate to FlashcardsScreen when clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChaptersScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Get started',
                        style: TextStyle(
                          color: Color(0xFF121F49),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
