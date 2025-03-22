import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PageChache extends StatelessWidget {
  const PageChache({super.key});


  //untuk image asset
  //buat directori
  //masukin gambar
  //update di puspuck.yaml
  //kita pub get atau pub upgrade

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cache Image'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6zicR6ExuKdewdhwxZtp98oRIonyNRGRqfA&s",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}