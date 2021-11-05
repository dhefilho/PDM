import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class SnakeServiceApiGet {
  SnakeServiceApiGet();

  Future<QueryDocumentSnapshot<Object>> consultaDado(
      String colecao, String atributo, String valorBuscado) async {
    CollectionReference users = FirebaseFirestore.instance.collection(colecao);
    List<QueryDocumentSnapshot> dados = await users
        .where(atributo, isEqualTo: valorBuscado)
        .get()
        .then((snapshot) => snapshot.docs);

    print(dados.first['chip']);

    return dados.first;
  }

  Future<String> downloadURL(String chip) async {
    String downloadURL = await FirebaseStorage.instance
        .ref('fotosSerpente/$chip.png')
        .getDownloadURL();

    return downloadURL;
  }
}
