import 'package:flutter/material.dart';
import '/widgets/BottomNavBar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizState _quizState = QuizState.start;
  final int _currentQuestionIndex = 0;
  List<int> _selectedAnswers = [];
  final int _score = 8; // Example score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Green Header
          Container(
            color: const Color(0xFF097D66),
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'Chapter 1. Gravitation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Main Content
          Expanded(
            child: _buildContent(),
          ),

          // Bottom Navigation Bar
          const BottomNavBar(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (_quizState) {
      case QuizState.start:
        return Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _quizState = QuizState.question;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF097D66),
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'START',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );

      case QuizState.question:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Question Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7F9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/orbit.png',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Which laws are specified in above diagram?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF121F49),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Options
              ...List.generate(4, (index) => 
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (_selectedAnswers.contains(index)) {
                          _selectedAnswers.remove(index);
                        } else {
                          _selectedAnswers = [index];
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _selectedAnswers.contains(index) 
                              ? const Color(0xFF097D66)
                              : Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedAnswers.contains(index)
                                    ? const Color(0xFF097D66)
                                    : Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: _selectedAnswers.contains(index)
                                ? const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Color(0xFF097D66),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Kepler's laws",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF121F49),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _quizState = QuizState.result;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF097D66),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Color(0xFF097D66)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

      case QuizState.result:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7F9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'SCORED : $_score/10',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF121F49),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Which laws are specified in above diagram?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF121F49),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    "Kepler's laws",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF121F49),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF097D66).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'correct answer',
                      style: TextStyle(
                        color: Color(0xFF097D66),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Color(0xFF097D66)),
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}

enum QuizState {
  start,
  question,
  result,
}