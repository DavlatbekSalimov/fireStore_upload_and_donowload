import 'package:app_up_download/pages/upload_page/upload_page.dart';
import 'package:flutter/material.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  @override
  Widget build(BuildContext context) {
    int currentindex = 0;
    // ignore: unused_element
    void ontap(int index) {
      setState(() {
        index = currentindex;
      });
    }

    List<Widget> pages = [
      const UploadPage(),
      const UploadPage(),
    ];

    return Scaffold(
      body: pages.elementAt(currentindex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          notchMargin: 15,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_upward_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_downward_sharp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
