import 'package:app_up_download/pages/download_page/images_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonowloadPage extends StatefulWidget {
  const DonowloadPage({super.key});

  @override
  State<DonowloadPage> createState() => _DonowloadPageState();
}

class _DonowloadPageState extends State<DonowloadPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('DONOWLOADED'),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Icon(CupertinoIcons.music_note_2),
              ),
              Tab(
                child: Icon(Icons.image_outlined),
              ),
              Tab(
                child: Icon(Icons.folder_zip),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.grey.shade800,
            ),
            const TabImagePage(),
            Container(
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
