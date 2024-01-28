// login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/logo_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Dummy credentials
  static const String _dummyUsername = 'user';
  static const String _dummyPassword = 'test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''), // Empty text to hide the title
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const LogoSection(
                fontColor: Color(0xFF4DB87E),
                fontSize: 31,
              ),
              const SizedBox(height: 20.0),
              buildTextField(
                  'Email or Phone Number', Icons.mail, _emailController),
              const SizedBox(height: 16.0),
              buildPasswordField(_passwordController),
              const SizedBox(height: 8.0),
              buildForgotPasswordLink(),
              const SizedBox(height: 16.0),
              buildLoginButton(),
              const SizedBox(height: 16.0),
              buildSignUpSection(),
              const SizedBox(height: 16.0),
              buildGoogleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, IconData prefixIcon, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 14.0, fontFamily: 'Inter'),
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
    );
  }

  Widget buildPasswordField(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(fontSize: 14.0, fontFamily: 'Inter'),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
    );
  }

  Widget buildForgotPasswordLink() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Forgot Password?',
        style: TextStyle(fontSize: 13.0, color: Color(0xFF4DB87E)),
      ),
    );
  }

  Widget buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        _performLogin();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: const Color(0xFF4DB87E),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600, // Semi-bold
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildGoogleSignInButton() {
    return ElevatedButton(
      onPressed: () {
        // Add Google sign-in functionality
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        side: const BorderSide(
          color: Color(0xFF4DB87E),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/google_logo.png',
            height: 24.0,
            width: 24.0,
          ),
          const SizedBox(width: 8.0),
          const Text(
            'Continue with Google',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSignUpSection() {
    return const Column(
      children: [
        Text("Don't have an account? Sign Up"),
        SizedBox(height: 8.0),
        Text('or'),
      ],
    );
  }

// Function to perform login
  void _performLogin() {
    // Get entered credentials
    String enteredEmail = _emailController.text.trim();
    String enteredPassword = _passwordController.text.trim();

    // Dummy credentials for comparison
    if (enteredEmail == _dummyUsername && enteredPassword == _dummyPassword) {
      // Login successful
      _showLoginSuccessMessage();
      // Navigate to the homepage
      // Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Incorrect email or password
      _showLoginErrorMessage();
    }
  }

  // Function to show a login success message
  void _showLoginSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login Successful! Welcome!'),
        duration: Duration(seconds: 2),
      ),
    );

    // You can add additional actions or logic here if needed
    // Navigate to the homepage, for example:
    Navigator.pushReplacementNamed(context, '/home');
  }

  // Function to show a login error message
  void _showLoginErrorMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Incorrect email or password. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the alert dialog
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
