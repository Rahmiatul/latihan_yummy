import 'package:flutter/material.dart';

class DetailDosen extends StatelessWidget {
  //variabel untuk menampung item movie
  final Map<String,dynamic> itemDosen;

  const DetailDosen(this.itemDosen,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemDosen['nidn']),
      ),
      body: Padding(padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset(itemDosen['gambar'],fit: BoxFit.cover,width: double.infinity, height: 350,),
              ),
              SizedBox(height: 20,),
              Text(itemDosen['nidn'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              SizedBox(height: 10,),
              Text(itemDosen['nama'], style: TextStyle( fontSize: 13),),
              Text(itemDosen['email'], style: TextStyle( fontSize: 13),),
              SizedBox(height: 15,),

            ],
          ),

        ),),
    );
  }
}