import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  // TODO: implement search querry from firebase

  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String query) async {
    return FirebaseFirestore.instance
        .collection('TokoPertanian')
        .where('nama', isGreaterThanOrEqualTo: query)
        .get();
  }

  // late final TextEditingController name;
  // @override
  // void onInit() {
  //   name = TextEditingController();
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   name.dispose();
  //   super.onClose();
  // }
}
