import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCardViewController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference produk = firestore.collection('TokoPertanian');

    return produk.get();
  }
}
