import 'dart:io';
import 'package:app_up_download/pages/download_page/download_page.dart';
import 'package:app_up_download/service/remoutconfig.dart';
import 'package:app_up_download/service/storge.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

final remoteConfig = FirebaseRemoteConfig.instance;

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  //! bu fun ma'lumot oluvchi
  File file = File('');
  Future<File> getImage() async {
    ImagePicker image = ImagePicker();
    XFile? xfile = await image.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      setState(() {
        File getfile = File(xfile.path);
        file = getfile;
      });
    }
    return file;
  }

  Future<String> uploaddata() async {
    String imagee = await StorgeService.uploadimage(
      path: StorgeService.parentPath,
      file: await getImage(),
    );
    return imagee;
  }

  String color = 'white';
  @override
  void initState() {
    BackgroundColor.onInit().then((value) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor.colors[BackgroundColor.backgroundColor],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TRANSFER',
          style: GoogleFonts.kings(
            textStyle: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: const Column(
        children: [],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.indigoAccent,
          shape: const CircleBorder(),
          onPressed: () {
            uploaddata();
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          color: Colors.amberAccent,
          notchMargin: 15,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => const DonowloadPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_downward_sharp),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_upward_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
