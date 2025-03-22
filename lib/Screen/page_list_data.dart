import 'package:flutter/material.dart';
import 'package:flutter1/Screen/page_get_data.dart';

class PageListData extends StatelessWidget{
  const PageListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Page List Data'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return ListTile(
              title: Text('Judul Berita $index'),
              subtitle: Text('Detail Berita $index'),
              onTap: (){
                //proses pasing data
                //buat satu file untuk menampung data
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => PageGetData(index)
                ));
              },
            );
          }

      ),
    );
  }
}




