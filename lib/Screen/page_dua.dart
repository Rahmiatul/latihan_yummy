import 'package:flutter/material.dart';

class PageDua extends StatelessWidget {
  const PageDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Dua'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              size: 35,
              color: Colors.green,

            ),
            Icon(
              Icons.spa,
              size: 35,
              color: Colors.purple,
            ),
            Icon(
              Icons.phone,
              size: 35,
              color: Colors.pink,
            ),
          ],
        ),

      ),
    );
  }
}