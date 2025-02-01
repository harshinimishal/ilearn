import 'package:flutter/material.dart';
import 'VerificationCodeScreen.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/PrimaryButton.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
              // Logo (reduced size and shifted to the left)
              Row(
                children: [
                  Image.asset('assets/images/ilearn_logo.png', height: 30), // Reduced size of logo
                ],
              ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Forget Password',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A237E),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Enter your email account to reset password',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.teal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/images/forget_password.png',
                      height: 200,
                    ),
                    const SizedBox(height: 40),
                    const CustomInputField(
                      icon: Icons.email_outlined,
                      hint: 'Enter your email',
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                      text: 'Continue',
                      onPressed: () {
                              // Navigate to the ForgetPasswordScreen when tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VerificationCodeScreen(),
                                ),
                              );
                            },
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF1A237E),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}