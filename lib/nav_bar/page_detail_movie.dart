import 'package:flutter/material.dart';

class PageDetailMovie extends StatelessWidget {
  //item Movie//
  final Map<String, dynamic> itemMovie;

  const PageDetailMovie(this.itemMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemMovie['judul'])),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRect(
                child: Image.asset(
                  itemMovie['gambar'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 350,
                ),
              ),
              SizedBox(height: 20),
              Text(
                itemMovie['judul'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Rp. ${itemMovie['harga']}",
                style: TextStyle(color: Colors.red),
              ),

            ],
          ),
        ),
      ),
    );
  }
}