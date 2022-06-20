import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HalamanTokohController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData(String toko) async {
    CollectionReference produkKategori = firestore.collection('TokoPertanian');

    return produkKategori.where('toko', isEqualTo: toko).get();
  }
}
