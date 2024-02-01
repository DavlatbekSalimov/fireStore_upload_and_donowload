import 'package:app_up_download/service/storge.dart';
import 'package:flutter/material.dart';

class TabImagePage extends StatefulWidget {
  const TabImagePage({super.key});

  @override
  State<TabImagePage> createState() => _TabImagePageState();
}

class _TabImagePageState extends State<TabImagePage> {
  List<String> imageslist = [];
  List<String> imageslistname = [];
  Future<void> getImagesList() async {
    imageslist =
        await StorgeService.getAllImage(parentPath: StorgeService.parentPath);
    imageslistname = await StorgeService.getAllImageName(
        parentPath: StorgeService.parentPath);
    setState(() {});
  }

  @override
  void initState() {
    getImagesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (contex, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(imageslistname[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.save_alt_outlined),
                    ),
                    IconButton(
                      onPressed: () async {
                        await StorgeService.daleteImage(
                          url: imageslist[index],
                        );
                        getImagesList();
                      },
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: imageslist.length,
      ),
    );
  }
}
