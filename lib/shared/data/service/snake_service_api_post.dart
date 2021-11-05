import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SnakeServiceApiPost {
  SnakeServiceApiPost();

  Future<bool> addDado({String colecao, Map<String, dynamic> map}) async {
    CollectionReference users = FirebaseFirestore.instance.collection(colecao);

    var dado = await users.add(map);
    print(dado.id);
    if (dado.id != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> uploadFile(Uint8List img, String chip) async {
    try {
      await FirebaseStorage.instance
          .ref('fotosSerpente/$chip.png')
          .putData(img);
    } on FirebaseException catch (e) {}
  }
}
