import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobile/core/utils/dio/dio_provider.dart';
import 'package:mobile/data/datasources/remote/file.datasource.dart';
import 'package:path/path.dart';

class FileRepository {
  final FileRemoteDataSource fileRemoteDataSource;

  FileRepository({required this.fileRemoteDataSource});

  Future<HttpRequestResponse> downloadFile(String url) async {
    return await fileRemoteDataSource.downloadFile(url);
  }

  Future<String> uploadToFireStorage(FileType fileType, File file) async {
    UploadTask task;
    if (fileType == FileType.image) {
      task = FirebaseStorage.instance
          .ref('images/${basename(file.path)}')
          .putFile(file);
    } else if (fileType == FileType.video) {
      task = FirebaseStorage.instance
          .ref('videos/${basename(file.path)}')
          .putFile(file);
    } else {
      task = FirebaseStorage.instance
          .ref('files/${basename(file.path)}')
          .putFile(file);
    }
    final TaskSnapshot taskSnapshot = await task.whenComplete(() {});
    final String urlDownload = await taskSnapshot.ref.getDownloadURL();
    return urlDownload;
  }
}
