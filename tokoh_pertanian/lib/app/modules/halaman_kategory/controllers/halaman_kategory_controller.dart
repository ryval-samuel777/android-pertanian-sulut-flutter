import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HalamanKategoryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData(String kategori) async {
    CollectionReference produkKategori = firestore.collection('TokoPertanian');

    return produkKategori.where('kategori', isEqualTo: kategori).get();
  }
}
