import 'package:get/get.dart';

import '../controllers/halaman_kategory_controller.dart';

class HalamanKategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HalamanKategoryController>(
      () => HalamanKategoryController(),
    );
  }
}
