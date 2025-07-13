import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

class MiscEndpoint extends Endpoint {
  Future<String> uploadImage(
      Session session, ByteData imageData, String filename) async {
    String path = "/uploads/$filename";
    // ignore: unused_local_variable
    final file = await session.storage
        .storeFile(storageId: "public", path: path, byteData: imageData);
    final verify =
        await session.storage.fileExists(storageId: "public", path: path);
    if (verify) {
      print("Image Uploaded Successfully");
      var uri =
          await session.storage.getPublicUrl(storageId: "public", path: path);
      return uri.toString();
    }
    return "";
  }

  // In your endpoint:
  Future<String?> getUploadDescription(Session session, String path) =>
      session.storage.createDirectFileUploadDescription(
        storageId: 'public',
        path: path,
      );
}
