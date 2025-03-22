import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'page_detail_berita.dart'; // Tambahkan import detail page

class PageListView extends StatefulWidget {
  const PageListView({super.key});

  @override
  State<PageListView> createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
  List<Map<String, dynamic>> listBerita = [
    {
      "judul": "Judul Berita Satu",
      "isi": "Lorem ipsum dolor sit amet...",
      "tanggal": "17 maret 2025",
      "gambar": "gambar/berita1.jpeg",
      "rating": 5
    },
    {
      "judul": "Judul Berita Dua",
      "isi": "Lorem ipsum dolor sit amet...",
      "tanggal": "18 maret 2025",
      "gambar": "gambar/berita2.jpeg",
      "rating": 4
    },
    {
      "judul": "Judul Berita Tiga",
      "isi": "Lorem ipsum dolor sit amet...",
      "tanggal": "19 maret 2025",
      "gambar": "gambar/berita3.jpeg",
      "rating": 3
    },
    {
      "judul": "Judul Berita Empat",
      "isi": "Lorem ipsum dolor sit amet...",
      "tanggal": "20 maret 2025",
      "gambar": "gambar/berita4.jpg",
      "rating": 2
    },
    {
      "judul": "Judul Berita Lima",
      "isi": "Lorem ipsum dolor sit amet...",
      "tanggal": "21 maret 2025",
      "gambar": "gambar/berita1.jpeg",
      "rating": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: listBerita.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigasi ke PageDetailBerita
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageDetailBerita(
                      judul: listBerita[index]['judul'],
                      tanggal: listBerita[index]['tanggal'],
                      gambar: listBerita[index]['gambar'],
                      rating: listBerita[index]['rating'],
                      isi: listBerita[index]['isi'],
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          listBerita[index]['gambar'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listBerita[index]['judul'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(listBerita[index]['tanggal']),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RatingBarIndicator(
                                rating: listBerita[index]['rating'].toDouble(),
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                itemCount: 5,
                                itemSize: 15,
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}