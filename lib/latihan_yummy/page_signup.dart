import 'package:flutter/material.dart';
import 'page_login.dart';
import 'user_data.dart';
import 'package:intl/intl.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      _dobController.text = formattedDate;
    }
  }

  void _handleSignup() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _mobileController.text.isEmpty ||
        _dobController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "Semua field harus diisi",
            style: TextStyle(fontFamily: 'Fredoka'),
          ),
        ),
      );
      return;
    }

    // Simpan ke variabel global
    UserData.fullName = _nameController.text;
    UserData.email = _emailController.text;
    UserData.mobileNumber = _mobileController.text;
    UserData.dob = _dobController.text;
    UserData.password = _passwordController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Sign Up berhasil",
          style: TextStyle(fontFamily: 'Fredoka'),
        ),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'gambar/frame.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFCC4D),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40,
                        left: 16,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'gambar/bck.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: const Text(
                            'New Account',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Fredoka',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _inputField('Full name', 'Your name', _nameController),
                      const SizedBox(height: 12),
                      _passwordField(),
                      const SizedBox(height: 12),
                      _inputField('Email', 'example@example.com', _emailController),
                      const SizedBox(height: 12),
                      _inputField('Mobile Number', '+123 456 789', _mobileController),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: _selectDate,
                        child: AbsorbPointer(
                          child: _inputField('Date of birth', 'DD / MM / YYYY', _dobController),
                        ),
                      ),
                      const SizedBox(height: 12),
                      RichText(
                        text: const TextSpan(
                          text: 'By continuing, you agree to ',
                          style: TextStyle(color: Colors.black54, fontFamily: 'Fredoka'),
                          children: [
                            TextSpan(
                              text: 'Terms of Use ',
                              style: TextStyle(color: Colors.orange, fontFamily: 'Fredoka'),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(color: Colors.black54, fontFamily: 'Fredoka'),
                            ),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(color: Colors.orange, fontFamily: 'Fredoka'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleSignup,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF5722),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontFamily: 'Fredoka', fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Center(
                        child: Text(
                          'or sign up with',
                          style: TextStyle(fontFamily: 'Fredoka'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialIcon('gambar/google.png'),
                          const SizedBox(width: 16),
                          _socialIcon('gambar/facebook.png'),
                          const SizedBox(width: 16),
                          _socialIcon('gambar/fingerprint.png'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(color: Colors.black, fontFamily: 'Fredoka'),
                              children: [
                                TextSpan(
                                  text: 'Log in',
                                  style: TextStyle(color: Colors.orange, fontFamily: 'Fredoka'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontFamily: 'Fredoka'),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: const TextStyle(fontFamily: 'Fredoka'),
          decoration: InputDecoration(
            fillColor: const Color(0xFFFFF0B3),
            filled: true,
            hintText: hint,
            hintStyle: const TextStyle(fontFamily: 'Fredoka'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(fontFamily: 'Fredoka'),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          style: const TextStyle(fontFamily: 'Fredoka'),
          decoration: InputDecoration(
            fillColor: const Color(0xFFFFF0B3),
            filled: true,
            hintText: '*************',
            hintStyle: const TextStyle(fontFamily: 'Fredoka'),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _socialIcon(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        shape: BoxShape.circle,
      ),
      child: Image.asset(assetPath, width: 24, height: 24),
    );
  }
}