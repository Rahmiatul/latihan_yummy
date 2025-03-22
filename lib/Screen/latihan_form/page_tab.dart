import 'package:flutter/material.dart';
import 'package:flutter1/Screen/latihan_form/latihan_dosen.dart';
import 'package:flutter1/Screen/latihan_form/latihan_form.dart';



class PageTab extends StatefulWidget {
  const PageTab({super.key});

  @override
  State<PageTab> createState() => _PageTabState();
}

class _PageTabState extends State<PageTab> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Nav Bar', style: TextStyle(color: Colors.white)),
      ),
      body: TabBarView(controller: tabController, children: [Dosen(), LatihanDosen()]),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(controller: tabController,tabs: [
          Tab(text: 'Form Dosen', icon: Icon(Icons.input),),
          Tab(text: 'Form Data', icon: Icon(Icons.input),),

        ]),
      ),
    );
  }
}