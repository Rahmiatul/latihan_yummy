import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PageDetailBerita extends StatelessWidget {
  final String judul;
  final String tanggal;
  final String gambar;
  final int rating;
  final String isi;

  const PageDetailBerita({
    super.key,
    required this.judul,
    required this.tanggal,
    required this.gambar,
    required this.rating,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // Biar gak mentok ke atas layar
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // Balik ke halaman sebelumnya
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Detail Berita",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            //  Isi konten berita (scrollable)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar besar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        gambar,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Judul + rating bar
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            judul,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        RatingBarIndicator(
                          rating: rating.toDouble(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          itemCount: 5,
                          itemSize: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Tanggal
                    Text(
                      tanggal,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),

                    // Isi berita
                    Text(
                      isi,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
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