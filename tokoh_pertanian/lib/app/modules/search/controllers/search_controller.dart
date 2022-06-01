import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  //TODO: Implement SearchController

  // TODO: implement search querry from firebase

  late final TextEditingController name;
  @override
  void onInit() {
    name = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    super.onClose();
  }
}
