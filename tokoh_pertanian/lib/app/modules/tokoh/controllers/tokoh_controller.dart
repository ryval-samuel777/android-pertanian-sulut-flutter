import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TokoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData(String toko) async {
    CollectionReference tokoPe = firestore.collection('toko');

    return tokoPe
        .orderBy(
          'namaToko',
        )
        .get();
  }
}
