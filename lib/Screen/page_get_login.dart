import 'package:flutter/material.dart';
class PageGetLogin extends StatelessWidget {
  //constructor
  final String username;
  final String password;

  const PageGetLogin(this.username, this.password, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat datang $username', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username'),
            Text('Password: $password'),
          ],
        ),
      ),
    );
  }
}