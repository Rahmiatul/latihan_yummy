import 'package:flutter/material.dart';

class PageGetData extends StatelessWidget {
  //constructor untuk tampung data
  final int index;
  const PageGetData(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Get Data List ke $index'),
      ),

      body: Center(
        child: Text('Detail Berita ke : $index'),
      ),
    );
  }
}
