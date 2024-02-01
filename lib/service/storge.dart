import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorgeService {
  //? instance
  static final storge = FirebaseStorage.instance;
  //?
  // ignore: prefer_const_declarations
  static final parentPath = 'User';
  //? create image
  static Future<String> uploadimage(
      {required String path, required File file}) async {
    //file path ni olish takrorlanmas nomda
    final image = storge
        .ref(path)
        .child('${DateTime.now().toIso8601String()}${file.path.substring(
          file.path.lastIndexOf('.'),
        )}');

    UploadTask task = image.putFile(file);
    await task.whenComplete(() {});
    return image.getDownloadURL();
  }

  static Future<List<String>> getAllImage({required String parentPath}) async {
    List<String> imagepathlist = [];
    Reference response = storge.ref(parentPath);
    ListResult item = await response.listAll();
    for (var e in item.items) {
      imagepathlist.add(await e.getDownloadURL());
    }
    return imagepathlist;
  }

  static Future<List<String>> getAllImageName(
      {required String parentPath}) async {
    List<String> imagepathlist = [];
    Reference response = storge.ref(parentPath);
    ListResult item = await response.listAll();
    for (var e in item.items) {
      imagepathlist.add(e.name);
    }
    return imagepathlist;
  }

  static Future<void> daleteImage({required String url}) async {
    final ref = storge.refFromURL(url);
    await ref.delete();
  }
}
