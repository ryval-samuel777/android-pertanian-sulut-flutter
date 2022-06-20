import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HalamanProdukController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('TokoPertanian').doc(docID);

    return docRef.get();
  }
}
