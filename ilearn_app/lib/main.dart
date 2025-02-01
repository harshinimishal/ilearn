import 'package:flutter/material.dart';
import 'SignUpLoginPage.dart';
import 'HomeScreen.dart';
import '/widgets/FlashCardsScreen.dart'; 
import 'ChapterScreen.dart';// Ensure this import is correct
void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iLEARN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        '/home': (context) => const HomeScreen(),'/chapters': (context) => const ChaptersScreen(),
    '/flashcards': (context) => const FlashcardsScreen(),
  },
    );
  }
}

// Splash Page
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF121F49),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ilearn_main_logo.png', // Ensure this path is correct
              height: 150,
              width: 150,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'Logo not found',
                  style: TextStyle(color: Colors.white),
                ); // Fallback if image is not found
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
  preferredSize: const Size.fromHeight(30), // Increase app bar height
  child: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Image.asset(
      'assets/images/ilearn_logo.png',
      fit: BoxFit.contain,
      width: 100, // Larger width
      height: 100, // Larger height
    ),
  ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 50), // Shifting the mainpage image down
                Image.asset(
                  'assets/images/main_page_design.png',
                  fit: BoxFit.contain,
                  height: 260, // Adjusted height
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Image not found'); // Placeholder if image is missing
                  },
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/blue_ecllipse.png', // New background image
                fit: BoxFit.cover,
                width: double.infinity,
                height: 420,
              ),
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60), 
                      const Text(
                        'The only study app you’ll ever need',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PoltawskiNowy', // Poltawski Nowy (bold)
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      const Text(
                        'Embark on an engaging and interactive journey to explore, learn, and grow like never before!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins', // Poppins (regular)
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00A859), // Green color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 60),
                        ),
                        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SignUpLoginPage(),
    ),
  );
},
                        child: const Text(
                          'GET STARTED',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins', // Poppins (regular)
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
