import 'package:flutter/material.dart';
import 'package:flutter1/nav_bar/page_detail_movie.dart';

class PageGridView extends StatefulWidget {
  const PageGridView({super.key});

  @override
  State<PageGridView> createState() => _PageGridViewState();
}

class _PageGridViewState extends State<PageGridView> {
  //data list movie
  List<Map<String, dynamic>> listMovie = [
    {"judul": "Ciao Alberto", "gambar": "gambar/movie1.jpg", "harga": 45000},
    {"judul": "The Simson", "gambar": "gambar/movie2.png", "harga": 57000},
    {"judul": "Jungle Croise", "gambar": "gambar/movie3.jpg", "harga": 65000},
    {"judul": "Home Alone", "gambar": "gambar/movie4.jpg", "harga": 70000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: GridView.builder(
          itemCount: listMovie.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => PageDetailMovie(listMovie[index])));
              },
              child: Column(
                children: [
                  Expanded(
                    child: ClipRect(
                      child: Image.asset(
                        listMovie[index]["gambar"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: Colors.black)
                    ),
                    child: Column(
                      children: [
                        Text(listMovie[index]["judul"],style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text("Rp. ${listMovie[index]["harga"]}"),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}