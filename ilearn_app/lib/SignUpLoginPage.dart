import 'package:flutter/material.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/social_button.dart';
import '/TermsConditionsScreen.dart';
import 'ForgetPassword.dart';
class SignUpLoginPage extends StatefulWidget {
  const SignUpLoginPage({Key? key}) : super(key: key);

  @override
  State<SignUpLoginPage> createState() => _SignUpLoginPageState();
}

class _SignUpLoginPageState extends State<SignUpLoginPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Set the page background color to white
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              // Logo (reduced size and shifted to the left)
              Row(
                children: [
                  Image.asset('assets/images/ilearn_logo.png', height: 30), // Reduced size of logo
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to iLEARN',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 18, 31, 73), // Text color updated to 121F49
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign up or log in to embark on an interactive journey with our app!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 9, 125, 102),  // Text color updated to 097D66
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              // Login/Signup Toggle
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isLogin = true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isLogin ? const Color.fromARGB(255, 18, 31, 73) : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: isLogin ? FontWeight.bold : FontWeight.normal,
                            color: isLogin ? const Color.fromARGB(255, 18, 31, 73) : Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isLogin = false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: !isLogin ? const Color.fromARGB(255, 18, 31, 73) : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: !isLogin ? FontWeight.bold : FontWeight.normal,
                            color: !isLogin ? const Color.fromARGB(255, 18, 31, 73) : Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Form Container (below login/signup toggle, background color #E5EFF1)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 239, 241), // Form background color
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                ),
                child: Column(
                  children: [
                    if (isLogin)
                      ...[
                        // Login Form
                        SocialButton(
                          text: 'Login with Google',
                          icon: 'assets/images/google_logo.png',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Or login with email',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        const CustomInputField(
                          icon: Icons.email_outlined,
                          hint: 'Enter your email',
                        ),
                        const SizedBox(height: 15),
                        const CustomInputField(
                          icon: Icons.lock_outline,
                          hint: 'Enter a Password',
                          isPassword: true,
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Navigate to the ForgetPasswordScreen when tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPasswordScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ]
                    else
                      ...[
                        // Signup Form
                        const CustomInputField(
                          icon: Icons.person_outline,
                          hint: 'Enter your name',
                        ),
                        const SizedBox(height: 15),
                        const CustomInputField(
                          icon: Icons.email_outlined,
                          hint: 'Enter Email',
                        ),
                        const SizedBox(height: 15),
                        const CustomInputField(
                          icon: Icons.school_outlined,
                          hint: 'Enter your School name',
                        ),
                        const SizedBox(height: 15),
                        const CustomInputField(
                          icon: Icons.lock_outline,
                          hint: 'Enter a Password',
                          isPassword: true,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to the TermsConditionsScreen when tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const TermsConditionsScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'By creating an account you have to agree with our terms & conditions.',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 127, 127, 127),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the HomeScreen when pressed
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 18, 31, 73),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  isLogin ? 'Login' : 'Sign up',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
