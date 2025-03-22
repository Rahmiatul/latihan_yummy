import 'package:flutter/material.dart';
import 'page_login.dart';
import 'page_signup.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5722), // oranye tua
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'gambar/yumkuning.png',
                width: 150,
              ),
              const SizedBox(height: 10),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Log In
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD966), // kuning tombol Log In
                  foregroundColor: const Color(0xFFE65100), // warna teks Log In
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Tombol Sign Up
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF2B0), // kuning muda tombol Sign Up
                  foregroundColor: const Color(0xFFE65100), // teks Sign Up
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}